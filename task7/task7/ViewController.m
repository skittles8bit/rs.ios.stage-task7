//
//  ViewController.m
//  task7
//
//  Created by Alexander Karenski on 4.07.21.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak) UILabel * rsSchoolLabel;
@property (weak) UITextField * loginTextField;
@property (weak) UITextField * passwordTextField;
@property (weak) UIButton * authorizeButton;
@property (weak) UILabel * additionalLabel;
@property (weak) UIView *viewAdditional;

@property NSMutableString * checkAdditionalString;
@end

@implementation ViewController

- (void)createRsSchoolLabel {
    UILabel *rsSchoolLabel = [UILabel new];
    rsSchoolLabel.backgroundColor = [UIColor clearColor];
    rsSchoolLabel.textColor = [UIColor blackColor];
    rsSchoolLabel.font = [UIFont boldSystemFontOfSize:(36.0)];
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
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(40.0, 395.0, 240.0, 115.0)];
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
    [buttonOne setTitle:@"1" forState:UIControlStateNormal];
    buttonOne.frame = CGRectMake(23, 45, 50.0, 50.0);
    buttonOne.layer.borderWidth = 2.0;
    buttonOne.layer.cornerRadius = buttonOne.frame.size.width / 2.0;
    buttonOne.layer.borderColor = [[UIColor systemBlueColor] CGColor];
    [buttonOne setTitleColor:[UIColor colorWithRed:0.0
                                             green:0.0
                                              blue:1.0
                                             alpha:1.0]
                                            forState:UIControlStateNormal];
    
    [buttonTwo addTarget:self
                        action:@selector(checkTwoDidTap)
              forControlEvents:UIControlEventTouchUpInside];
    [buttonTwo setTitle:@"2" forState:UIControlStateNormal];
    buttonTwo.frame = CGRectMake(93, 45, 50.0, 50.0);
    buttonTwo.layer.borderWidth = 2.0;
    buttonTwo.layer.cornerRadius = buttonOne.frame.size.width / 2.0;
    buttonTwo.layer.borderColor = [[UIColor systemBlueColor] CGColor];
    [buttonTwo setTitleColor:[UIColor colorWithRed:0.0
                                             green:0.0
                                              blue:1.0
                                             alpha:1.0]
                                            forState:UIControlStateNormal];
    
    [buttonThree addTarget:self
                        action:@selector(checkThreeDidTap)
              forControlEvents:UIControlEventTouchUpInside];
    [buttonThree setTitle:@"3" forState:UIControlStateNormal];
    buttonThree.frame = CGRectMake(163, 45, 50.0, 50.0);
    buttonThree.layer.borderWidth = 2.0;
    buttonThree.layer.cornerRadius = buttonOne.frame.size.width / 2.0;
    buttonThree.layer.borderColor = [[UIColor systemBlueColor] CGColor];
    [buttonThree setTitleColor:[UIColor colorWithRed:0.0
                                             green:0.0
                                              blue:1.0
                                             alpha:1.0]
                                            forState:UIControlStateNormal];
    [view addSubview:label];
    [view addSubview:buttonOne];
    [view addSubview:buttonTwo];
    [view addSubview:buttonThree];
    
    _additionalLabel = label;
    _viewAdditional = view;
    
    [self.view addSubview:view];
}


- (void)createLoginAndPasswordFields {
    UITextField *loginTextField = [[UITextField alloc] initWithFrame:CGRectMake(36.0, 200.0, 250.0, 34.0)];
    UITextField *passwordTextField = [[UITextField alloc] initWithFrame:CGRectMake(36.0, 268.0, 250.0, 34.0)];
    UIButton *authorizeButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if (@available(iOS 13.0, *)) {
        UIImage *image = [UIImage systemImageNamed:@"person"];
        UIImage *imageFill = [UIImage systemImageNamed:@"person.fill"];
        [authorizeButton setImage:image forState:UIControlStateNormal];
        [authorizeButton setImage:imageFill forState:UIControlStateHighlighted];
        CGFloat spacing = 5; // the amount of spacing to appear between image and title
        authorizeButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    } else {
        
    }
    
    [authorizeButton addTarget:self
                        action:@selector(checkAuthDidTap)
              forControlEvents:UIControlEventTouchUpInside];
    [authorizeButton setTitle:@"Authorize" forState:UIControlStateNormal];
    authorizeButton.frame = CGRectMake(80.0, 328.0, 156.0, 42.0);
    authorizeButton.layer.borderWidth = 2.0;
    authorizeButton.layer.cornerRadius = 10.0;
    authorizeButton.layer.borderColor = [[UIColor systemBlueColor] CGColor];
    [authorizeButton setTitleColor:[UIColor colorWithRed:0.0
                                                   green:0.0
                                                    blue:1.0
                                                   alpha:1.0]
                                                forState:UIControlStateNormal];
    
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
    loginTextField.layer.borderColor = [[UIColor systemGrayColor] CGColor];
    
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
    passwordTextField.layer.borderColor = [[UIColor systemGrayColor] CGColor];

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
    
    _checkAdditionalString = [NSMutableString stringWithString:@""];
    //[_viewAdditional setHidden:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    return true;
}

- (void)stateReady{
    _passwordTextField.layer.borderColor = [[UIColor systemGrayColor] CGColor];
    _loginTextField.layer.borderColor = [[UIColor systemGrayColor] CGColor];
    
    [_passwordTextField setEnabled:YES];
    [_loginTextField setEnabled:YES];
    [_authorizeButton setEnabled:YES];
    
    _loginTextField.text = nil;
    _passwordTextField.text = nil;
}

- (void)stateError{
    _passwordTextField.layer.borderColor = [[UIColor systemRedColor] CGColor];
    _loginTextField.layer.borderColor = [[UIColor systemRedColor] CGColor];
}

- (void)stateSuccess{
    _passwordTextField.layer.borderColor = [[UIColor systemGreenColor] CGColor];
    _loginTextField.layer.borderColor = [[UIColor systemGreenColor] CGColor];
    
    _passwordTextField.alpha = 0.5;
    _loginTextField.alpha = 0.5;
    _authorizeButton.alpha = 0.5;
    
    [_passwordTextField setEnabled:NO];
    [_loginTextField setEnabled:NO];
    [_authorizeButton setEnabled:NO];

    [_viewAdditional setHidden:NO];
}

- (void)checkAuthDidTap{
    if([_loginTextField.text  isEqual: @"User"] &&
       [_passwordTextField.text  isEqual: @"123"]){
        [self stateSuccess];
    } else {
        [self stateError];
    }
}


- (void)stateErrorForAdditional{
    _viewAdditional.layer.borderWidth = 2.0;
    _viewAdditional.layer.cornerRadius = 10.0;
    _viewAdditional.layer.borderColor = [[UIColor systemRedColor] CGColor];
}

- (void)checkOneDidTap{
    [_checkAdditionalString appendString:@"1"];
    [self checkedAdditional];
}

- (void)checkTwoDidTap{
    [_checkAdditionalString appendString:@"2"];
    [self checkedAdditional];
}

- (void)checkThreeDidTap{
    [_checkAdditionalString appendString:@"3"];
    [self checkedAdditional];
}

- (void) checkedAdditional {
    if (_checkAdditionalString.length > 2 && ![_checkAdditionalString isEqual:@"132"]){
        [self stateErrorForAdditional];
        _checkAdditionalString = [NSMutableString stringWithString:@""];
        _additionalLabel.text = @"-";
    } else {
        [_additionalLabel setText: _checkAdditionalString];
    }
}

@end
