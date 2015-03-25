//
//  DoneViewController.swift
//  PacienteMovil
//
//  Created by Sebastian Valencia on 3/24/15.
//  Copyright (c) 2015 com.aura. All rights reserved.
//

import UIKit
import AVFoundation

class DoneViewController: UIViewController {
    var audioPlayer: AVAudioPlayer!
    var recivedAudio: RecordedAudio!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // if var filePath = NSBundle.mainBundle().pathForResource("movie_quote", ofType: "mp3"){
        //   var file = NSURL.fileURLWithPath(filePath)
        
        
        // } else {
        //     println("the file is empty!!")
        //}
        audioPlayer = AVAudioPlayer(contentsOfURL: recivedAudio.filePathUrl, error: nil)
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playAudio(sender: AnyObject) {
        audioPlayer.play()
    }
    
    @IBAction func stopsound(sender: AnyObject) {
        audioPlayer.stop()
    }
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}

