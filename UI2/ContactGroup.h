//
//  ContactGroup.h
//  UI2
//
//  Created by bytedance on 2021/1/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ContactGroup : NSObject
{
    NSMutableArray *_contacts;
}


@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *detail;
@property NSMutableArray *contacts;

- (instancetype)initWithName: (NSString *)name andDetail: (NSString *)detail andContacts: (NSMutableArray *)contacts;
+ (instancetype)initWithName: (NSString *)name andDetail: (NSString *)detail andContacts: (NSMutableArray *)contact;
@end

NS_ASSUME_NONNULL_END
