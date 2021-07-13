//
//  ViewControllerExtensions.swift
//  Ceiba
//
//  Created by Mario Rúa on 12/07/21.
//

import Foundation
import UIKit
import MBProgressHUD
import CoreBluetooth

fileprivate var aView: UIView?

extension UIViewController {
    func showSpinner() {
        DispatchQueue.main.async {
            if aView != nil && self.view.subviews.contains(aView!) { return }
            aView = (self.parent != nil) ? UIView(frame: self.parent!.view.bounds) : UIView(frame: self.view.bounds)
            guard let containerView = aView else { return }
            containerView.backgroundColor = UIColor.clear
            MBProgressHUD.showAdded(to: containerView, animated: true)
            self.view.addSubview(containerView)
        }
    }
    
    func removeSpinner() {
        DispatchQueue.main.async {
            MBProgressHUD.hide(for: aView ?? self.view, animated: true)
            aView?.removeFromSuperview()
            aView = nil
        }
    }
    
    func showAlertWith(title: String, body: String, style: UIAlertController.Style = .alert) {
        let alertController = UIAlertController(title: title, message: body, preferredStyle: style)
        let action = UIAlertAction(title: "Ok", style: .default) { (action) in
            self.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)
    }
}

extension UIViewController: Presentable {
    func toPresent() -> UIViewController? {
        return self
    }
}
