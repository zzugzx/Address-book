//
//  Contact.h
//  UI2
//
//  Created by bytedance on 2021/1/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Contact : NSObject


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phoneNumber;
@property (nonatomic, copy) NSString *gender;
@property (nonatomic, copy) NSString *age;

- (instancetype)initWithName: (NSString *)name andPhoneNumber: (NSString *)phoneNumber andAge:(NSString *)age andGender:(NSString *) gender;

+ (instancetype)initWithName: (NSString *)name andPhoneNumber: (NSString *)phoneNumber andAge:(NSString *)age andGender:(NSString *) gender;

@end

NS_ASSUME_NONNULL_END
