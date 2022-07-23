//
//  ViewController.swift
//  Yandex_weather
//
//  Created by cloud_vfx on 19/07/22.
//

import UIKit
import SwiftSVG

class DetailView: UIViewController {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var Condition1: UILabel!
    
    @IBOutlet weak var Condition: UILabel!
    @IBOutlet weak var tempCity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    
    var weatherM : Weather?
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshLabel()
    }
    
    func refreshLabel(){
        cityName.text = weatherM?.name
        let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(String(describing: weatherM!.conditionCode)).svg")!
//        let Wimage = UIView(SVGURL: url!) { (image) in
//            image.resizeToFit(self.cityView.bounds)
//        }
//        guard url != nil else {
//            print("XATTOOOO")
//            return
//        }
        let Wimage = UIView(SVGURL: url) { imagess in
            imagess.resizeToFit(self.cityView.bounds)
        }
        Wimage.sizeToFit()
        self.cityView.addSubview(Wimage)
      //  Condition1.text = weatherM?.condition
        tempCity.text = weatherM?.tempString
        pressure.text = String(format: "%.0f", weatherM!.pressureMm)
        windSpeed.text = String(format: "%.0f", weatherM!.windSpeed)
        tempMin.text = String(format: "%.0f", weatherM!.tempMin)
        tempMax.text = String(format: "%.0f", weatherM!.tempMax)
    }
    
}
