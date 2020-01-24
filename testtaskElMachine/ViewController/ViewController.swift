//
//  ViewController.swift
//  testtaskElMachine
//
//  Created by Nikitin Nikita on 23/01/2020.
//  Copyright © 2020 Zlobrynya. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let obsr = ServerModel.getSimpleSearch(search: "git")
        _ = obsr.subscribe({ event in
            print("event \(event.element?.count)")
        })
    }


}

