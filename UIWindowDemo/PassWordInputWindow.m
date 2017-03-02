//
//  PassWordInputWindow.m
//  UIWindowDemo
//
//  Created by pactera on 17/3/2.
//  Copyright © 2017年 pactera. All rights reserved.
//

#import "PassWordInputWindow.h"

@implementation PassWordInputWindow
{
    UITextField *_textfield;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (PassWordInputWindow *)shareInstance{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    return sharedInstance;
}

- (id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 200, 20)];
        label.text= @"请输入密码";
        [self addSubview:label];
        
        UITextField *textfield = [[UITextField alloc]initWithFrame:CGRectMake(10, 80, 200, 20)];
        textfield.backgroundColor = [UIColor whiteColor];
        textfield.secureTextEntry = YES;
        [self addSubview:textfield];
        
        UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(10, 110, 200, 44)];
        [button setBackgroundColor:[UIColor blueColor]];
        button.titleLabel.textColor  = [UIColor blackColor];
        [button setTitle:@"确定" forState:UIControlStateNormal];
        
        [button addTarget:self action:@selector(completeButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
        
        self.backgroundColor = [UIColor yellowColor];
        _textfield = textfield;
        _textfield.clearsOnBeginEditing = YES;
    }
    return self;
}
- (void)show{
    
    [self makeKeyWindow];
   
    self.hidden = NO;
}

- (void)completeButtonPressed:(id)sender{
         [_textfield resignFirstResponder];
    if ([_textfield.text isEqualToString:@"1234qwer"]) {
        [_textfield resignFirstResponder];
        [self resignKeyWindow];
        self.hidden = YES;
    }else{
        [self showErroeAlertView];
    }
}

- (void)showErroeAlertView{
    UIAlertView *alertView = [[UIAlertView alloc]initWithTitle:nil message:@"密码错误" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alertView show];
}
@end
