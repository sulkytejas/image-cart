//
//  ProductsTableViewController.swift
//  ImageStream
//
//  Created by tejas Pashte on 10/5/16.
//  Copyright © 2016 tejas Pashte. All rights reserved.
//

import UIKit

class ProductsTableViewController: UITableViewController {
    
      var products : [Product]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let product1 = Product()
        let product2 = Product()
        let product3 = Product()
        let product4 = Product()
        
        product1.name = "1970 Wall Street"
        product1.cellImage = "image-cell1"
        product1.productImage = "phone-fullscreen1"
        product1.price = 30
        
        product2.name = "1937 Fulton Street"
        product2.cellImage = "image-cell2"
        product2.productImage = "phone-fullscreen2"
        product2.price = 40
        
        product3.name = "1920 Nassau Street"
        product3.cellImage = "image-cell3"
        product3.productImage = "phone-fullscreen3"
        product3.price = 15
        
        product4.name = "1947 Freedom Strrugle"
        product4.cellImage = "image-cell4"
        product4.productImage = "phone-fullscreen4"
        product4.price = 90

        
        
        // Do any additional setup after loading the view.
        products = [product1, product2, product3, product4]
    
    
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section:Int) -> Int {
        if let p = products {
          return p.count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath)
        let product = products?[indexPath.row]
        
        if let p = product {
        cell.textLabel?.text = p.name
            if let i = p.cellImage {
                cell.imageView?.image = UIImage(named: i)

            }
            
        }
        return cell
    
    
       
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowProduct" {
            let productVC = segue.destination as? ProductViewController
            
            guard let cell = sender as? UITableViewCell,
                let indexPath = tableView.indexPath(for: cell) else {
                    return
            }
            productVC?.product = products?[indexPath.row]
        }
    }
   
}
