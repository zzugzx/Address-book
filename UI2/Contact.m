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

- (instancetype)initWithName: (NSString *)name andPhoneNumber: (NSString *)phoneNumber {
    if (self == [super init]) {
        self.name = name;
        self.phoneNumber = phoneNumber;
    }
    return self;
}

+ (instancetype)initWithName: (NSString *)name andPhoneNumber: (NSString *)phoneNumber {
    return [[Contact alloc] initWithName:name andPhoneNumber:phoneNumber];
}


@end
