//
//  CartViewController.swift
//  ImageStream
//
//  Created by tejas Pashte on 10/9/16.
//  Copyright © 2016 tejas Pashte. All rights reserved.
//

import UIKit



class CartViewController: UITableViewController {
    
    var orders : [Order]? {
        didSet {
            tableView.reloadData()
        }
    }
    
    var total = 0.0

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        orders = Orders.readOrdersFromArchive()
        
        if let orders = orders {
            
            for order in orders  {
                
                total += Double((order.product?.price!)!)
                
            }
        }
        
        print(total)
        
        
    }
   
    

    // MARK: - Table view data source

  
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        //let order = orders?[indexPath.row]
        
       
        
        return orders?.count ?? 0
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath)
        
        
         let order = orders?[indexPath.row]
        
         let prices = [order?.product?.price]
//
//        
//        print("in table view")
//        for price in prices  {
//            total += Double(price!)
//            
//        }
//        
//       
//        print (total)
       
        
        cell.textLabel?.text = order?.product?.name
        
       
        return cell

    

    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        
    
        if editingStyle == .delete {
            // Delete the row from the data source
           orders?.remove(at: indexPath.row)
            if let orders = orders {
                Orders.saveOrdersToArchive(orders: orders)
            }
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

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
   

 

}
