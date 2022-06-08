//
//  SCHProgressHUD.swift
//  loaderTest
//
//  Created by Eugene sch on 26.07.21.
//

import Foundation
import NVActivityIndicatorView
import UIKit

open class SCHProgressHUB {
    static var activityIndicatorView: NVActivityIndicatorView?
    static var frame = CGRect(x: 3, y: 3, width: 80, height: 80)
    static var contentView = UIView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
    static var activityIndicatorType: Int { (Bundle.main.infoDictionary?["activityIndicatorType"] as? Int) ?? 0 } 
    
    static func showAdded(to: UIView, type: NVActivityIndicatorType, color: UIColor){
        activityIndicatorView?.stopAnimating()
        activityIndicatorView = NVActivityIndicatorView(frame: frame, type: type)
        hide(animated: false)
        guard let activityIndicatorView = self.activityIndicatorView else { return }
        SCHProgressHUB.contentView.alpha = 1
        contentView.layer.cornerRadius = 10
        contentView.backgroundColor = .black
        contentView.alpha = 0.5
        contentView.frame.origin = to.frame.origin
        contentView.frame.size.height = to.frame.size.height
        contentView.frame.size.width = to.frame.size.width
        
        contentView.addSubview(activityIndicatorView)
        
        activityIndicatorView.center = CGPoint(
            x: contentView.frame.size.width  / 2,
            y: contentView.frame.size.height / 2)
        
        activityIndicatorView.color = color
        activityIndicatorView.startAnimating()
        
        to.addSubview(contentView)
    }
    
    open class func showAdded(to: UIView){
        SCHProgressHUB.showAdded(to: to, type: NVActivityIndicatorType.allCases[activityIndicatorType], color: .white)
    }
    
    static func hide(animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.4) {
                SCHProgressHUB.contentView.alpha = 0
            } completion: { _ in
                SCHProgressHUB.contentView.removeFromSuperview()
            }
        } else {
            SCHProgressHUB.contentView.removeFromSuperview()
        }
        SCHProgressHUB.activityIndicatorView?.stopAnimating()
    }
    
}

