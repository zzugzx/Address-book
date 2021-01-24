//
//  MyMaleTableViewCell.m
//  UI2
//
//  Created by bytedance on 2021/1/24.
//

#import "MyMaleTableViewCell.h"
#import <Masonry/Masonry.h>

@interface MyMaleTableViewCell ()


@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *phoneNumberLabel;
@property (nonatomic, strong) UILabel *genderLabel;
@property (nonatomic, strong) UILabel *ageLabel;
@property (nonatomic, strong) UIImageView *MyimageView;

@end

@implementation MyMaleTableViewCell

- (void)awakeFromNib{
    [super awakeFromNib];
    // Initialization code
}
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier {
    if(self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.MyimageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"b"]];
        self.nameLabel = [[UILabel alloc] init];
        self.phoneNumberLabel = [[UILabel alloc] init];
        self.ageLabel = [[UILabel alloc] init];
        self.genderLabel = [[UILabel alloc] init];
        
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
        
        self.ageLabel.textAlignment = NSTextAlignmentRight;
        [self.ageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.mas_equalTo(self.contentView);
            make.top.mas_equalTo(self.contentView);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(self.contentView.mas_height).with.multipliedBy(0.5);
        }];
         
        self.genderLabel.textAlignment = NSTextAlignmentRight;
        [self.genderLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.ageLabel.mas_bottom);
            make.right.mas_equalTo(self.contentView);
            make.bottom.mas_equalTo(self.contentView);
            make.width.mas_equalTo(100);
        }];
    }
    return self;
}

- (void)updateWithContact: (Contact *)contact {
    self.nameLabel.text = contact.name;
    self.ageLabel.text = contact.age;
    self.phoneNumberLabel.text = contact.phoneNumber;
    self.genderLabel.text = contact.gender;
}
@end
