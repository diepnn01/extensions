//
//  BaseCustomXibView.swift
//  BCAInvestment
//
//  Created by PhucNguyen on 1/13/18.
//  Copyright © 2018 BCA. All rights reserved.
//

import UIKit

open class BaseCustomXibView: UIView {
	
	var view: UIView!
	fileprivate(set) var nibName: String!
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		initialize()
		xibSetup()
	}
    required public init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		initialize()
		xibSetup()
	}
	
	fileprivate func xibSetup() {
		view = loadViewFromNib()
		view.frame = bounds
		view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
		view.isUserInteractionEnabled = true
		addSubview(view)
		didLoadFromNib()
	}
	
	open func loadViewFromNib() -> UIView {
		let bundle = Bundle(for: type(of: self))
		let nib = UINib(nibName: nibName, bundle: bundle)
		if let view = nib.instantiate(withOwner: self, options: nil).first as? UIView {
			return view
		}
		return UIView()
	}
	
	open func initialize() {
		nibName = "\(self.classForCoder)"
	}
    
	func didLoadFromNib() {}
}
