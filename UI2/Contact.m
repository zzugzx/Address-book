//
//  Contact.m
//  UI2
//
//  Created by bytedance on 2021/1/21.
//

#import "Contact.h"

@interface Contact ()




@end


@implementation Contact

- (instancetype)initWithName: (NSString *)name andPhoneNumber: (NSString *)phoneNumber andAge:(NSString *)age andGender:(NSString *) gender {
    if (self == [super init]) {
        self.name = name;
        self.phoneNumber = phoneNumber;
        self.gender = gender;
        self.age = age;
    }
    return self;
}

+ (instancetype)initWithName: (NSString *)name andPhoneNumber: (NSString *)phoneNumber andAge:(NSString *)age andGender:(NSString *) gender{
    return [[Contact alloc] initWithName:name andPhoneNumber:phoneNumber andAge:age andGender:gender];
}


@end
