//
//  HMLocationManager.m
//
//  Created by Hesham Abd-Elmegid on 26/11/12.
//  Copyright (c) 2012 Hesham Abd-Elmegid. All rights reserved.
//

#import "HMDiallingCode.h"

@interface HMDiallingCode ()

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, strong) CLLocation *currentLocation;
@property (nonatomic, strong) NSDictionary *diallingCodesDictionary;

- (void)geocodeLocation:(CLLocation *)location;
- (NSString *)diallingCodeForCountry:(NSString *)country;
@end

@implementation HMDiallingCode

- (id)initWithDelegate:(id<HMDiallingCodeDelegate>)delegate {
    self.delegate  = delegate;
    
    return [self init];
}

- (id)init {
    self = [super init];
    if (self != nil) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        
        NSString * plistPath = [[NSBundle mainBundle] pathForResource:@"DiallingCodes" ofType:@"plist"];
        self.diallingCodesDictionary = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    }
    return self;
}

- (void)getDiallingCode {
    [self.locationManager startUpdatingLocation];
}

- (void)geocodeLocation:(CLLocation *)location {
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:location completionHandler:^(NSArray *placemarks, NSError *error) {
        [placemarks enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            CLPlacemark *aPlacemark = (CLPlacemark *)obj;
            NSString *country = aPlacemark.ISOcountryCode;
            NSString *diallingCode = [self diallingCodeForCountry:country];
            
            if (diallingCode && diallingCode.length > 0) {
                if ([self.delegate respondsToSelector:@selector(didGetDiallingCode:forCountry:)])
                    [self.delegate didGetDiallingCode:diallingCode forCountry:country];
            } else {
                if ([self.delegate respondsToSelector:@selector(failedToGetDiallingCode)])
                    [self.delegate failedToGetDiallingCode];
            }
        }];
        
    }];
}

- (NSString *)diallingCodeForCountry:(NSString *)country {
    return [self.diallingCodesDictionary objectForKey:[country lowercaseString]];
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation {
    [self.locationManager stopUpdatingLocation];
    
    // Return if we already have a location or if the returned location is invaled
    if (self.currentLocation || newLocation.horizontalAccuracy < 0)
        return;
    
    self.currentLocation = newLocation;
    [self geocodeLocation:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    if ([self.delegate respondsToSelector:@selector(failedToGetDiallingCode)])
        [self.delegate failedToGetDiallingCode];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status {
    if (status == kCLAuthorizationStatusAuthorized)
        [self.locationManager startUpdatingLocation];
}

@end
