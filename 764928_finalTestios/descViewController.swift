//
//  descViewController.swift
//  764928_finalTestios
//
//  Created by Kulvir Dhillon on 2020-01-25.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit

class descViewController: UIViewController {
    
    var currindex = -1
    var selectedproduct = false
    var choosenproduct: Product?
    @IBOutlet weak var descTextView: UITextView!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var idtextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        if selectedproduct{
            priceTextField.text = "\(choosenproduct?.price ?? 0.0)"
            idtextField.text = "\(choosenproduct?.id ?? 0) "
            nameTextField.text = choosenproduct?.name
            descTextView.text = choosenproduct?.description
//        }
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
