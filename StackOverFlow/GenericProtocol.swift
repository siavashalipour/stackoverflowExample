////
////  GenericProtocol.swift
////  StackOverFlow
////
////  Created by Siavash Abbasalipour on 5/09/2016.
////  Copyright © 2016 MobileDen. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//
//protocol GenericDelegate: class {
//    associatedtype DataType
//    var name: String {get set}
//    func didFinishLoading(data: DataType)
//}
//
//class AnyGenericDelegate<ErasedDataType>: GenericDelegate {
//    
//    var name: String
//    private let _didFinishLoading: (ErasedDataType) -> Void
//    
//    init<Injected: GenericDelegate where Injected.DataType == ErasedDataType>(base: Injected) {
//        _didFinishLoading = base.didFinishLoading
//        name = base.name
//    }
//    func didFinishLoading(data: ErasedDataType) {
//        _didFinishLoading(data)
//    }
//}
//class TransactionViewController2: UIViewController, GenericDelegate {
//    
//    var name: String = "T"
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let detailVC = storyboard?.instantiateViewControllerWithIdentifier("TransactionDetailViewController2") as! TransactionDetailViewController2
//        detailVC.delegate = AnyGenericDelegate(base: self)
//    }
//    func didFinishLoading(data: Transaction) {
//        name = "\(data.name)-\(data.id)"
//    }
//}
//
//class ProductViewController2: UIViewController, GenericDelegate {
//    var name: String = "P"
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let detailVC = storyboard?.instantiateViewControllerWithIdentifier("ProductDetailViewController2") as! ProductDetailViewController2
//        detailVC.delegate = AnyGenericDelegate(base: self)
//    }
//    func didFinishLoading(data: Product) {
//        
//    }
//}
//
//class TransactionDetailViewController2: UIViewController {
//    var delegate: AnyGenericDelegate<Transaction>?
//}
//
//class ProductDetailViewController2: UIViewController {
//    var delegate: AnyGenericDelegate<Product>?
//}
//
