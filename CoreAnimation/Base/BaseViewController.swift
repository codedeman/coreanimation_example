//
//  BaseViewController.swift
//  CoreAnimation
//
//  Created by Pham Kien on 18.02.22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.isNavigationBarHidden = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        // Do any additional setup after loading the view.
    }
    
//    convenience init() {
//        self.init(title: "")
//    }
    
//    init(title: String) {
//        self.titleViewController = title
//        super.init(nibName: nil, bundle: nil)
//    }
    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//    deinit {
//        debugPrint("~~~~~\(type(of: self)) dealloc~~~~")
//    }
    
    class func initWithNib() -> Self {
        let bundle = Bundle.main
        let fileManege = FileManager.default
        let nibName = String(describing: self)
        if let pathXib = bundle.path(forResource: nibName, ofType: "xib") {
            if fileManege.fileExists(atPath: pathXib) {
                return initWihtNibTemplate()
            }
        }
        
        if let pathStoryboard = bundle.path(forResource: nibName, ofType: "storyboard") {
            if fileManege.fileExists(atPath: pathStoryboard) {
                return initWithDefautlStoryboard()
            }
        }
        return initWihtNibTemplate()
    }
    
    class func initWithDefautlStoryboard() -> Self {
        let className = String(describing: self)
        return instantiateFromStoryboardHelper(storyboardName: className, storyboardId: className)
    }
    
    class func instantiateFromStoryboardHelper<T> (storyboardName:String,storyboardId:String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let controller = storyboard.instantiateViewController(withIdentifier: storyboardId) as! T
        return controller
    }

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


extension UIViewController {
    
    class func initWihtNibTemplate<T>()->T {
        let nibName =  String(describing: self)
        let viewcontroller = self.init(nibName: nibName, bundle: Bundle.main)
        return viewcontroller as! T

    }
    
}
