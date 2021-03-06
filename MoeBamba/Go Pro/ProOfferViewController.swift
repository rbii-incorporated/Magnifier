//
//  ProOfferViewController.swift
//  MoeBamba
//
//  Created by John N Blanchard on 1/8/19.
//  Copyright © 2019 JNB. All rights reserved.
//

import UIKit
import StoreKit

class ProOfferViewController: UIViewController {
  @IBOutlet weak var currentCapacityLabel: UILabel!
  
  @IBOutlet weak var proButton: UIButton!
  
  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    return .portrait
  }
  
  override var shouldAutorotate: Bool { return false }
  
  
  var product: SKProduct?
  var album: CustomPhotoAlbum?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    forcePortrait()
    SKPaymentQueue.default().add(self)
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    currentCapacityLabel.text = "\(album?.count() ?? 0) / 300"
    proButton.layer.masksToBounds = false
    proButton.layer.shadowColor = UIColor.black.cgColor
    proButton.layer.shadowOffset = CGSize(width: 0, height: 0)
    proButton.layer.shadowOpacity = 0.55
  }
  
  @IBAction func xButtonTapped(_ sender: Any) {
    dismiss(animated: true, completion: nil)
  }
  
  @IBAction func proButtonTapped(_ sender: Any) {
    guard let firstProduct = product else { return }
    let payment = SKPayment(product: firstProduct)
    SKPaymentQueue.default().add(payment)
  }
  
  deinit {
    SKPaymentQueue.default().remove(self)
  }
}
