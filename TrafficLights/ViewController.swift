//
//  ViewController.swift
//  TrafficLights
//
//  Created by Dean Mollica on 27/1/18.
//  Copyright © 2018 Dean Mollica. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var lightDescription: UILabel!
    @IBOutlet weak var redLight: UIView!
    @IBOutlet weak var yellowLight: UIView!
    @IBOutlet weak var greenLight: UIView!
    
    // Enumeration for storing the current traffic light state
    enum possibleLightStates {
        case red, yellow, green, none
    }
    
    var lightState = possibleLightStates.none
    
    // Custom colours for the inactive lights
    let lightRed = UIColor(red: 1, green: 0.8, blue: 0.8, alpha: 1)
    let lightYellow = UIColor(red: 1, green: 1, blue: 0.8, alpha: 1)
    let lightGreen = UIColor(red: 0.8, green: 1, blue: 0.8, alpha: 1)

    // Handle the switching of the state when the button is pressed
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
        // Change background colour depending on the current state
        redLight.backgroundColor = lightState == .red ? .red : lightRed
        yellowLight.backgroundColor = lightState == .yellow ? .yellow : lightYellow
        greenLight.backgroundColor = lightState == .green ? .green : lightGreen
        
        // Update appropriate light and label with relevant information
        switch lightState {
        case .red:
            view.backgroundColor = lightRed
            lightDescription.text = "Stop at the light."
        case .yellow:
            view.backgroundColor = lightYellow
            lightDescription.text = "The light will soon change to red. Stop at the light if it is safe to do so, otherwise go through the intersection."
        case .green:
            view.backgroundColor = lightGreen
            lightDescription.text = "Go through the intersection."
        default:
            view.backgroundColor = .white
            lightDescription.text = "This app explains what each colour of a traffic light means. It also shows the sequence of lights."
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // Ensure UI is configured correctly for the inital state when the application loads
        updateUI()
    }


}

