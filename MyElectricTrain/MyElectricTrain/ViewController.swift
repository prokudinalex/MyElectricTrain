//
//  ViewController.swift
//  MyElectricTrain
//
//  Created by Admin on 13.10.2018.
//  Copyright © 2018 prokudin. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func search() {
        if textField.text!.isEmpty {
            print("Search text is empty")
            return
        }
        
        let searchText = textField.text!
        let urlPath = "http://express-prigorod.ru/schedule/?show_stations=\(searchText)"
        print("Load: \(urlPath)")
        
        if let encodedUrl = urlPath.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
            let url = URL(string: encodedUrl) {
                print("loading...")
                webView.load(URLRequest(url: url))
        } else {
            print("can't load")
        }
    }
    
}
