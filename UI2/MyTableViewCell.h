//
//  MyTableViewCell.h
//  UI2
//
//  Created by bytedance on 2021/1/24.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyTableViewCell : UITableViewCell


- (instancetype)initWithName:(NSString *)name andPhoneNumber:(NSString *)phoneNumber andAge:(NSString *)age andGender: (NSString *)gender;

@end

NS_ASSUME_NONNULL_END
