import UIKit
import DesignSystem

open class BaseViewController: UIViewController {
  open override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
  }

  open override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupNavigationBar()
  }

  open func setupNavigationBar() {
    navigationController?.navigationBar.isHidden = false
    navigationItem.backButtonTitle = ""
    navigationController?.navigationBar.tintColor = .white
    navigationItem.backBarButtonItem?.tintColor = .white
    navigationController?.navigationBar.isTranslucent = true
    navigationController?.navigationBar.shadowImage = UIImage()
    navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
    let backImage = Assets.backBtn?.withRenderingMode(.alwaysOriginal)
    navigationController?.navigationBar.backIndicatorImage = backImage
    navigationController?.navigationBar.backIndicatorTransitionMaskImage = backImage
  }
}
