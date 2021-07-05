//
//  ViewController.m
//  task7
//
//  Created by Alexander Karenski on 4.07.21.
//

#import "ViewController.h"
#import "ColorExtensions.h"

@interface ViewController ()
@property (weak) UILabel * rsSchoolLabel;
@property (weak) UITextField * loginTextField;
@property (weak) UITextField * passwordTextField;
@property (weak) UIButton * authorizeButton;
@property (weak) UILabel * additionalLabel;
@property (weak) UIView *viewAdditional;
@property (weak) UIButton * buttonOne;
@property (weak) UIButton * buttonTwo;
@property (weak) UIButton * buttonThree;

@property NSMutableString * checkAdditionalString;

@end

@implementation ViewController


- (void)createRsSchoolLabel {
    UILabel *rsSchoolLabel = [UILabel new];
    rsSchoolLabel.textColor = [UIColor blackColor];
    rsSchoolLabel.font = [UIFont systemFontOfSize:36.0 weight:UIFontWeightBold];
    rsSchoolLabel.numberOfLines = 1;
    rsSchoolLabel.text = @"RSSchool";
    
    rsSchoolLabel.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:rsSchoolLabel];
    
    [NSLayoutConstraint constraintWithItem:rsSchoolLabel
                                 attribute:NSLayoutAttributeTop
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeTop
                                multiplier:1.0
                                  constant:80].active = YES;
    [NSLayoutConstraint constraintWithItem:rsSchoolLabel
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:self.view
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0
                                  constant:0].active = YES;
    _rsSchoolLabel = rsSchoolLabel;
}


- (void) createAdditionalVerification{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(70.0, 510.0, 240.0, 115.0)];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(102.5, 15, 32, 22)];
    UIButton *buttonOne = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *buttonTwo = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *buttonThree = [UIButton buttonWithType:UIButtonTypeCustom];
    
    label.textColor = [UIColor blackColor];
    label.font = [UIFont boldSystemFontOfSize:(18.0)];
    label.numberOfLines = 1;
    label.text = @"-";
    label.textAlignment = NSTextAlignmentCenter;
    
    [buttonOne addTarget:self
                  action:@selector(checkOneDidTap)
        forControlEvents:UIControlEventTouchUpInside];
    [buttonOne addTarget:self
                  action:@selector(checkOneTouchDown)
        forControlEvents:UIControlEventTouchDown];
    [buttonOne addTarget:self
                  action:@selector(checkOneTouchDragExit)
        forControlEvents:UIControlEventTouchDragExit];
    [buttonOne setTitle:@"1" forState:UIControlStateNormal];
    buttonOne.frame = CGRectMake(23, 45, 50.0, 50.0);
    buttonOne.layer.borderWidth = 2.0;
    buttonOne.layer.cornerRadius = buttonOne.frame.size.width / 2.0;
    buttonOne.layer.borderColor = [[UIColor rsLittleBoyBlue:1.0] CGColor];
    buttonOne.titleLabel.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightSemibold];
    [buttonOne setTitleColor:[UIColor rsLittleBoyBlue:1.0] forState:UIControlStateNormal];
    
    [buttonTwo addTarget:self
                  action:@selector(checkTwoDidTap)
        forControlEvents:UIControlEventTouchUpInside];
    [buttonTwo addTarget:self
                  action:@selector(checkTwoTouchDown)
        forControlEvents:UIControlEventTouchDown];
    [buttonTwo addTarget:self
                  action:@selector(checkTwoTouchDragExit)
        forControlEvents:UIControlEventTouchDragExit];
    [buttonTwo setTitle:@"2" forState:UIControlStateNormal];
    buttonTwo.frame = CGRectMake(93, 45, 50.0, 50.0);
    buttonTwo.layer.borderWidth = 2.0;
    buttonTwo.layer.cornerRadius = buttonOne.frame.size.width / 2.0;
    buttonTwo.layer.borderColor = [[UIColor rsLittleBoyBlue:1.0] CGColor];
    buttonTwo.titleLabel.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightSemibold];

    [buttonTwo setTitleColor:[UIColor rsLittleBoyBlue:1.0] forState:UIControlStateNormal];
    
    [buttonThree addTarget:self
                    action:@selector(checkThreeDidTap)
          forControlEvents:UIControlEventTouchUpInside];
    [buttonThree addTarget:self
                    action:@selector(checkThreeTouchDown)
          forControlEvents:UIControlEventTouchDown];
    [buttonThree addTarget:self
                  action:@selector(checkThreeTouchDragExit)
        forControlEvents:UIControlEventTouchDragExit];
    [buttonThree setTitle:@"3" forState:UIControlStateNormal];
    buttonThree.frame = CGRectMake(163, 45, 50.0, 50.0);
    buttonThree.layer.borderWidth = 2.0;
    buttonThree.layer.cornerRadius = buttonOne.frame.size.width / 2.0;
    buttonThree.layer.borderColor = [[UIColor rsLittleBoyBlue:1.0] CGColor];
    buttonThree.titleLabel.font = [UIFont systemFontOfSize:24.0 weight:UIFontWeightSemibold];

    [buttonThree setTitleColor:[UIColor rsLittleBoyBlue:1.0] forState:UIControlStateNormal];
    
    view.layer.borderWidth = 2.0;
    view.layer.cornerRadius = 10.0;
    
    view.layer.borderColor = [[UIColor whiteColor] CGColor];
    
    [view addSubview:label];
    [view addSubview:buttonOne];
    [view addSubview:buttonTwo];
    [view addSubview:buttonThree];
    
    _additionalLabel = label;
    _viewAdditional = view;
    _buttonOne = buttonOne;
    _buttonTwo = buttonTwo;
    _buttonThree = buttonThree;
    
    [self.view addSubview:view];
}


