import UIKit

class RootViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "iOS 学习路线"
        view.backgroundColor = .systemBackground
        
        let ocButton = UIButton(type: .system)
        ocButton.setTitle("进入 OC 路线", for: .normal)
        ocButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        ocButton.addTarget(self, action: #selector(gotoOC), for: .touchUpInside)
        
        let swiftButton = UIButton(type: .system)
        swiftButton.setTitle("进入 Swift 路线", for: .normal)
        swiftButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        swiftButton.addTarget(self, action: #selector(gotoSwift), for: .touchUpInside)
        
        let stack = UIStackView(arrangedSubviews: [ocButton, swiftButton])
        stack.axis = .vertical
        stack.spacing = 30
        view.addSubview(stack)
        
        // 使用 Masonry 进行居中布局
        stack.mas_makeConstraints { make in
            make?.center.equalTo()(self.view)
        }
    }
    
    @objc func gotoOC() {
        let ocVC = OCViewController()
        navigationController?.pushViewController(ocVC, animated: true)
    }
    
    @objc func gotoSwift() {
        let swiftVC = SwiftViewController()
        navigationController?.pushViewController(swiftVC, animated: true)
    }
}
