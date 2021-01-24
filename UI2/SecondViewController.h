//
//  SecondViewController.h
//  UI2
//
//  Created by bytedance on 2021/1/21.
//

#import "ViewController.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^Callback)(NSString *name, NSString *phoneNumber);

@interface SecondViewController : UIViewController

@property (nonatomic, copy) Callback callback;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *phoneNumber;

@end

NS_ASSUME_NONNULL_END