- (void)createLoginAndPasswordFields {
    UITextField *loginTextField = [[UITextField alloc] initWithFrame:CGRectMake(36.0, 200.0, 300.0, 34.0)];
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(36.0, 264.0, 300.0, 34.0)];
    UIButton *authorizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (@available(iOS 13.0, *)) {
        UIImage *image = [UIImage systemImageNamed:@"person"];
        UIImage *imageFill = [UIImage systemImageNamed:@"person.fill"];
        [authorizeButton setImage:image forState:UIControlStateNormal];
        [authorizeButton setImage:imageFill forState:UIControlStateHighlighted];
        CGFloat spacing = 5; // the amount of spacing to appear between image and title
        authorizeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    } else {
        UIImage *image = [UIImage imageNamed:@"person"];
        UIImage *imageFill = [UIImage imageNamed:@"person.fill"];
        [authorizeButton setImage:image forState:UIControlStateNormal];
        [authorizeButton setImage:imageFill forState:UIControlStateHighlighted];
        CGFloat spacing = 5; // the amount of spacing to appear between image and title
        authorizeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    }
    
    [authorizeButton addTarget:self
                        action:@selector(checkAuthDidTap)
              forControlEvents:UIControlEventTouchUpInside];
    [authorizeButton setTitle:@"Authorize" forState:UIControlStateNormal];
    [authorizeButton addTarget:self
                        action:@selector(checkAuthTouchDown)
              forControlEvents:UIControlEventTouchDown];
    [authorizeButton addTarget:self
                        action:@selector(checkAuthDragExit)
              forControlEvents:UIControlEventTouchDragExit];
    authorizeButton.frame = CGRectMake(110.0, 344.0, 156.0, 42.0);
    authorizeButton.layer.borderWidth = 2.0;
    authorizeButton.layer.cornerRadius = 10.0;
    authorizeButton.layer.borderColor = [[UIColor rsLittleBoyBlue:1.0] CGColor];
    authorizeButton.titleLabel.font = [UIFont systemFontOfSize:20.0 weight:UIFontWeightSemibold];
    
    [authorizeButton setTitleColor:[UIColor rsLittleBoyBlue:1.00] forState:UIControlStateNormal];
    [authorizeButton setTitleColor:[UIColor rsLittleBoyBlue:0.4] forState:UIControlStateHighlighted];
    
    loginTextField.borderStyle = UITextBorderStyleRoundedRect;
    loginTextField.font = [UIFont systemFontOfSize:15];
    loginTextField.placeholder = @"Login";
    loginTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    loginTextField.textContentType = UITextContentTypeUsername;
    loginTextField.keyboardType = UIKeyboardTypeDefault;
    loginTextField.returnKeyType = UIReturnKeyDone;
    loginTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    loginTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    loginTextField.layer.borderWidth = 1.5;
    loginTextField.layer.cornerRadius = 5.0;
    loginTextField.layer.borderColor = [[UIColor rsBlackCoral] CGColor];
    
    passwordTextField.borderStyle = UITextBorderStyleRoundedRect;
    passwordTextField.font = [UIFont systemFontOfSize:15];
    passwordTextField.placeholder = @"Password";
    passwordTextField.autocorrectionType = UITextAutocorrectionTypeNo;
    passwordTextField.keyboardType = UIKeyboardTypeDefault;
    passwordTextField.textContentType = UITextContentTypePassword;
    passwordTextField.secureTextEntry = YES;
    passwordTextField.returnKeyType = UIReturnKeyDone;
    passwordTextField.clearButtonMode = UITextFieldViewModeWhileEditing;
    passwordTextField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    passwordTextField.layer.borderWidth = 1.5;
    passwordTextField.layer.cornerRadius = 5.0;
    passwordTextField.layer.borderColor = [[UIColor rsBlackCoral] CGColor];
    
    [self.view addSubview:loginTextField];
    [self.view addSubview:passwordTextField];
    [self.view addSubview:authorizeButton];
    
    _loginTextField = loginTextField;
    _passwordTextField = passwordTextField;
    _authorizeButton = authorizeButton;
    
