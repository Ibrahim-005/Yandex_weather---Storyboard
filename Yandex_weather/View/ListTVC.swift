//
//  ListTVC.swift
//  Yandex_weather
//
//  Created by cloud_vfx on 18/07/22.
//

import UIKit

class ListTVC: UITableViewController {

    let emptyCity = Weather()
    var cityArray = [Weather]()
    var filterCityArray = [Weather]()
    
    var nameCityArray = ["Moscow", "New york","Sochi", "Doha","Paris","Berlin","London","Tashkent","Seoul","Namangan","Kosonsoy"]
    let searchController = UISearchController(searchResultsController: nil)
    
    var searchBarIsEmpty : Bool {
        guard let text = searchController.searchBar.text else {return false}
        return text.isEmpty
    }
    
    var isFiltering: Bool {
        searchController.isActive && !searchBarIsEmpty
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if cityArray.isEmpty{
            cityArray = Array(repeating: emptyCity, count: nameCityArray.count)
        }
        addCities()
        tableView.delegate = self
        tableView.dataSource = self
        
        searchController.searchResultsUpdater = self
        searchController.searchBar.placeholder = "Search"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

   
    @IBAction func AddCitybyAlert(_ sender: UIBarButtonItem) {
        alertCity(name: "City", placeHolder: "Add a new city ") { city in
            self.nameCityArray.append(city)
            self.cityArray.append(self.emptyCity)
            self.addCities()
        }
    }
    
    func addCities(){
        getWeather(cityArray: self.nameCityArray) { index, weather in
            self.cityArray[index] = weather
            self.cityArray[index].name = self.nameCityArray[index]

            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
// MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isFiltering {
            return filterCityArray.count
        } else{
            return cityArray.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ListCell
        var weather = Weather()
        
        if isFiltering {
            weather = filterCityArray[indexPath.row]
        }else{
            weather = cityArray[indexPath.row]
        }
        cell.configure(weather: weather)
        
        return cell
    }
    
    //Deleting un needed cities
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
      
        let delete = UIContextualAction(style: .destructive, title: "Delete") { _ , _ , completion in
            let editingRow = self.nameCityArray[indexPath.row]
       
            if let index = self.nameCityArray.firstIndex(of: editingRow){
                if self.isFiltering {
                    self.filterCityArray.remove(at: index)
                }
                else{
                    self.cityArray.remove(at: index)
                }
            }
            tableView.reloadData()
        }
        return UISwipeActionsConfiguration(actions: [delete])
    }

  // Carry city model to the detail view
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            guard let indexPath = tableView.indexPathForSelectedRow else {return}
            
            if isFiltering {
                let filter = filterCityArray[indexPath.row]
                let destination = segue.destination as! DetailView
                destination.weatherM = filter
            }
            else{
                let wData = cityArray[indexPath.row]
                let destination = segue.destination as! DetailView
                destination.weatherM = wData
            }
        }
    }
}

//MARK: - Searching filterly

extension ListTVC: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredContextForSearch(searchController.searchBar.text!)
    }
    
    func filteredContextForSearch(_ searchText: String){
        
        filterCityArray = cityArray.filter({ filter in
            filter.name.contains(searchText)
        })
        tableView.reloadData()
    }
}

