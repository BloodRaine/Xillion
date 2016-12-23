//
//  mapViewController.swift
//  Xillion
//
//  Created by Robbie Merillat on 12/5/16.
//  Copyright © 2016 Robbie Merillat. All rights reserved.
//

import UIKit
import AVFoundation

class mapViewController: UIViewController {
    
    var player: AVAudioPlayer!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func menuButtonPressed(_ sender: UIButton) {
        player.pause()
    }
}