//
//    [NSLayoutConstraint constraintWithItem:loginTextField
//                                 attribute:NSLayoutAttributeLeading
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeLeading
//                                multiplier:1.0
//                                  constant:36.0].active = YES;
//    [NSLayoutConstraint constraintWithItem:loginTextField
//                                 attribute:NSLayoutAttributeTop
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeTop
//                                multiplier:1.0
//                                  constant:0].active = YES;
//    [NSLayoutConstraint constraintWithItem:loginTextField
//                                 attribute:NSLayoutAttributeTrailing
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeTrailing
//                                multiplier:1.0
//                                  constant:36.0].active = YES;
//
//    [NSLayoutConstraint constraintWithItem:passwordTextField
//                                 attribute:NSLayoutAttributeLeading
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeLeading
//                                multiplier:1.0
//                                  constant:36.0].active = YES;
//    [NSLayoutConstraint constraintWithItem:passwordTextField
//                                 attribute:NSLayoutAttributeTop
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:loginTextField
//                                 attribute:NSLayoutAttributeTop
//                                multiplier:1.0
//                                  constant:30.0].active = YES;
//    [NSLayoutConstraint constraintWithItem:passwordTextField
//                                 attribute:NSLayoutAttributeTrailing
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeTrailing
//                                multiplier:1.0
//                                  constant:36.0].active = YES;
//
//    [NSLayoutConstraint constraintWithItem:authorizeButton
//                                 attribute:NSLayoutAttributeLeading
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeLeading
//                                multiplier:1.0
//                                  constant:110.0].active = YES;
//    [NSLayoutConstraint constraintWithItem:authorizeButton
//                                 attribute:NSLayoutAttributeTop
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeTop
//                                multiplier:1.0
//                                  constant:60.0].active = YES;
//    [NSLayoutConstraint constraintWithItem:authorizeButton
//                                 attribute:NSLayoutAttributeTrailing
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeTrailing
//                                multiplier:1.0
//                                  constant:110.0].active = YES;
//
//    [NSLayoutConstraint constraintWithItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeCenterX
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.view
//                                 attribute:NSLayoutAttributeCenterX
//                                multiplier:1.0
//                                  constant:0].active = YES;
//    [NSLayoutConstraint constraintWithItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeCenterY
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.view
//                                 attribute:NSLayoutAttributeCenterY
//                                multiplier:1.0
//                                  constant:0].active = YES;
//    [NSLayoutConstraint constraintWithItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeTrailing
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.view
//                                 attribute:NSLayoutAttributeTrailing
//                                multiplier:1.0
//                                  constant:0].active = YES;
//    [NSLayoutConstraint constraintWithItem:loginAndPasswordView
//                                 attribute:NSLayoutAttributeLeading
//                                 relatedBy:NSLayoutRelationEqual
//                                    toItem:self.view
//                                 attribute:NSLayoutAttributeLeading
//                                multiplier:1.0
//                                  constant:0].active = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createRsSchoolLabel];
    [self createLoginAndPasswordFields];
    [self createAdditionalVerification];
    
    _loginTextField.delegate = self;
    _passwordTextField.delegate = self;
    
    self.view.backgroundColor = [UIColor whiteColor];
    _checkAdditionalString = [NSMutableString stringWithString:@""];
    [_viewAdditional setHidden:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}

