//
//  MainMenuViewController.swift
//  Xillion
//
//  Created by Robbie Merillat on 11/21/16.
//  Copyright © 2016 Robbie Merillat. All rights reserved.
//

import UIKit
import MediaPlayer

class MainMenuViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        playVideo()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var moviePlayer : MPMoviePlayerController?
    
    
    func playVideo() {
        let path = Bundle.main.path(forResource: "TitleVideo", ofType:"mov")
        let url = NSURL.fileURL(withPath: path!)
        
        moviePlayer = MPMoviePlayerController(contentURL: url)
        
        
        if let player = moviePlayer {
            
            player.view.frame = CGRect(x: 0, y: -80, width: self.view.frame.size.width, height: 550)
            player.prepareToPlay()
            player.scalingMode = .aspectFill
            player.controlStyle = .none
            player.shouldAutoplay = true
            player.repeatMode = MPMovieRepeatMode.one
            self.view.addSubview(player.view)
            self.view.sendSubview(toBack: player.view)
        }    
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "play" {
            moviePlayer?.pause()
        }
    }

}
