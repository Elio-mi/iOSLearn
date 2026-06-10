//
//  OCMainPageView.m
//  iOSLearn
//
//  Created by qingyang on 5/22/26.
//

#import "OCMainPageView.h"


static NSString *cellID = @"CellID";

@interface OCMainPageView() <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataSource;

@end


@implementation OCMainPageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setupUI];
        [self loadDataSource];
    }
    return self;
}


- (void)setupUI {
    [self addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (UITableView *)tableView {
    if (!_tableView) {
        /// 初始化tableView
        _tableView = [[UITableView alloc] initWithFrame:self.bounds style:UITableViewStyleGrouped];
        /// 设置代理
        _tableView.dataSource = self;
        _tableView.delegate = self;
        /// 注册cell
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellID];
        
        /// 自动计算高度
        _tableView.estimatedRowHeight = 53;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.tableHeaderView.backgroundColor = UIColor.systemBackgroundColor;
        _tableView.backgroundColor = UIColor.clearColor;
    }
    return _tableView;
}



#pragma mark tableView Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *sectionData = self.dataSource[section];
    NSArray *rowArray = sectionData[1];
    return rowArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellID forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    NSArray *sectionData = self.dataSource[indexPath.section];
    NSArray *rowArray = sectionData[1];
    cell.textLabel.text = rowArray[indexPath.row];
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSArray *sectionData = self.dataSource[section];
    return sectionData[0];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    /// 每个cell点击之后的行为
    if (self.cellDidClickBlock) {
        self.cellDidClickBlock();
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

#pragma mark load dataSource

- (void)loadDataSource {
    _dataSource = @[
        @[@"基础控件（UIControl 子类）",
          @[
              @"UILabelView",
              @"UITextView",
              @"UIButton",
              @"UITextField"
          ]
        ],
        @[@"选择器类",
          @[
              @"UIDatePicker",
              @"UIPickerView",
              @"UIColorPickerViewController",
              @"UIFontPickerViewController"
          ]
        ]
    ];
    
    [self.tableView reloadData];
}


@end

