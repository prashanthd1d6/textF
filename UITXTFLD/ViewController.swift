//
//  ViewController.swift
//  UITextFieldintro
//
//  Created by Gugulavath prashanth kumar on 21/01/21.
//  Copyright © 2021 Gugulavath prashanth kumar. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITextFieldDelegate {
    var myFieldFN = UITextField ()
    var myFieldLN = UITextField ()
    var myFieldA = UITextField ()
    var myFieldEM = UITextField ()
    var myFieldPN = UITextField ()
    var dateTextField = UITextField()
    var FN = CALayer()
    var SN = CALayer()
    var age = CALayer()
    var MN = CALayer()
    var EM = CALayer()
    var DOB = CALayer()
    var a2 = 0
    var save = UIButton()
   // var TFArr:[String] = []
    var TFFArr = [[String]]()
    var firstML = UILabel()
    var lastML = UILabel()
    var ageML = UILabel()
    var emailML = UILabel()
    var phoneML = UILabel()
//    var picker = UIDatePicker()
    var datePicker = UIDatePicker()
    var segments = UISegmentedControl()
    var maratialStatusSeg = UISegmentedControl()
    var acceptableCharecters = "012365789+"
    var phNumLength = 10
    var SArray = [UIView]()
    var Nview = UIView()
    var alertControllerObj:UIAlertController!
    



    override func viewDidLoad() {
        
     
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myFieldFN.isFirstResponder
        createUI()
        TFLabel()
        BothSegments()
      //  NV()
        
       // view.layer.contents = #imageLiteral(resourceName: "BI.jpeg").cgImage
        view.backgroundColor = .cyan
        myFieldFN.delegate = self
        myFieldLN.delegate = self
        myFieldA.delegate = self
        myFieldEM.delegate = self
        myFieldPN.delegate = self
        dateTextField.delegate = self
        segments.isEnabled = false
        maratialStatusSeg.isEnabled = false
             
    }
        @objc func tapbtn(){
            view.endEditing(true)
            
        }
   

    
    
    
    // Email Regular Expression
    func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"

        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    // TextFieldShouldBeginEditing
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        var returnvalue:Bool = false
        
        
            if (textField == myFieldEM){
                EMailalertController()
            }
        if (textField == myFieldFN)
        {
             save.isEnabled = false
            returnvalue = true
        }else if(textField == myFieldLN) {
            if(myFieldFN.text!.count > 0)
            {
                 save.isEnabled = false
                returnvalue = true
            }else
            {
                returnvalue = false
            }
        }else if(textField == dateTextField) {
            if(myFieldFN.text!.count > 0 && myFieldLN.text!.count > 0)
            {
                 save.isEnabled = false
                returnvalue = true
            }else
            {
                returnvalue = false
            }
        }else if(textField == myFieldA) {
            if(myFieldFN.text!.count > 0 && myFieldLN.text!.count > 0 && dateTextField.text!.count > 3)
            {
                 save.isEnabled = false
                returnvalue = true
            }else
            {
                returnvalue = false
            }
        }else if(textField == myFieldEM) {
            if(myFieldFN.text!.count > 0 && myFieldLN.text!.count > 0 && dateTextField.text!.count > 3 && Int(myFieldA.text!.count) >= 10 && Int(myFieldA.text!.count) <= 120)
            
            {
               
                returnvalue = true
            }else
            {
                returnvalue = false
            }
        
        }else if(textField == myFieldPN) {
            if(myFieldFN.text!.count > 0 && myFieldLN.text!.count > 0 && dateTextField.text!.count > 3 && myFieldA.text!.count > 0  && myFieldEM.text!.count >= 9  )
            {
               
                returnvalue = true
            }else
            {
                returnvalue = false
            }
        
        }
        return returnvalue
    }
// TextFieldShouldEndEditing
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
          var returnValue = true
        if(textField == myFieldFN)
        {
            if(textField.text!.count >= 3)
            {
               returnValue = true
            }else{
                returnValue = false
            }
        }
        else if (textField == myFieldEM){
            return isValidEmail(textField.text!)




        }
            //else if (textField == myFieldPN){
