//
//  MyMaleTableViewCell.h
//  UI2
//
//  Created by bytedance on 2021/1/24.
//

#import <UIKit/UIKit.h>
#import "Contact.h"
NS_ASSUME_NONNULL_BEGIN

@interface MyMaleTableViewCell : UITableViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier;
- (void)updateWithContact: (Contact *)contact;

@end
NS_ASSUME_NONNULL_END
