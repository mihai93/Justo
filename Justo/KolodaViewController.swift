//
//  ViewController.swift
//  Justo
//
//  Created by Mihai on 2017-09-21.
//  Copyright © 2017 Mihai. All rights reserved.
//

import UIKit
import Koloda

class ViewController: MyKolodaViewController {
    @IBOutlet weak var kolodaView: KolodaView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    extension MyKolodaViewController: KolodaViewDataSource {
        
        func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
            return images.count
        }
        
        func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
            return UIImageView(image: images[index])
        }
        
        func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
            return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)[0] as? OverlayView
        }
    }
}
