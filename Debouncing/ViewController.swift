//
//  ViewController.swift
//  Debouncing
//
//  Created by Ronak on 03/01/21.
//  Copyright © 2021 ronak. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var inputTextField: UITextField! {
        didSet {
            inputTextField.delegate = self
        }
    }


    @IBOutlet var outputLabel: UILabel!

    var debouncer: Debouncer?

    override func viewDidLoad() {
        super.viewDidLoad()
        debouncer = Debouncer.init(delay: 1.0, callback: callSomeWebService)

    }

    func callSomeWebService() {
        print("Debouncing API call")
        outputLabel.text = inputTextField.text
    }

}


extension ViewController : UITextFieldDelegate {

    func textField(_ textField: UITextField,
                   shouldChangeCharactersIn range: NSRange,
                   replacementString string: String) -> Bool {

        debouncer?.call()

        return true
    }

}
