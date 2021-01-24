//
//  SecondViewController.m
//  UI2
//
//  Created by bytedance on 2021/1/21.
//

#import "SecondViewController.h"
#import <Masonry/Masonry.h>


@interface SecondViewController ()

@property (nonatomic, strong) UITextField *txt1;
@property (nonatomic, strong) UITextField *txt2;
@property (nonatomic, strong) UITextField *txt3;
@property (nonatomic, strong) UITextField *txt4;

@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;
@property (nonatomic, strong) UILabel *label4;



@property (nonatomic, strong) UIButton *btn;

@end



@implementation SecondViewController
- (void)save {
    if (self.txt1.text.length == 0 || self.txt2.text.length == 0) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor blackColor];
        label.text = @"The input is empty...";
        [label setTextColor:[UIColor whiteColor]];
        label.layer.cornerRadius = 10;
        label.layer.masksToBounds = YES;
        label.textAlignment = NSTextAlignmentCenter;
        
        label.alpha = 0.0;
        [UIView animateWithDuration:1.5 animations:^{
            label.alpha = 0.6;
        } completion:^(BOOL finished) {
            if (finished) {
                [UIView animateKeyframesWithDuration:1.5 delay:0.5 options:UIViewAnimationCurveLinear animations:^{
                    label.alpha = 0.0;
                } completion:^(BOOL finished) {
                    if (finished) {
                        [label removeFromSuperview];
                    }
                }];
            }
        }];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(400);
            make.left.mas_equalTo(self.view).offset(100);
            make.right.mas_equalTo(self.view).offset(-100);
            make.height.mas_equalTo(50);
        }];
        
        return;
    }
    if ( ![self.txt4.text isEqualToString:@"Male"] && ![self.txt4.text isEqualToString:@"Female"]) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor blackColor];
        label.text = @"gender is only Male or Female...";
        [label setTextColor:[UIColor whiteColor]];
        label.layer.cornerRadius = 10;
        label.layer.masksToBounds = YES;
        label.textAlignment = NSTextAlignmentCenter;
        
        label.alpha = 0.0;
        [UIView animateWithDuration:1.5 animations:^{
            label.alpha = 0.6;
        } completion:^(BOOL finished) {
            if (finished) {
                [UIView animateKeyframesWithDuration:1.5 delay:0.5 options:UIViewAnimationCurveLinear animations:^{
                    label.alpha = 0.0;
                } completion:^(BOOL finished) {
                    if (finished) {
                        [label removeFromSuperview];
                    }
                }];
            }
        }];
        [self.view addSubview:label];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.view).offset(400);
            make.left.mas_equalTo(self.view).offset(50);
            make.right.mas_equalTo(self.view).offset(-50);
            make.height.mas_equalTo(50);
        }];
        
        return;
    }
    if (self.callback) {
        self.callback(self.txt1.text, self.txt2.text, self.txt3.text, self.txt4.text);
    }
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    

    UIButton *save = [UIButton buttonWithType:UIButtonTypeSystem];
    [save setTitle:@"Save" forState:UIControlStateNormal];
    save.titleLabel.font = [UIFont systemFontOfSize:17];
    [save addTarget:self action:@selector(save) forControlEvents:UIControlEventTouchUpInside];
    save.titleLabel.font = [UIFont systemFontOfSize:17];
    self.title = @"Detail";
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:save];
    
    self.txt1 = [[UITextField alloc] init];
    self.txt1.text = self.name;
    self.txt1.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.txt1];
    [self.txt1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view).offset(150);
        make.right.mas_equalTo(self.view).offset(-100);
        make.top.mas_equalTo(self.view).offset(150);
        make.height.mas_equalTo(50);
    }];
    
    
    self.txt2 = [[UITextField alloc] init];
    self.txt2.keyboardType = UIKeyboardTypeNumberPad;
    self.txt2.text = self.phoneNumber;
    self.txt2.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.txt2];
    [self.txt2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.txt1);
        make.right.mas_equalTo(self.txt1);
        make.top.mas_equalTo(self.txt1.mas_bottom).offset(100);
        make.height.mas_equalTo(50);
    }];
    
    self.txt3 = [[UITextField alloc] init];
    self.txt3.keyboardType = UIKeyboardTypeNumberPad;
    self.txt3.text = self.age;
    self.txt3.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.txt3];
    [self.txt3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.txt1);
            make.right.mas_equalTo(self.txt1);
            make.top.mas_equalTo(self.txt2.mas_bottom).offset(100);
            make.height.mas_equalTo(50);
    }];
    
    self.txt4 = [[UITextField alloc] init];
    self.txt4.text = self.gender;
    self.txt4.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:self.txt4];
    [self.txt4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.txt1);
            make.right.mas_equalTo(self.txt1);
            make.top.mas_equalTo(self.txt3.mas_bottom).offset(100);
            make.height.mas_equalTo(50);
    }];
    
    self.label1 = [[UILabel alloc] init];
    self.label1.text = @"name:";
    self.label1.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:self.label1];
    [self.label1 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.txt1.mas_left).offset(-10);
            make.top.mas_equalTo(self.txt1);
            make.bottom.mas_equalTo(self.txt1);
            make.width.mas_equalTo(150);
    }];
    
    self.label2 = [[UILabel alloc] init];
    self.label2.text = @"phoneNumber:";
    self.label2.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:self.label2];
    [self.label2 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.txt2.mas_left).offset(-10);
            make.top.mas_equalTo(self.txt2);
            make.bottom.mas_equalTo(self.txt2);
            make.width.mas_equalTo(self.label1);
    }];
    
    self.label3 = [[UILabel alloc] init];
    self.label3.text = @"age:";
    self.label3.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:self.label3];
    [self.label3 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.txt3.mas_left).offset(-10);
            make.top.mas_equalTo(self.txt3);
            make.bottom.mas_equalTo(self.txt3);
            make.width.mas_equalTo(self.label1);
    }];
    
    self.label4 = [[UILabel alloc] init];
    self.label4.text = @"gender:";
    self.label4.textAlignment = NSTextAlignmentRight;
    [self.view addSubview:self.label4];
    [self.label4 mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.txt4.mas_left).offset(-10);
            make.top.mas_equalTo(self.txt4);
            make.bottom.mas_equalTo(self.txt4);
            make.width.mas_equalTo(self.label1);
    }];
    

    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
