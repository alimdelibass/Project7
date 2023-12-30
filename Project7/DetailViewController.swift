//
//  DetailViewController.swift
//  Project7
//
//  Created by alim on 30.12.2023.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {
    var webView : WKWebView!
    var detailItem : Petition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView = WKWebView()
        
        guard let detailItem = detailItem else {return}
        
        let Html = """
         <html>
        <head>
      <meta name "viewport" content= "width=device-width, initial-scale=1"
     <style> body{ font-size: 150%} </style>
    </head>
  <body>
\(detailItem.body)
</body>
</html>
"""
        webView.loadHTMLString(Html, baseURL: nil)
        
    }
}
