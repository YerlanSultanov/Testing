import Foundation
import UIKit

var keyboardMoveValue: CGFloat = 100

extension UIViewController {
    func addKeyboardSettings(value: CGFloat = 100, cancelsTouchesInView: Bool = true) {
        self.hideKeyboardWhenTappedAround(cancelsTouchesInView: cancelsTouchesInView)
        keyboardMoveValue = value
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(notification:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(notification:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    func hideKeyboardWhenTappedAround(cancelsTouchesInView: Bool = true) {
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = cancelsTouchesInView
        view.addGestureRecognizer(tap)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if self.view.frame.origin.y == 0 {
            self.view.frame.origin.y -= keyboardMoveValue
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        if self.view.frame.origin.y != 0 {
            
            self.view.frame.origin.y += keyboardMoveValue
        }
    }
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
