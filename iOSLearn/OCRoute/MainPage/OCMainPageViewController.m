#import "OCMainPageViewController.h"
#import "OCMainPageView.h"
#import "OCBaseViewController.h"


@interface OCMainPageViewController ()

@property (nonatomic, strong) OCMainPageView *mainPageView;

@end

@implementation OCMainPageViewController

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
        @weakify(self)
        _mainPageView.cellDidClickBlock = ^{
            @strongify(self)
            OCBaseViewController *viewController = [[OCBaseViewController alloc] init];
            [self.navigationController pushViewController:viewController animated:YES];
        };
    }
    return _mainPageView;
}

@end
