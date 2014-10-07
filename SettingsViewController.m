//
//  SettingsViewController.m
//  tipcalculator
//
//  Created by Kent Tam on 10/5/14.
//  Copyright (c) 2014 Kent Tam. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
- (IBAction)onTap:(id)sender;
- (void)updateDefaultTip;
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTipControl;

@end

@implementation SettingsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.edgesForExtendedLayout = UIRectEdgeNone;
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    int intValue = [defaults integerForKey:@"tipIndex"];
    [self.defaultTipControl setSelectedSegmentIndex:intValue];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onTap:(id)sender {
    [self.view endEditing:YES];
    [self updateDefaultTip];
}

- (void)updateDefaultTip {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:self.defaultTipControl.selectedSegmentIndex forKey:@"tipIndex"];
    [defaults synchronize];
}


@end
