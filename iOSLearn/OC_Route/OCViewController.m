#import "OCViewController.h"


@interface OCViewController ()
@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Objective-C 路线";
    self.view.backgroundColor = [UIColor systemIndigoColor];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Hello, Objective-C UIKit + Masonry!";
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont boldSystemFontOfSize:20];
    [self.view addSubview:label];
    
    // 使用 Masonry 进行居中布局
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
    }];
}

@end
