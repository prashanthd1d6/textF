//
//  v2.swift
//  UITextFieldintro
//
//  Created by Gugulavath prashanth kumar on 22/01/21.
//  Copyright © 2021 Gugulavath prashanth kumar. All rights reserved.
//

import UIKit

class v2: UIViewController {
    
var v1:ViewController!
    
var textView:UITextView!
var SCTextView = UITextView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
       
        textView = UITextView(frame: self.view.bounds)
        textView.backgroundColor = .yellow
        textView.isEditable = false
        view.addSubview(textView)
        SCTextView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        SCTextView.contentSize = CGSize(width: view.frame.size.width, height: 2000)
        SCTextView.backgroundColor = .systemYellow
        view.addSubview(SCTextView)

        returnAct()


        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func returnAct(){
        let backBtn = UIButton()
           backBtn.frame = CGRect(x: 330, y: 70, width: 75, height: 30)
           backBtn.setTitle("BACK", for: .normal)
           backBtn.backgroundColor = .orange
           backBtn.layer.cornerRadius = 15
           backBtn.clipsToBounds = true
           backBtn.addTarget(self, action: #selector(backAction), for: .touchUpInside)
           
           view.addSubview(backBtn)
       }
       @objc func backAction(){
           dismiss(animated: true) {

           }
       }
 
    
    
    
}
