//
//  SignInViewController.m
//  MojioiOSExampleOAuth2
//
//  Created by Ye Ma on 2015-06-30.
//  Copyright (c) 2015 Ye Ma. All rights reserved.
//

#import "SignInViewController.h"
#import "MojioClient.h"

@interface SignInViewController ()
@property (weak, nonatomic) IBOutlet UITextField *txtUserName;
@property (weak, nonatomic) IBOutlet UITextField *txtPassword;

@end

@implementation SignInViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogin:(id)sender {
    
    __weak SignInViewController *weakself = self;
    [[MojioClient client] loginUserWithUsername:self.txtUserName.text withPassword:self.txtPassword.text withCompletionBlock:^(id response) {
        //successfully logged in, dismiss and return to home screen
        [weakself dismissViewControllerAnimated:YES completion:nil];
    } failure:^{
        //
    }];
}

- (IBAction)onCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
