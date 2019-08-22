//
//  ViewController.swift
//  SourceryApi
//
//  Created by Marcilio Junior on 18/08/19.
//  Copyright © 2019 Teamwork. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        ApiClient().fetchAll { (result) in
            print(result)
        }
    }


}

