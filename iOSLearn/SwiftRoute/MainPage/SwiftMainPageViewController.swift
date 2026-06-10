import UIKit
import SnapKit

class SwiftMainPageViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift 路线"
        view.backgroundColor = .systemBackground
        
        let mainPageView = SwiftMainPageView()
        mainPageView.cellDidClickBlock = { [weak self] in
            guard let self = self else { return }
            let viewController = SwiftBaseViewController()
            self.navigationController?.pushViewController(viewController, animated: true)
        }
        
        self.view.addSubview(mainPageView)
        mainPageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
}