- (void)stateReady{
    _passwordTextField.layer.borderColor = [[UIColor rsBlackCoral] CGColor];
    _loginTextField.layer.borderColor = [[UIColor rsBlackCoral] CGColor];
    
    [_passwordTextField setEnabled:YES];
    [_loginTextField setEnabled:YES];
    [_authorizeButton setEnabled:YES];
    
    _passwordTextField.alpha = 1.0;
    _loginTextField.alpha = 1.0;
    _authorizeButton.alpha = 1.0;
    
    _loginTextField.text = nil;
    _passwordTextField.text = nil;
    
    _additionalLabel.text = @"-";
    _checkAdditionalString = [NSMutableString stringWithString:@""];
    _viewAdditional.layer.borderColor = [[UIColor whiteColor] CGColor];
    [_viewAdditional setHidden:YES];
}

- (void)stateError{
    _passwordTextField.layer.borderColor = [[UIColor rsVenetialRed] CGColor];
    _loginTextField.layer.borderColor = [[UIColor rsVenetialRed] CGColor];
}

- (void)stateSuccess{
    _passwordTextField.layer.borderColor = [[UIColor rsTorquoiseGreen] CGColor];
    _loginTextField.layer.borderColor = [[UIColor rsTorquoiseGreen] CGColor];
    
    _passwordTextField.alpha = 0.5;
    _loginTextField.alpha = 0.5;
    _authorizeButton.alpha = 0.5;
    
    [_passwordTextField setEnabled:NO];
    [_loginTextField setEnabled:NO];
    [_authorizeButton setEnabled:NO];

    [_viewAdditional setHidden:NO];
}

- (void)checkAuthDidTap{
    _authorizeButton.backgroundColor = [UIColor whiteColor];
    
    if([_loginTextField.text  isEqual: @"username"] &&
       [_passwordTextField.text  isEqual: @"password"]){
        [self stateSuccess];
    } else {
        [self stateError];
    }
}

- (void)checkAuthTouchDown{
    _authorizeButton.backgroundColor = [UIColor rsLittleBoyBlue:0.2];
}

- (void)checkAuthDragExit{
    _authorizeButton.backgroundColor = [UIColor whiteColor];
}

- (void)checkOneTouchDown{
    _buttonOne.backgroundColor = [UIColor rsLittleBoyBlue:0.2];
}
- (void)checkTwoTouchDown{
    _buttonTwo.backgroundColor = [UIColor rsLittleBoyBlue:0.2];
}
- (void)checkThreeTouchDown{
    _buttonThree.backgroundColor = [UIColor rsLittleBoyBlue:0.2];
}
- (void)checkOneTouchDragExit{
    _buttonOne.backgroundColor = [UIColor whiteColor];
}
- (void)checkTwoTouchDragExit{
    _buttonTwo.backgroundColor = [UIColor whiteColor];
}
- (void)checkThreeTouchDragExit{
    _buttonThree.backgroundColor = [UIColor whiteColor];
}

- (void)stateErrorForAdditional{
    _checkAdditionalString = [NSMutableString stringWithString:@""];
    _additionalLabel.text = @"-";
    _viewAdditional.layer.borderColor = [[UIColor rsVenetialRed] CGColor];
}

- (void)stateSeccuessForAdditional{
    [_additionalLabel setText: _checkAdditionalString];
    _viewAdditional.layer.borderColor = [[UIColor rsTorquoiseGreen] CGColor];
    
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil
                                                                   message:@"Welcome!"
                                                            preferredStyle:UIAlertControllerStyleAlert];

    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Refresh"
                                                            style:UIAlertActionStyleDestructive
                                                          handler:^(UIAlertAction * action) {
        [self stateReady];
    }];

    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)checkOneDidTap{
    [_checkAdditionalString appendString:@"1"];
    [self checkedAdditional];
    _buttonOne.backgroundColor = [UIColor whiteColor];
}

- (void)checkTwoDidTap{
    [_checkAdditionalString appendString:@"2"];
    [self checkedAdditional];
    _buttonTwo.backgroundColor = [UIColor whiteColor];
}

- (void)checkThreeDidTap{
    [_checkAdditionalString appendString:@"3"];
    [self checkedAdditional];
    _buttonThree.backgroundColor = [UIColor whiteColor];
}


- (void) checkedAdditional {
    if (_checkAdditionalString.length > 2){
        if(![_checkAdditionalString isEqual:@"132"]){
            [self stateErrorForAdditional];
        } else if ([_checkAdditionalString isEqual:@"132"]){
            [self stateSeccuessForAdditional];
        }
    } else {
        [_additionalLabel setText: _checkAdditionalString];
    }
}

@end
