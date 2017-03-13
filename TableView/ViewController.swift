//
//  ViewController.swift
//  TableView
//
//  Created by Khuat Van Dung on 3/10/17.
//  Copyright © 2017 Khuat Van Dung. All rights reserved.
//

import UIKit
import os.log
class ViewController: UIViewController {
    var name: String?
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        if let name = name {
            textField.text = name
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            os_log("Log2", log: OSLog.default, type: .debug)
            return
        }
        let data = textField.text ?? ""
        name = data
    }
    

    @IBAction func cancel(_ sender: UIBarButtonItem) {
        let isPresentingInAddMode = presentingViewController is UINavigationController
        if isPresentingInAddMode {
            dismiss(animated: true, completion: nil)
        } else if let owningNavigationController =  navigationController {
            owningNavigationController.popViewController(animated: true)
        } else {
            fatalError("Error")
        }
    }
}
