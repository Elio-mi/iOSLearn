import UIKit
import SnapKit

class SwiftViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Swift 路线"
        view.backgroundColor = .systemBackground
        
        let mainPageView = SwiftMainPageView()
        
        self.view.addSubview(mainPageView)
        mainPageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.left.right.equalToSuperview()
        }
    }
}
