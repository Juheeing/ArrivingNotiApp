//
//  APiViewController.swift
//  ArrivalNotiApp
//
//  Created by 김주희 on 2023/03/31.
//

import UIKit
import Foundation

class APiViewController: UIViewController, XMLParserDelegate {

    
    @IBOutlet weak var inputBusRouteId: UITextField!
    
    var isLock = true
    var tagType : ArrInfoByRouteAllData = .none
    var tempModel: item?
    var data: [item] = []
    
    var serviceKey : String = "your service key"
    
    override func viewDidLoad() {
        
    }
    
    func requestData(_ id: String) {
        var parser : XMLParser
        var url = URL(string : "http://ws.bus.go.kr/api/rest/arrive/getArrInfoByRouteAll?ServiceKey=\(serviceKey)busRouteId=\(id)")
        parser = XMLParser(contentsOf: url!)!
        parser.delegate = self
        parser.parse()
    }
    
    // 태그 시작
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "item" {
            isLock = true
            tempModel = item.init()
        } else if elementName == "arrmsg1" {
            tagType = .arrmsg1
        } else if elementName == "arrmsg2" {
            tagType = .arrmsg2
        } else if elementName == "arsId" {
            tagType = .arsId
        } else if elementName == "avgCf1" {
            tagType = .avgCf1
        } else if elementName == "avgCf2" {
            tagType = .avgCf2
        } else if elementName == "brdrde_Num2" {
            tagType = .brdrde_Num2
        } else if elementName == "brerde_Div1" {
            tagType = .brerde_Div1
        } else if elementName == "brerde_Div2" {
            tagType = .brerde_Div2
        } else if elementName == "busRouteAbrv" {
            tagType = .busRouteAbrv
        } else if elementName == "busRouteId" {
            tagType = .busRouteId
        } else if elementName == "busType1" {
            tagType = .busType1
        } else if elementName == "busType2" {
            tagType = .busType2
        } else if elementName == "deTourAt" {
            tagType = .deTourAt
        } else if elementName == "dir" {
            tagType = .dir
        } else if elementName == "expCf1" {
            tagType = .expCf1
        } else if elementName == "expCf2" {
            tagType = .expCf2
        } else if elementName == "exps1" {
            tagType = .exps1
        } else if elementName == "exps2" {
            tagType = .exps2
        } else if elementName == "firstTm" {
            tagType = .firstTm
        } else if elementName == "full1" {
            tagType = .full1
        } else if elementName == "full2" {
            tagType = .full2
        } else if elementName == "goal1" {
            tagType = .goal1
        } else if elementName == "goal2" {
            tagType = .goal2
        } else if elementName == "isArrive1" {
            tagType = .isArrive1
        } else if elementName == "isArrive2" {
            tagType = .isArrive2
        } else if elementName == "isLast1" {
            tagType = .isLast1
        } else if elementName == "isLast2" {
            tagType = .isLast2
        } else if elementName == "kalCf1" {
            tagType = .kalCf1
        } else if elementName == "kalCf2" {
            tagType = .kalCf2
        } else if elementName == "kals1" {
            tagType = .kals1
        } else if elementName == "kals2" {
            tagType = .kals2
        } else if elementName == "lastTm" {
            tagType = .lastTm
        } else if elementName == "mkTm" {
            tagType = .mkTm
        } else if elementName == "namin2Sec1" {
            tagType = .namin2Sec1
        } else if elementName == "namin2Sec2" {
            tagType = .namin2Sec2
        } else if elementName == "neuCf1" {
            tagType = .neuCf1
        } else if elementName == "neuCf2" {
            tagType = .neuCf2
        } else if elementName == "neus1" {
            tagType = .neus1
        } else if elementName == "neus2" {
            tagType = .neus2
        } else if elementName == "nextBus" {
            tagType = .nextBus
        } else if elementName == "nmain2Ord1" {
            tagType = .nmain2Ord1
        } else if elementName == "nmain2Ord2" {
            tagType = .nmain2Ord2
        } else if elementName == "nmain2Stnid1" {
            tagType = .nmain2Stnid1
        } else if elementName == "nmain2Stnid2" {
            tagType = .nmain2Stnid2
        } else if elementName == "nmain3Ord1" {
            tagType = .nmain3Ord1
        } else if elementName == "nmain3Ord2" {
            tagType = .nmain3Ord2
        } else if elementName == "nmain3Sec1" {
            tagType = .nmain3Sec1
        } else if elementName == "nmain3Sec2" {
            tagType = .nmain3Sec2
        } else if elementName == "nmain3Stnid1" {
            tagType = .nmain3Stnid1
        } else if elementName == "nmain3Stnid2" {
            tagType = .nmain3Stnid2
        } else if elementName == "nmainOrd1" {
            tagType = .nmainOrd1
        } else if elementName == "nmainOrd2" {
            tagType = .nmainOrd2
        } else if elementName == "nmainSec1" {
            tagType = .nmainSec1
        } else if elementName == "nmainSec2" {
            tagType = .nmainSec2
        } else if elementName == "nmainStnid1" {
            tagType = .nmainStnid1
        } else if elementName == "nmainStnid2" {
            tagType = .nmainStnid2
        } else if elementName == "nstnId1" {
            tagType = .nstnId1
        } else if elementName == "nstnId2" {
            tagType = .nstnId2
        } else if elementName == "nstnOrd1" {
            tagType = .nstnOrd1
        } else if elementName == "nstnOrd2" {
            tagType = .nstnOrd2
        } else if elementName == "nstnSec1" {
            tagType = .nstnSec1
        } else if elementName == "nstnSec2" {
            tagType = .nstnSec2
        } else if elementName == "nstnSpd1" {
            tagType = .nstnSpd1
        } else if elementName == "nstnSpd2" {
            tagType = .nstnSpd2
        } else if elementName == "plainNo1" {
            tagType = .plainNo1
        } else if elementName == "plainNo2" {
            tagType = .plainNo2
        } else if elementName == "rerdie_Div1" {
            tagType = .rerdie_Div1
        } else if elementName == "rerdie_Div2" {
            tagType = .rerdie_Div2
        } else if elementName == "reride_Num1" {
            tagType = .reride_Num1
        } else if elementName == "reride_Num2" {
            tagType = .reride_Num2
        } else if elementName == "routeType" {
            tagType = .routeType
        } else if elementName == "rtNm" {
            tagType = .rtNm
        } else if elementName == "sectOrd1" {
            tagType = .sectOrd1
        } else if elementName == "sectOrd2" {
            tagType = .sectOrd2
        } else if elementName == "stId" {
            tagType = .stId
        } else if elementName == "stNm" {
            tagType = .stNm
        } else if elementName == "staOrd" {
            tagType = .staOrd
        } else if elementName == "term" {
            tagType = .term
        } else if elementName == "traSpd1" {
            tagType = .traSpd1
        } else if elementName == "traSpd2" {
            tagType = .traSpd2
        } else if elementName == "traTime1" {
            tagType = .traTime1
        } else if elementName == "traTime2" {
            tagType = .traTime2
        } else if elementName == "vehId1" {
            tagType = .vehId1
        } else if elementName == "vehId2" {
            tagType = .vehId2
        } else {
            tagType = .none
        }
    }
    
    // 태그 끝
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
            
        }
    
    // 태그 안의 내용
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        
    }
    
    @IBAction func onActionCheck(_ sender: Any) {
        if inputBusRouteId.text != nil {
            requestData(inputBusRouteId.text ?? "")
        } else {
            
        }
        
    }
    
}
