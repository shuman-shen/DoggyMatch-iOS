//
//  CameraViewController.swift
//  DM1
//
//  Created by xKiddos on 22/9/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit
import AVKit
import CoreML
import Vision

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate  {
    @IBOutlet weak var cameraDisplay: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setUpCamera()
        }
        

        func setUpCamera(){ //Displays live feed from camera
            guard let device = AVCaptureDevice.default(for: .video) else{return}
            
            guard let input = try? AVCaptureDeviceInput(device: device) else {return}
            
            //create preview layer
            let session = AVCaptureSession()
           session.sessionPreset = .hd4K3840x2160
           
            
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.frame = view.frame
            cameraDisplay.layer.addSublayer(previewLayer)
            
            let output = AVCaptureVideoDataOutput()
            output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "CameraOutput"))
            
            session.addInput(input)
            session.addOutput(output)
            session.startRunning()
        }
        
        //check output
        func captureOutput(_ output: AVCaptureOutput, didOutput sampleBuffer: CMSampleBuffer, from connection: AVCaptureConnection) {
            guard let sampleBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else {return}
            scanImage(buffer: sampleBuffer)
        }
        
        func scanImage(buffer: CVPixelBuffer){
            guard let model = try? VNCoreMLModel(for: xKiddosClassifier().model) else {return}
            
            let request = VNCoreMLRequest(model: model) { request, _ in
                guard let results = request.results as? [VNClassificationObservation] else {return}
                guard let mostConfidentResult = results.first else {return}
               
                
                DispatchQueue.main.async{
                    if mostConfidentResult.confidence >= 0.9{
                        //let confidenceText = "\n \(Int(mostConfidentResult.confidence * 100.0))% confidenced"
                               
                        switch mostConfidentResult.identifier {
                        case "David":
                            self.resultLabel.text = "Hi David"
                           
                        case "Susan":
                            self.resultLabel.text = "Hi Susan"
                           
                        case "Karen":
                            self.resultLabel.text = "Hi Karen"
                           
                        default:
                            return
                        }
                    }else{
                        self.resultLabel.text = ""
                    }
                }
            }
            
            let requestHandler = VNImageRequestHandler(cvPixelBuffer: buffer, options: [:])
            do{
                try  requestHandler.perform([request])
            }catch{
                print(error)
            }
           
        }
    }

