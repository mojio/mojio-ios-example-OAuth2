//
//  ViewController.m
//  MojioiOSExampleOAuth2
//
//  Created by Ye Ma on 2015-06-30.
//  Copyright (c) 2015 Ye Ma. All rights reserved.
//

#import "ViewController.h"
#import "MojioClient.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];

    //update button base on user login status
    [self updateLoginButton];
}

- (void)updateLoginButton
{
    NSString *loggedInStatusText = [[MojioClient client] isUserLoggedIn]? @"Logout" : @"Login";
    [self.loginButton setTitle:loggedInStatusText forState:UIControlStateNormal];
}

-(BOOL)shouldPerformSegueWithIdentifier:(NSString *)identifier sender:(id)sender
{
    if([identifier isEqualToString:@"showLoginScreen"] && [[MojioClient client] isUserLoggedIn])
    {
        __weak ViewController *weakself = self;
        [[MojioClient client] logoutWithCompletionBlock:^{
            //logged out successfully
            [weakself updateLoginButton];
        }];
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
