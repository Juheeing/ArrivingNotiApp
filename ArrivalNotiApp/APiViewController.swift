//
//  APiViewController.swift
//  ArrivalNotiApp
//
//  Created by 김주희 on 2023/03/31.
//

import UIKit

class APiViewController: UIViewController {

    let url : String = "your url"
    
    override func viewDidLoad() {
        requestData()
    }
    
    func requestData() {
        if let url = URL(string : url){
            URLSession.shared.dataTask(with: url){ data, res, err in
                if let data = data{
                    
                    let decoder = JSONDecoder()
                
                    print(String(decoding:data , as : UTF8.self))
                    
                }
            }.resume()

        }
        else{
            print("url is nil")
        }
    }
    
}
