#import "OCViewController.h"
#import "OCMainPageView.h"


@interface OCViewController ()

@property (nonatomic, strong) OCMainPageView *mainPageView;

@end

@implementation OCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Objective-C 路线";
    self.view.backgroundColor = [UIColor systemBackgroundColor];
    
    // 创建OCMainPageView
    [self.view addSubview:self.mainPageView];
    [self.mainPageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view.mas_safeAreaLayoutGuideTop);
        make.bottom.equalTo(self.view.mas_safeAreaLayoutGuideBottom);
        make.left.right.equalTo(self.view);
    }];
}

#pragma mark lazyload

- (OCMainPageView *)mainPageView {
    if (!_mainPageView) {
        _mainPageView = [[OCMainPageView alloc] init];
    }
    return _mainPageView;
}

@end
