//
//  OCMainPageView.h
//  iOSLearn
//
//  Created by qingyang on 5/22/26.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface OCMainPageView : UIView

@property (nonatomic, copy) void (^cellDidClickBlock)(void);

@end

NS_ASSUME_NONNULL_END
