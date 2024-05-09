//
//  ViewController.swift
//  Lift_Panel
//
//  Created by Batch-2 on 11/03/24.
//

import UIKit

class ViewController: UIViewController {
    var floorDetails: Int = 0
    
    @IBOutlet var displayPanel: UILabel!
    @IBOutlet var floor1st: UILabel!
    @IBOutlet var floor2nd: UILabel!
    @IBOutlet var floor3rd: UILabel!
    @IBOutlet var floorGround: UILabel!
    @IBOutlet var floorB1: UILabel!
    @IBOutlet var floorB2: UILabel!
    @IBOutlet var floorB3: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func floors() {
        switch floorDetails {
        case 0: displayPanel.text = "Available parking slots🅿️..."
            floorDetails = 0
            floorGround.textColor = .red
            floor1st.textColor = .black
            floorB1.textColor = .black
            
        case 1: displayPanel.text = "Enjoy Coffee Here☕️..."
            floor1st.textColor = .red
            floor2nd.textColor = .black
            floorGround.textColor = .black
            
        case 2: displayPanel.text = "Boring Floor🥱..."
            floor2nd.textColor = .red
            floor3rd.textColor = .black
            floor1st.textColor = .black
            
        case 3: displayPanel.text = "Nothing to do here😑..."
            floor3rd.textColor = .red
            floor2nd.textColor = .black
            
        case -1: displayPanel.text = "Automatic Laundry Machines🧺..."
            floorB1.textColor = .red
            floorB2.textColor = .black
            floorGround.textColor = .black
            
        case -2: displayPanel.text = "Pantry Area🧑‍🍳..."
            floorB2.textColor = .red
            floorB3.textColor = .black
            floorB1.textColor = .black
            
        case -3: displayPanel.text = "Bhoots Stays Here👻..."
            floorB3.textColor = .red
            floorB2.textColor = .black
            
        default : displayPanel.text = "Get Out! Leave my lift alone..."
        }
    }
    
    @IBAction func goingUp(_ sender: Any) {
        floorDetails += 1
        floors()
        if floorDetails > 3 {
            displayPanel.text = "On Top Most Floor"
            floorDetails = 3
        }
    }
    
    
    @IBAction func goingDown(_ sender: Any) {
        floorDetails -= 1
        floors()
        if floorDetails < -3 {
            displayPanel.text = "On Last Floor."
            floorDetails = -3
        }
    }
}
