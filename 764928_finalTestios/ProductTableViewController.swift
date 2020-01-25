//
//  ProductTableViewController.swift
//  764928_finalTestios
//
//  Created by MacStudent on 2020-01-24.
//  Copyright © 2020 MacStudent. All rights reserved.
//

import UIKit
import CoreData

class ProductTableViewController: UITableViewController, UISearchResultsUpdating {
   
    
    
    
    var context: NSManagedObjectContext?
    
    
    let searchController = UISearchController(searchResultsController: nil)
    var filterProducts = [Product]()
     var  productsData = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        searchController.searchResultsUpdater = self
    searchController.obscuresBackgroundDuringPresentation = false
    definesPresentationContext = true
    navigationItem.searchController = searchController
        
    }
    func updateSearchResults(for searchController: UISearchController) {
        let search = searchController.searchBar
        filternamesOfProduct(search.text!)
    }

    func filternamesOfProduct(_ searchText: String) {
        filterProducts = Product.product.filter({ (pro: Product) -> Bool in
            return pro.name.lowercased().contains(searchText.lowercased())
        })
        tableView.reloadData()
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if searchController.isActive {
            return filterProducts.count
        }else{
            return Product.product.count ?? 0
            
        }
//        return productsData.count ?? 0
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "productCell", for: indexPath)
        let pro: Product
        if searchController.isActive  {
            pro = filterProducts[indexPath.row]
        }else {
            pro = Product.product[indexPath.row]
        }
//        let p = Product.product[indexPath.row]
//        cell.textLabel?.text = Product.product[indexPath.row].name
        cell.textLabel?.text = pro.name
        return cell
        
    }
    

    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if let destination = segue.destination as? descViewController{
            if let cell = sender as? UITableViewCell{
                let index = tableView.indexPath(for: cell)?.row
                let p :Product
                if searchController.isActive{
                    p = filterProducts[index!]
                }else {
                    p = Product.product[index!]
                    
                }
                destination.choosenproduct = p
                destination.selectedproduct = true
            }
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }

   
    
}