//            return validate(value: textField.text!)
//
//
        return returnValue
    }
     

    // TextFieldDidBeginEditing
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.backgroundColor = UIColor.systemGray

    }
    // TextFieldDidEndEditing
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        textField.backgroundColor = UIColor.cyan
    if(textField == dateTextField)
        {
            Aage()
        }
        var returnValue = true
    if(myFieldFN.text!.count != 0) && (myFieldLN.text!.count != 0) &&  (dateTextField.text!.count > 3) && Int(myFieldA.text!.count) > 0 && (myFieldEM.text!.count) > 7 && (myFieldPN.text!.count == 10) {
                segments.isEnabled = true
                maratialStatusSeg.isEnabled = true
                save.isEnabled = true
        return returnValue = true
            }
                else{
                segments.isEnabled = false
                maratialStatusSeg.isEnabled = false
                save.isEnabled = false
        return returnValue = false
            }
      
    }

    // Automatic Age
    
    func Aage(){
        //1 - get selected date from date picker
        let birthDate = self.datePicker.date
        
        //2 - get today date
        let today = Date()
        
        //3 - create an instance of the user's current calendar
        let calendar = Calendar.current
        
        //4 - use calendar to get difference between two dates
        let components = calendar.dateComponents([.year, .month, .day], from: birthDate, to: today)
        
        let ageYears = components.year
        let ageMonths = components.month
        let ageDays = components.day
        
        //5 - display age in label
        self.myFieldA.text = "\(ageYears!) years, \(ageMonths!) months, \(ageDays!) days"
    }
    
    // TextField ShouldChangeCharaters
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // BackSpace Condition
         if (string == "")
         {
            print("BackSpaceDetected")
            return true
        }
        let returnValue = true
        
        // FirstAndLastName Allowed Character Sets
        if(textField == myFieldFN || textField == myFieldLN)
        {
            let firstAndLastNameAllowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ ")
            
            if (string.rangeOfCharacter(from: firstAndLastNameAllowedCharacters) != nil)
            {
                return true
            }else
            {
                alertController()

                return false
            }
            //Age Allowed Character Sets
        }else if(textField == myFieldA)
            {
                let ageAllowedCharacters = CharacterSet(charactersIn: "0123456789")
                if(string.rangeOfCharacter(from: ageAllowedCharacters) != nil)
                {
                    return true
                }else{

                    return false
                }
                // email Allowed Character Sets
            }else if (textField == myFieldEM)
        {
            let emailAllowedCharacters = CharacterSet(charactersIn: "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890-_.@")
                        
                        if (string.rangeOfCharacter(from: emailAllowedCharacters) != nil)
                        {
                            return true
                        }else
                        {
                            return false
                        }
            // Mobilenumber Allowed Character Sets
        }else if (textField == myFieldPN)
        {
              if myFieldPN.text!.count == 0{
                  let mnAllowedChar = CharacterSet(charactersIn: "6789")
               if (string.rangeOfCharacter(from: mnAllowedChar) != nil)
              {
                  return true
              }else
              {
                mobilenumalertController()
                 return false
              }
            }
              
            let newLength: Int = textField.text!.count + string.count - range.length
            let numberOnly = NSCharacterSet.init(charactersIn: acceptableCharecters).inverted
            let strValid = string.rangeOfCharacter(from: numberOnly) == nil
            return (strValid && (newLength <= phNumLength))
              

        }
        if (textField == myFieldA) || (textField == myFieldPN){
            if (myFieldA.text!.count <= 3){
                return true
            }else{
                return false
            }
            if(myFieldPN.text!.count == 10){
                return true
            }else{
                return false
            }
            
        }
