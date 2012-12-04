//
//  HMLocationManager.h
//
//  Created by Hesham Abd-Elmegid on 26/11/12.
//  Copyright (c) 2012 Hesham Abd-Elmegid. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol HMDiallingCodeDelegate <NSObject>

- (void)didGetDiallingCode:(NSString *)diallingCode forCountry:(NSString *)country;
- (void)failedToGetDiallingCode;

@end

@interface HMDiallingCode : NSObject <CLLocationManagerDelegate>

- (id)initWithDelegate:(id<HMDiallingCodeDelegate>)delegate;
- (void)getDiallingCode;

@property (nonatomic, assign) id<HMDiallingCodeDelegate> delegate;

@end
