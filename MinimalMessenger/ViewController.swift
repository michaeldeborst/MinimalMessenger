//
//  ViewController.swift
//  MinimalMessenger
//
//  Created by Michael de Borst on 07/08/2021.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    let webView = WKWebView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(webView)
        
        guard let url = URL(string: "https://web.whatsapp.com") else {
        return
        }
        webView.load(URLRequest(url: url))
        
        DispatchQueue.main.asyncAfter(deadline: .now()+5) {
            self.webView.evaluateJavaScript("document.body.innerHTML") {
                 result, error in
                guard let html = result as? String, error == nil else {
                    return
                }
                print(html)
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        webView.frame = view.bounds
    }


}

