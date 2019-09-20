//
//  CountriesTableViewController.swift
//  CountryViewer
//
//  Created by Arturo Calvo on 9/18/19.
//  Copyright © 2019 Arturo Calvo. All rights reserved.
//

import UIKit
import SVGKit

class CountriesTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var countriesSearchBar: UISearchBar!
    
    var countries:[CountryModel]?
    var filteredCountries:[CountryModel] = []
    var countryFlags:[SVGKImage]?
    var searchInProgress = false
    let flagCache = NSCache<NSString, SVGKImage>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.countriesSearchBar.delegate = self
        self.countriesSearchBar.showsCancelButton = true
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func viewWillAppear(_ animated: Bool) {
        ServiceManager.sharedInstance.GetCountries(onSuccess: {
            response in
            self.countries = response
            DispatchQueue.global().async {
                //self.countryFlags = self.getCountriesFlags()
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if(self.countries != nil && !self.searchInProgress){
            return self.countries!.count
        }else{
            return self.filteredCountries.count
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CountryCell", for: indexPath) as! CountryTableViewCell
        var country = CountryModel()
        if(self.searchInProgress){
            country = self.filteredCountries[indexPath.row]
        }else{
            country = self.countries![indexPath.row]
        }
        
        if let cachedFlag = self.flagCache.object(forKey: country.name! as NSString){
            cell.configureCell(flag: cachedFlag, countryName: country.name!)
        }else{
            DispatchQueue.global(qos: .background).async {
                let image = self.getCountryFlag(country: country)
                
                DispatchQueue.main.async {
                    self.flagCache.setObject(image, forKey: NSString(string: country.name!))
                    cell.configureCell(flag: image, countryName: country.name!)
                }
            }
        }
        
        return cell
    }
    
    
    //MARK: SearchController Methods
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.searchInProgress = true
        let searchResult = self.countries?.filter({$0.name!.contains(searchText)})
        self.filteredCountries = searchResult!
        self.tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.searchInProgress = false
        self.countriesSearchBar.resignFirstResponder()
        self.countriesSearchBar.text = ""
        self.filteredCountries = []
        self.tableView.reloadData()
    }
    
    
    func getCountryFlag(country:CountryModel) -> SVGKImage {
        let image = SVGKImage(contentsOf: country.flag!)
        return image!
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
