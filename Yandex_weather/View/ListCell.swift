//
//  ListCell.swift
//  Yandex_weather
//
//  Created by cloud_vfx on 19/07/22.
//

import UIKit

class ListCell: UITableViewCell {

    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var cityCondition: UILabel!
    @IBOutlet weak var tempCity: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
    }
    
    func configure(weather: Weather){
        self.cityName.text = weather.name
        self.cityCondition.text = weather.condition
        self.tempCity.text = weather.tempString
    }
}

