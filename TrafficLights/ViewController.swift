//
//  ViewController.swift
//  TrafficLights
//
//  Created by Dean Mollica on 27/1/18.
//  Copyright © 2018 Dean Mollica. All rights reserved.
//

import UIKit

enum possibleLightStates {
    case red, yellow, green, none
}

class ViewController: UIViewController {
    @IBOutlet weak var lightDescription: UILabel!
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!

    var lightState = possibleLightStates.none

    let lightRed = UIColor(red: 1, green: 0.8, blue: 0.8, alpha: 1)
    let lightYellow = UIColor(red: 1, green: 1, blue: 0.8, alpha: 1)
    let lightGreen = UIColor(red: 0.8, green: 1, blue: 0.8, alpha: 1)

    @IBAction func buttonPressed(_ sender: Any) {
        switch lightState {
        case .none:
            lightState = .red
        case .red:
            lightState = .green
        case .yellow:
            lightState = .red
        case .green:
            lightState = .yellow
        }
        updateUI()
    }

    func updateUI() {
        redLight.backgroundColor = lightState == .red ? .red : lightRed
        yellowLight.backgroundColor = lightState == .yellow ? .yellow : lightYellow
        greenLight.backgroundColor = lightState == .green ? .green : lightGreen
        
        switch lightState {
        case .red:
            view.backgroundColor = lightRed
            lightDescription.text = "Stop at the light."
        case .yellow:
            view.backgroundColor = lightYellow
            lightDescription.text = "The light will soon change to red. Stop at the light if it is safe to do so, otherwise go."
        case .green:
            view.backgroundColor = lightGreen
            lightDescription.text = "Go."
        default:
            view.backgroundColor = .white
            lightDescription.text = "This app explains what each colour of a traffic light means. It also shows the sequence of lights."
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

