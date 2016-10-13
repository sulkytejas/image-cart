//
//  ProductViewController.swift
//  ImageStream
//
//  Created by tejas Pashte on 10/5/16.
//  Copyright © 2016 tejas Pashte. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {

    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productImageView: UIImageView!
   
    var product : Product?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
       if let p = product {
              productNameLabel.text = p.name
         if    let i = p.productImage {
                productImageView.image = UIImage(named:i)
            }
        }
        
    }

    @IBAction func addToCartPressed(_ sender: AnyObject) ->Void {
        print("Button Tapped")
        
        guard let product = product, let price = product.price else {
            return
        }
        
       
        
        let alertController = UIAlertController(title: "Saved to the Cart", message: "Your item was saved to the cart with the price of \(price)", preferredStyle: .alert)
        
      
        let action = UIAlertAction(title: "ok", style: .default, handler: nil)
        alertController.addAction(action)
        
        let order = Order()
        order.order_id = 1
        order.product = product
        
        print(order.product?.price)
        
        var orders = Orders.readOrdersFromArchive()
        orders?.append(order)
        
        if let orders = orders {
        
            if( Orders.saveOrdersToArchive(orders: orders)) {
                present(alertController, animated: true, completion: nil)
            }
        }
        
        
        
    }
}
