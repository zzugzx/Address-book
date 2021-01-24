//
//  MyTableViewCell.m
//  UI2
//
//  Created by bytedance on 2021/1/24.
//

#import "MyTableViewCell.h"

@interface MyTableViewCell ()


@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *phoneNumberLabel;
@property (nonatomic, strong) UILabel *genderLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UIImageView *MyimageView;

@end

@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithName:(NSString *)name andPhoneNumber:(NSString *)phoneNumber andAge:(NSString *)age andGender:(NSString *)gender {
    if (self = [super initWithStyle:UITableViewCellStyleValue2 reuseIdentifier:nil]) {
        self.MyimageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"a"]];
        
        self.nameLabel = [[UILabel alloc] init];
        self.phoneNumberLabel = [[UILabel alloc] init];
        self.ageLabel = [[UILabel alloc] init];
        self.genderLabel = [[UILabel alloc] init];
        
        
        self.nameLabel.text = name;
        self.ageLabel.text = age;
        self.phoneNumberLabel.text = phoneNumber;
        self.genderLabel.text = gender;
        
        [self.contentView addSubview:self.MyimageView];
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.ageLabel];
        [self.contentView addSubview:self.phoneNumberLabel];
        [self.contentView addSubview:self.genderLabel];
        
        [self.MyimageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.contentView);
            make.height.mas_equalTo(50);
            make.left.mas_equalTo(self.contentView);
            make.width.mas_equalTo(50);
        }];
        
        [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.MyimageView.mas_right).offset(5);
            make.width.mas_equalTo(100);
            make.top.mas_equalTo(self.contentView);
            make.height.mas_equalTo(self.contentView.mas_height).with.multipliedBy(0.5);
        }];
        
        [self.phoneNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(self.nameLabel);
            make.width.mas_equalTo(100);
            make.top.mas_equalTo(self.nameLabel.mas_bottom);
            make.height.mas_equalTo(self.contentView.mas_height).with.multipliedBy(0.5);
        }];
        
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.contentView);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(self.contentView.mas_height).with.multipliedBy(0.5);
        }];
         
        [self.genderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
                    make.top.mas_equalTo(self.ageLabel.mas_bottom);
                    make.right.mas_equalTo(self.contentView);
                    make.bottom.mas_equalTo(self.contentView);
                    make.width.mas_equalTo(50);
        }];
    }
    return self;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    
}

@end
