//
//  ViewController.swift
//  Justo
//
//  Created by Delia on 2017-09-21.
//

import UIKit
import Koloda

private var numberOfCards: Int = 5

class ViewController: UIViewController {

    @IBOutlet weak var kolodaView: KolodaView!
    
    fileprivate var dataSource: [UIImage] = {
        var array: [UIImage] = []
        for index in 0..<numberOfCards {
            array.append(UIImage(named: "Card_like_\(index + 1)")!)
        }
        
        return array
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        kolodaView.dataSource = self
        kolodaView.delegate = self
        
        self.modalTransitionStyle = UIModalTransitionStyle.flipHorizontal
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func leftButtonTapped() {
        kolodaView?.swipe(.left)
    }
    
    @IBAction func rightButtonTapped() {
        kolodaView?.swipe(.right)
    }
    
    @IBAction func undoButtonTapped() {
        kolodaView?.revertAction()
    }
}

extension ViewController: KolodaViewDelegate {
    func kolodaDidRunOutOfCards(_ koloda: KolodaView) {
        let position = kolodaView.currentCardIndex
        for i in 1...4 {
            dataSource.append(UIImage(named: "Card_like_\(i)")!)
        }
        kolodaView.insertCardAtIndexRange(position..<position + 4, animated: true)
    }
    
    func koloda(_ koloda: KolodaView, didSelectCardAt index: Int) {
        UIApplication.shared.open(URL(string: "https://leilarae.weebly.com/")!, options: [:], completionHandler: nil)
    }
}

extension ViewController: KolodaViewDataSource {
    func kolodaSpeedThatCardShouldDrag(_ koloda: KolodaView) -> DragSpeed {
        return .default
    }

    
    func kolodaNumberOfCards(_ koloda:KolodaView) -> Int {
        return dataSource.count
    }
    
    func koloda(_ koloda: KolodaView, viewForCardAt index: Int) -> UIView {
        let customView = UIView()
        customView.frame = CGRect.init(x: 0, y: 0, width: 100, height: 200)
        customView.backgroundColor = UIColor.white //give color to the view
        customView.center = self.view.center
        
        return customView
    }
    
    func koloda(_ koloda: KolodaView, viewForCardOverlayAt index: Int) -> OverlayView? {
        return Bundle.main.loadNibNamed("OverlayView", owner: self, options: nil)?[0] as? OverlayView
    }
}
