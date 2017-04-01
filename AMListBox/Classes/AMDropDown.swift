//
//  AMDropDown.swift
//  Pods
//
//  Created by HMSPL on 02/04/17.
//
//

import UIKit

open class AMDropDown: UILabel {

    public var  presentController : UIViewController?
    let listController = SearchListViewController()
    public var listArray : [String] = []
    
    public var pageTitle : String?  {
        set {
            listController.pageTitle = newValue
        }
        
        get {
            return  listController.pageTitle
        }
    }
    
    
    public var bgColor : UIColor? {
        set {
            listController.bgColor = newValue
        }
        
        get {
            return listController.bgColor
        }
    }

    
    public var titleFont : UIFont?  {
        set {
            listController.titleFont = newValue
        }
        
        get {
            return  listController.titleFont
        }
    }
    
    
    public var titleColor : UIColor?  {
        set {
            listController.textColor = titleColor
        }
        
        get {
            return  listController.textColor
        }
    }
    
    
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    
    open func loadView() {
        self.isUserInteractionEnabled = true
    
        let selectBtn = UIButton(frame: self.bounds)
        selectBtn.addTarget(self, action:#selector(dropDown(action:)), for: .touchUpInside)
        selectBtn.backgroundColor = UIColor.clear
        self.addSubview(selectBtn)
        
        listController.listArray = listArray
        listController.delegate = self
    }

    func dropDown(action btn :UIButton){

        presentController?.present(listController, animated: true, completion: { 
            
        });
        
        
    }
}

extension AMDropDown : AMListBoxProtocol
{
     public func itemSelected(index:Int, item name:String)
     {
        if index != -1 {
            self.text = name
        }
        presentController?.dismiss(animated: true, completion: {
            
        })
    }
}
