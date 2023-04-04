//
//  APiViewController.swift
//  ArrivalNotiApp
//
//  Created by 김주희 on 2023/03/31.
//

import UIKit
import Foundation

class APiViewController: UIViewController {

    
    @IBOutlet weak var inputBusRouteId: UITextField!
    
    var url : String = "http://ws.bus.go.kr/api/rest/arrive/getArrInfoByRouteAll?ServiceKey=<your service key>&busRouteId="
    
    override func viewDidLoad() {
        
    }
    
    func requestData(_ id: String) {
        if let url = URL(string : url.appending(id)){
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
    
    @IBAction func onActionCheck(_ sender: Any) {
        if inputBusRouteId.text != nil {
            requestData(inputBusRouteId.text ?? "")
        } else {
            
        }
        
    }
    
}
