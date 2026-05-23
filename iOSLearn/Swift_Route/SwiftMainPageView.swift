//
//  SwiftMainPageView.swift
//  iOSLearn
//
//  Created by qingyang on 5/23/26.
//

import UIKit
import SnapKit

//class MainView {
//    // 只放：属性 + 初始化
//}
//
//// UI 部分
//private extension MainView { }
//
//// 数据部分
//private extension MainView { }
//
//// 代理部分
//extension MainView: Delegate { }

/// 属性 + 初始化
class SwiftMainPageView: UIView {
    
    private static let cellID = "CellID" /// 常量
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        /// tableView初始化三件套
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Self.cellID)
        tableView.estimatedRowHeight = 53
        tableView.rowHeight = UITableView.automaticDimension
        return tableView;
    }()
    
    // MARK: 数据源
    private var datasource: [[Any]] = []
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
        loadDataSource()
    }
    
    required init?(coder: NSCoder) { nil } 
}

// UI部分
private extension SwiftMainPageView {
    func setupUI() {
        addSubview(tableView)
        /// 设置约束
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func loadDataSource() {
        datasource = [
            [
                "基础控件（UIControl 子类）",
                ["UILabel", "UITextView", "UIButton", "UITextField"]
            ],
            [
                "选择器类",
                [
                 "UIDatePicker",
                 "UIPickerView",
                 "UIColorPickerViewController",
                 "UIFontPickerViewController"
                ]
            ]
        ]
        
        tableView.reloadData()
    }
}

/// UITableView的代理
extension SwiftMainPageView:UITableViewDelegate, UITableViewDataSource {
    
    /// tableView最小实现
    
    /// 定义有几个section
    func numberOfSections(in tableview: UITableView) -> Int {
        return datasource.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let rowArray = datasource[section][1] as? [String]
        return rowArray?.count ?? 0
    }
    
    /// 定义每个cell怎么创建
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Self.cellID, for: indexPath)
        let rowArray = datasource[indexPath.section][1] as? [String]
        cell.textLabel?.text = rowArray?[indexPath.row] ?? ""
        return cell
    }
    
    /// 定义每个组的标题
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        datasource[section][0] as? String
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
