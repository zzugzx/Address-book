//
//  MyTableViewCell.m
//  UI2
//
//  Created by bytedance on 2021/1/21.
//

#import "MyTableViewCell.h"
#import <Masonry/Masonry.h>


@implementation MyTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)init {
    if (self == [super init]) {
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
        btn.backgroundColor = [UIColor redColor];
        [self addSubview:btn];
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(self);
        }];
        [btn addTarget:self action:@selector(jump) forControlEvents:UIControlEventTouchUpInside];
    }
    return self;
}
- (void)jump {
    NSLog(@"!!!!");
}
@end
