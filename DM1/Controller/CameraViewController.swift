//
//  CameraViewController.swift
//  DM1
//
//  Created by karen lee on 12/10/19.
//  Copyright © 2019 karen lee. All rights reserved.
//

import UIKit
import AVKit
import CoreML
import Vision

class CameraViewController: UIViewController, AVCaptureVideoDataOutputSampleBufferDelegate {
    
    @IBOutlet weak var cameraDisplay: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func takePhoto(_ sender: Any) {
        //capture()
         let alertController = UIAlertController(title: "Take Photo", message: "Photo taken", preferredStyle: .alert)
    }
    
    var captureSession:AVCaptureSession?
    var photoOutput = AVCapturePhotoOutput()
    
    override func viewDidLoad() {
            super.viewDidLoad()
            setUpCamera()
        }
        
    func getFrontCamera() -> AVCaptureDevice?{
        return AVCaptureDevice.default(.builtInWideAngleCamera, for:AVMediaType.video, position: AVCaptureDevice.Position.front)!
    }
    
        func setUpCamera(){ //Displays live feed from camera
            guard let device = AVCaptureDevice.default(for: .video) else{return}
            
            guard let input = try? AVCaptureDeviceInput(device: device) else {return}
            //getFrontCamera()
            //create preview layer
            let session = AVCaptureSession()
           session.sessionPreset = .hd4K3840x2160
           
            
            
            let previewLayer = AVCaptureVideoPreviewLayer(session: session)
            previewLayer.frame = view.frame
            cameraDisplay.layer.addSublayer(previewLayer)
            
            let output = AVCaptureVideoDataOutput()
            output.setSampleBufferDelegate(self, queue: DispatchQueue(label: "CameraOutput"))
            
           /* if (self.captureSession?.canAddOutput(self.photoOutput))! {
                self.captureSession?.addOutput(self.photoOutput)
            } else {
                print("Error: Couldn't add data output")
                return
            }*/
            
            session.addInput(input)
            session.addOutput(output)
            session.startRunning()
        }
    
    @objc func capture() {//photo
        let settings = AVCapturePhotoSettings()
        photoOutput.capturePhoto(with: settings, delegate: self as! AVCapturePhotoCaptureDelegate)
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
                            self.resultLabel.text = "Hi "
                           
                        case "Susan":
                            self.resultLabel.text = "Hi "
                           
                        case "Karen":
                            self.resultLabel.text = "Hi "
                           
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

