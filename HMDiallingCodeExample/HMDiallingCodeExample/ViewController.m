//
//  ViewController.m
//  HMDiallingCodeExample
//
//  Created by Hesham Abd-Elmegid on 3/12/12.
//  Copyright (c) 2012 Hesham Abd-Elmegid. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.diallingCode = [[HMDiallingCode alloc] initWithDelegate:self];
}

- (IBAction)getCodeForCurrentLocationButtonTapped:(id)sender {
    self.diallingCode = [[HMDiallingCode alloc] initWithDelegate:self];
    [self.diallingCode getDiallingCodeForCurrentLocation];
}

- (IBAction)getCodeForLocationTapped:(id)sender {
    [self.diallingCode getDiallingCodeForCountry:self.countryCodeTextField.text];
    [self.countryCodeTextField resignFirstResponder];
}

- (IBAction)getCountriesForCodeTapped:(id)sender {
    [self.diallingCode getCountriesWithDiallingCode:self.diallingCodeTextField.text];
    [self.diallingCodeTextField resignFirstResponder];
}

#pragma mark - HMDiallingCodeDelegate

- (void)didGetDiallingCode:(NSString *)diallingCode forCountry:(NSString *)countryCode {
    self.resultsLabel.text = [NSString stringWithFormat:@"Country code: %@\nDialling code %@", countryCode, diallingCode];
}

- (void)didGetCountries:(NSArray *)countries forDiallingCode:(NSString *)diallingCode {
    self.resultsLabel.text = [NSString stringWithFormat:@"Dialling code: %@\nCountries: %@", diallingCode, [countries componentsJoinedByString:@", "]];
}

- (void)failedToGetDiallingCode {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil message:@"Whoops! Something went wrong." delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alert show];
}

@end
