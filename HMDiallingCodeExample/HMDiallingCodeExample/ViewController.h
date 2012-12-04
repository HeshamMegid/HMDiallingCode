//
//  ViewController.h
//  HMDiallingCodeExample
//
//  Created by Hesham Abd-Elmegid on 3/12/12.
//  Copyright (c) 2012 Hesham Abd-Elmegid. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HMDiallingCode.h"

@interface ViewController : UIViewController <HMDiallingCodeDelegate>

- (IBAction)getCodeForCurrentLocationButtonTapped:(id)sender;
- (IBAction)getCodeForLocationTapped:(id)sender;
- (IBAction)getCountriesForCodeTapped:(id)sender;

@property (strong, nonatomic) HMDiallingCode *diallingCode;
@property (weak, nonatomic) IBOutlet UITextField *countryCodeTextField;
@property (weak, nonatomic) IBOutlet UITextField *diallingCodeTextField;
@property (weak, nonatomic) IBOutlet UILabel *resultsLabel;

@end