//        else if(textField == dateTextField){
//
//
//        }
        return true
    }
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
         return true
    }
    func textFieldDidChangeSelection(_ textField: UITextField) {
        print("textFieldDidChangeSelection")
    }
    // Alert Controller
    func alertController()
    {
        alertControllerObj = UIAlertController(title: "ERROR", message: "Enter Valid Characters", preferredStyle: UIAlertController.Style.alert)
        var alert = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (ACT) in
            
            
            
    }
        present(alertControllerObj, animated: true, completion: nil)
        alertControllerObj.addAction(alert)
        
        
    }
    func EMailalertController()
       {
           alertControllerObj = UIAlertController(title: "ERROR", message: "Enter Valid Email", preferredStyle: UIAlertController.Style.alert)
           var alert = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (ACT) in
               
               
               
       }
           present(alertControllerObj, animated: true, completion: nil)
           alertControllerObj.addAction(alert)
           
           
       }
    // Phone num alert
    func mobilenumalertController()
    {
        alertControllerObj = UIAlertController(title: "ERROR", message: "Enter Valid Number", preferredStyle: UIAlertController.Style.alert)
        var alert = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (ACT) in
            
            
            
    }
        present(alertControllerObj, animated: true, completion: nil)
        alertControllerObj.addAction(alert)
        
        
    }

    // UI TEXTFIELDS
    func createUI()
    {

        let tapGes = UITapGestureRecognizer(target: self, action: #selector(tapbtn))
            view.addGestureRecognizer(tapGes)
        // FirstName TextField
        myFieldFN.frame = CGRect(x: 30, y: 120, width: 350, height: 30)
        myFieldFN.borderStyle = .roundedRect
        myFieldFN.placeholder = "FirstName"
        myFieldFN.bottomLine(line: FN, field: myFieldFN)
//       myFieldFN.keyboardType = .alphabet
        myFieldFN.backgroundColor = .none
        myFieldFN.clearButtonMode = .always
        view.addSubview(myFieldFN)
        
        // LastName TextField
        myFieldLN.frame = CGRect(x: 30, y: 210, width: 350, height: 30)
        myFieldLN.borderStyle = .roundedRect
        myFieldLN.clearButtonMode = .always
        myFieldLN.bottomLine(line: SN, field: myFieldLN)
        myFieldLN.placeholder = "LastName"
        view.addSubview(myFieldLN)
        // DateOfBirth TextField
        dateTextField.frame = CGRect(x: 30, y: 300, width: 350, height: 30)
        dateTextField.borderStyle = .roundedRect
        dateTextField.placeholder = "MM/DD/YYYY"
        dateTextField.clearButtonMode = .always
        dateTextField.bottomLine(line: DOB, field: dateTextField)
        

        dateTextField.addTarget(self, action: #selector(textFieldDidEndEditing), for: UIControl.Event.valueChanged)
        view.addSubview(dateTextField)

        
        // Age TextField
        myFieldA.frame = CGRect(x: 30, y: 390, width: 350, height: 30)
        myFieldA.borderStyle = .roundedRect
        myFieldA.clearButtonMode = .always
        myFieldA.keyboardType = .numberPad
        myFieldA.placeholder = "Age"
        myFieldA.bottomLine(line: age, field: myFieldA)
        view.addSubview(myFieldA)
        
        // Email TextField
        myFieldEM.frame = CGRect(x: 30, y: 480, width: 350, height: 30)
        myFieldEM.borderStyle = .roundedRect
        myFieldEM.placeholder = "EmailID"
        myFieldEM.clearButtonMode = .always
        myFieldEM.bottomLine(line: EM, field: myFieldEM)
        view.addSubview(myFieldEM)
        
        // PhoneNumber TextField
        myFieldPN.frame = CGRect(x: 30, y: 570, width: 350, height: 30)
        myFieldPN.borderStyle = .roundedRect
        myFieldPN.placeholder = "MobileNumber"
        myFieldPN.clearButtonMode = .always
        myFieldPN.bottomLine(line: MN, field: myFieldPN)

        view.addSubview(myFieldPN)
        
        // DatePicker
            datePicker.datePickerMode = .date
       // datePicker.preferrefDatepickerStyle = .in
            dateTextField.inputView = datePicker
       // datePicker.maximumDate =
        
            
        //datePickerView.addTarget(self, action: #selector(agec), for: UIControl.Event.valueChanged)
    datePicker.addTarget(self, action: #selector(datePickerValueChanged), for: UIControl.Event.valueChanged)
    }
    
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        //dateFormatter.dateFormat = "dd-MM-yyyy"
        
        dateFormatter.dateStyle = DateFormatter.Style.medium
        dateFormatter.timeStyle = DateFormatter.Style.none
        dateTextField.text = dateFormatter.string(from: sender.date)
    }
    func BothSegments(){
               remove()
                // Gender SegmentedControl
                segments = UISegmentedControl(items: ["Male","Female"])
                segments.frame = CGRect(x: 150, y: 630, width: 180, height: 40)
                segments.selectedSegmentTintColor = UIColor.orange
                segments.backgroundColor = .white
        //        segments.setImage(UIImage(named: "male"), forSegmentAt: 0)
        //        segments.setImage(UIImage(named: "female"), forSegmentAt: 1)
                view.addSubview(segments)
                SArray.append(segments)
                // MaratialStatus SC
                maratialStatusSeg = UISegmentedControl(items: ["Single","Married"])
                maratialStatusSeg.frame = CGRect(x: 150, y: 720, width: 180, height: 40)
                maratialStatusSeg.selectedSegmentTintColor = UIColor.orange
                maratialStatusSeg.backgroundColor = .white
                view.addSubview(maratialStatusSeg)
                SArray.append(maratialStatusSeg)

    }

  // TEXTFIELD LABELS
   func TFLabel()
   {
     for i in 1...8{
        let mylbl = UILabel()
    mylbl.frame = CGRect(x: 30, y: 90+a2, width: 350, height: 30)
    view.addSubview(mylbl)
        a2+=90

        if i == 1{
            mylbl.text = "FirstName:"
        }
        else if i == 2{
            mylbl.text = "LastName:"
        }
        else if i == 3{
            mylbl.text = "DateOfBirth:"
        }
        else if i == 4{
            mylbl.text = "Age:"
        }
        else if i == 5{
            mylbl.text = "EmailID:"
        }else if i == 6{
            mylbl.text = "MobileNumber:"
        }else if i == 7{
            mylbl.text = "Gender:"
        }else if i == 8{
            mylbl.text = "MartialStatus:"
        }

    }
    // SAVE BUTTON
    save = UIButton(type: UIButton.ButtonType.system)
    save.frame = CGRect(x: 160, y: 800, width: 65, height: 40)
    save.setTitle("Save", for: UIControl.State.normal)
    save.backgroundColor = .systemGray
    save.layer.cornerRadius = 10
    save.clipsToBounds = true
    save.isEnabled = false
    save.addTarget(self, action: #selector(saveAct), for: UIControl.Event.touchUpInside)
    save.tintColor = UIColor.white
    view.addSubview(save)
    // SHOW SAVED BUTTON
    let showSaved = UIButton(type: UIButton.ButtonType.system)
    showSaved.frame = CGRect(x: 300, y: 50, width: 100, height: 40)
    showSaved.setTitle("ShowSaved", for: UIControl.State.normal)
    showSaved.backgroundColor = .systemGray
    showSaved.layer.cornerRadius = 15
    showSaved.clipsToBounds = true
    showSaved.tintColor = UIColor.black
    showSaved.addTarget(self, action: #selector(btnAction), for: UIControl.Event.touchUpInside)
    view.addSubview(showSaved)
    
    }
    
    // SAVE ACTION
    @objc func saveAct(){
        
        if(myFieldFN.text!.count > 0 && myFieldLN.text!.count > 0 && myFieldA.text!.count > 0  && myFieldEM.text!.count > 0 && myFieldPN.text!.count > 0 && dateTextField.text!.count > 0)
        {
    var array = [myFieldFN,myFieldLN,myFieldA,myFieldEM,myFieldPN,dateTextField].map{$0.text!}
     array.append(segments.titleForSegment(at:segments.selectedSegmentIndex)!)
  array.append(maratialStatusSeg.titleForSegment(at:maratialStatusSeg.selectedSegmentIndex)!)
        TFFArr.append(array)
         BothSegments()
                    
        }
        self.myFieldFN.text = nil
        self.myFieldLN.text = nil
        self.myFieldEM.text = nil
        self.myFieldA.text = nil
        self.myFieldPN.text = nil
        self.dateTextField.text = nil
        self.segments.isEnabled = false
        self.maratialStatusSeg.isEnabled = false
        
        print(TFFArr)
    }
    
    
    func remove(){
        for i in 0..<SArray.count{
            SArray[i].removeFromSuperview()
        }
    }
    
    // BUTTON ACTION
   @objc func btnAction(){
    let vc2 = v2()
               vc2.modalPresentationStyle = .fullScreen
               vc2.modalTransitionStyle = .flipHorizontal
            present(vc2, animated: true){[self] in
                var a = 0
                for i in 0..<self.TFFArr.count{
                vc2.textView = UITextView()
                vc2.textView.frame = CGRect(x: 30, y: 50+a, width: 400, height: 200)
                vc2.textView.contentSize = CGSize(width:self.view.frame.width, height:self.view.frame.height)
                vc2.textView.backgroundColor = .systemYellow
                vc2.textView.isEditable = false
                vc2.textView.font = .systemFont(ofSize: 15)
                //vc2.textView.text = "\(self.TFArr[i])"

                    vc2.textView.text = """
                     FirstName:\(self.TFFArr[i][0])
                     SecondName:\(self.TFFArr[i][1])
                     DateOfBirth:\(self.TFFArr[i][5])
                     Age:\(self.TFFArr[i][2])
                     EMailID:\(self.TFFArr[i][3])
                     PhoneNumber:\(self.TFFArr[i][4])
                     Gender:\(self.TFFArr[i][6])
                     MaritalStatus:\(self.TFFArr[i][7])
"""
                    print(self.TFFArr[i])

                vc2.textView.textColor = .black
               // vc2.view.addSubview(vc2.textView)
                vc2.SCTextView.addSubview(vc2.textView)
                 a += 100
                    
                }
    }
    }
}
extension   UITextField{
    func bottomLine(line:CALayer,field:UITextField){
        line.frame = CGRect(x: 0, y: 38, width: 340, height: 1.0)
        line.backgroundColor = UIColor.black.cgColor
        field.borderStyle = .none
        field.layer.addSublayer(line)
        
}
}


