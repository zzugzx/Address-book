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
@property (nonatomic, strong) UIButton *btn;

@end



@implementation SecondViewController
- (void)save {
    if (self.txt1.text.length == 0 || self.txt2.text.length == 0) {
        UILabel *label = [[UILabel alloc] init];
        label.backgroundColor = [UIColor blackColor];
        label.text = @"输入内容不能为空";
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
    if (self.callback) {
        self.callback(self.txt1.text, self.txt2.text);
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
        make.left.mas_equalTo(self.view).offset(100);
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
    
    self.btn = [UIButton buttonWithType:UIButtonTypeSystem];
    self.btn.backgroundColor = [UIColor blueColor];
    [self.btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
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
