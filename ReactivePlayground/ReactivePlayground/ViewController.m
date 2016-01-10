//
//  ViewController.m
//  ReactivePlayground
//
//  Created by QC.L on 16/1/8.
//  Copyright © 2016年 QC.L. All rights reserved.
//

#import "ViewController.h"
#import "RectiveManager.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userNameText;
@property (weak, nonatomic) IBOutlet UITextField *passWordText;
@property (weak, nonatomic) IBOutlet UIButton *signIn;
@property (weak, nonatomic) IBOutlet UILabel *signInFailureLabel;

@property (nonatomic, assign) BOOL passwordIsValid;
@property (nonatomic, assign) BOOL usernameIsValid;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 看一遍Demo和自己手敲一遍的感觉是不一样的!
    [self updateUIState];
    
    [self.userNameText addTarget:self action:@selector(userNameTextChange) forControlEvents:UIControlEventEditingChanged];
    [self.passWordText addTarget:self action:@selector(passWordTextChange) forControlEvents:UIControlEventEditingChanged];
    
    self.signInFailureLabel.hidden = YES;
    
}



- (void)userNameTextChange
{
    self.usernameIsValid = [self isValidUsername:self.userNameText.text];
    [self updateUIState];
}

- (void)passWordTextChange
{
    self.passwordIsValid = [self isValidPassword:self.passWordText.text];
    [self updateUIState];
}

- (BOOL)isValidUsername:(NSString *)userName
{
    return userName.length > 6;
}

- (BOOL)isValidPassword:(NSString *)password
{
    return password.length > 6;
}

- (void)updateUIState
{
    self.userNameText.backgroundColor = self.usernameIsValid ? [UIColor whiteColor] : [UIColor yellowColor];
    self.passWordText.backgroundColor = self.passwordIsValid ? [UIColor whiteColor] : [UIColor yellowColor];
    self.signIn.enabled = self.usernameIsValid && self.passwordIsValid;
    
}

- (IBAction)signInTouchUp:(id)sender {
    
    self.signIn.enabled = NO;
    self.signInFailureLabel.hidden = YES;
    
    [RectiveManager signInWithUsername:self.userNameText.text password:self.passWordText.text complete:^(BOOL isSuccess) {
        self.signIn.enabled = YES;
        self.signInFailureLabel.hidden = isSuccess;
        if (isSuccess) {
            [self performSegueWithIdentifier:@"signInSuccess" sender:self];
        }
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
