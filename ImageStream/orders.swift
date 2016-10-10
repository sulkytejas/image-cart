//
//  orders.swift
//  ImageStream
//
//  Created by tejas Pashte on 10/9/16.
//  Copyright © 2016 tejas Pashte. All rights reserved.
//

import Foundation


class Orders: NSObject , NSCoding {

    var Orders: [Order]?
    
   
    
    required init?(coder aDecoder: NSCoder) {
    
        self.Orders = aDecoder.decodeObject(forKey:"orders") as! [Order]
        
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.Orders,forKey:"orders")
    }
    
    class func archiveFilePath() -> String {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
        return documentsDirectory.appendingPathComponent("cart.products").path
    }
    
    class func readOrdersFromArchive() -> [Order]? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: archiveFilePath()) as? [Order]
    }
    
    class func saveOrdersToArchive(orders: [Order]) -> Bool {
        return NSKeyedArchiver.archiveRootObject(orders, toFile: archiveFilePath())
    }

}
