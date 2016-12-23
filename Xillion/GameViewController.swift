//
//  GameViewController.swift
//  Xillion
//
//  Created by Robbie Merillat on 10/25/16.
//  Copyright © 2016 Robbie Merillat. All rights reserved.
//

import UIKit
import AVFoundation

class GameViewController:UIViewController {
    
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var textField: UITextField!
    
    var zork = Zork()
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        playGame()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        playmusic()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let bottom = textView.contentSize.height
        textView.setContentOffset(CGPoint(x: 0, y: bottom), animated: true)
    }
    
    @IBAction func editingDidEnd(_ sender: UITextField) {
        zork.SetInput(input: textField.text!)
        textView.text.append("> \(textField.text!) \n")
        textView.text.append("\(zork.turn()) \n")
        textField.text = ">"
        textField.resignFirstResponder()
    }
    
    @IBAction func tapGestureRecognized(_ sender: UITapGestureRecognizer) {
        textField.resignFirstResponder()
    }
    
    func playmusic() {
        let soundFilePath = Bundle.main.path(forResource: "STS", ofType: "mp3")
        let soundFileURL = URL(fileURLWithPath: soundFilePath!)
        do {
            self.player =  try AVAudioPlayer(contentsOf: soundFileURL)
            player.numberOfLoops = -1
            player.play()
        } catch {
            // well poo
        }
    }
    
    func playGame() {
        textView.text.append(zork.Introduction())
    }
    
    @IBAction func menuButtonPressed(_ sender: UIButton) {
        player.pause()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "map" {
            let detailVC = segue.destination as! mapViewController
            detailVC.player = self.player
        }
    }
}
