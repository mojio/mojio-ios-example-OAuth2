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
    [self.txtUserName becomeFirstResponder];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onLogin:(id)sender
{
    NSString *username = self.txtUserName.text;
    NSString *password = self.txtPassword.text;
    
    if ([username isEqualToString:@""] || [password isEqualToString:@""]) {
        [self showInvalidUsernamePasswordAlert];
        return;
    }
    
    __weak SignInViewController *weakself = self;
    [[MojioClient client] loginUserWithUsername:username withPassword:password withCompletionBlock:^(id response) {
        //successfully logged in, dismiss and return to home screen
        [weakself dismissViewControllerAnimated:YES completion:nil];
    } failure:^{
        //
        [self showInvalidUsernamePasswordAlert];
    }];
}

- (IBAction)onCancel:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)showInvalidUsernamePasswordAlert
{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Warning" message:@"Incorrect username/password" preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        //
    }];
    
    [alertController addAction:okAction];
    
    [self presentViewController:alertController animated:YES completion:nil];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}

@end
