import UIKit

class SwiftViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift 路线"
        view.backgroundColor = .systemTeal
        
        let label = UILabel()
        label.text = "Hello, Swift UIKit + Masonry!"
        label.textColor = .white
        label.font = .boldSystemFont(ofSize: 20)
        view.addSubview(label)
        
        // 使用 Masonry 在 Swift 中进行居中布局
        label.mas_makeConstraints { make in
            make?.center.equalTo()(self.view)
        }
    }
}
