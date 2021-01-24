//
//  ContactGroup.m
//  UI2
//
//  Created by bytedance on 2021/1/21.
//

#import "ContactGroup.h"


@interface ContactGroup ()



@end


@implementation ContactGroup

@synthesize contacts = _contacts;
- (instancetype)initWithName: (NSString *)name andDetail: (NSString *)detail andContacts: (NSMutableArray *)contacts {
    if (self == [super init]) {
        self.name = name;
        self.detail = detail;
        self.contacts = contacts;
    }
    return self;
}
+ (instancetype)initWithName: (NSString *)name andDetail: (NSString *)detail andContacts: (NSMutableArray *)contacts {
    return [[ContactGroup alloc] initWithName:name andDetail:detail andContacts:contacts];
}


@end
