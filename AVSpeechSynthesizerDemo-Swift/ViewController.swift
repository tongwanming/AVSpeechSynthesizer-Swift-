//
//  ViewController.swift
//  AVSpeechSynthesizerDemo-Swift
//
//  Created by 童万明 on 2020/3/20.
//  Copyright © 2020 童万明. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    var av = AVSpeechSynthesizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        initData()
        // Do any additional setup after loading the view.
    }
    
    
    private func initData() {
        let utterance = AVSpeechUtterance.init(string: "黑化黑灰化肥灰会挥发发灰黑讳为黑灰花会回飞；灰化灰黑化肥会会挥发发黑灰为讳飞花回化为灰")//需要转换的文字
        //设置语音
        let type = AVSpeechSynthesisVoice.init(language: "zh-CN")
        utterance.voice = type
        //设置语速
        utterance.rate = 0.3
        //设置音量 （0.0~1.0）默认为1.0
        utterance.volume = 1.0
        //设置音调 (0.5-2.0)
        utterance.pitchMultiplier = 1.0
        //目的是让语音合成器播放下一语句前有短暂的暂停
        utterance.postUtteranceDelay = 10.0
        av.delegate = self
        av.speak(utterance)
        
    }

    @IBAction func stopActive(_ sender: Any) {
        if av.isSpeaking {
            av.pauseSpeaking(at: .immediate)
        }
    }
    
    @IBAction func playActive(_ sender: Any) {
        if av.isPaused {
            av.continueSpeaking()
        } else {
            av.pauseSpeaking(at: .immediate)
        }
    }
}

extension ViewController: AVSpeechSynthesizerDelegate {
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("开始播放")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("结束播放")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        print("暂停播放")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        print("继续播放")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        print("取消播放")
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
//        let str = utterance.speechString.substring(with: characterRange)
//        print("即将播放的语音文字：\(str)")
        print("即将播放的文字")
    }
}

