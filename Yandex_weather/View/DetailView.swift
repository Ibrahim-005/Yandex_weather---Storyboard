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
    @IBOutlet weak var weatherICON: UIImageView!
    @IBOutlet weak var tempCity: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var windSpeed: UILabel!
    @IBOutlet weak var tempMin: UILabel!
    @IBOutlet weak var tempMax: UILabel!
    
    var weatherM : Weather?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        refreshLabel()
        setUpConstraint()
    }
    
    func refreshLabel(){
        cityName.text = weatherM?.name
        weatherICON.image = UIImage(systemName: weatherM?.icon ?? "")
        tempCity.text = weatherM?.tempString
        pressure.text = String(format: "%.0f", weatherM!.pressureMm)
        windSpeed.text = String(format: "%.0f", weatherM!.windSpeed)
        tempMin.text = String(format: "%.0f", weatherM!.tempMin)
        tempMax.text = String(format: "%.0f", weatherM!.tempMax)
    }
    
    func setUpConstraint(){
        NSLayoutConstraint.activate([
            weatherICON.widthAnchor.constraint(equalToConstant: 50),
            weatherICON.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}








//var imageView = UIImageView()
//        var image = UIImage(named: "work25")
//        imageView.image = image
//        dropoffLocationField.rightView = imageView
//        dropoffLocationField.rightViewMode = .always
//



//let url = URL(string: "https://yastatic.net/weather/i/icons/funky/dark/\(String(describing:
//weatherM!.conditionCode)).svg")!
//let Wimage = UIView(SVGURL: url) { imagess in
//    imagess.resizeToFit(self.cityView.bounds)
//}
//self.cityView.addSubview(Wimage)
