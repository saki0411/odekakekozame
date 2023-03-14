//
//  cameraViewController.swift
//  odekakekozame
//

import UIKit
import AVFoundation
import FirebaseStorage
import Photos

class cameraViewController: UIViewController, AVCaptureMetadataOutputObjectsDelegate {
    
    var captureSession: AVCaptureSession!
    var previewLayer: AVCaptureVideoPreviewLayer!
    var qrCodeFrameView: UIView!
    var imageView: UIImageView!
    var closeButton: UIButton!
    
    var stampindex1: Int = 0
    var stampindex2: Int = 0
    var stampindex3: Int = 0
    var stampindex4: Int = 0
    var stampindex5: Int = 0
    var stampindex6: Int = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height))
      
        view.addSubview(imageView)
      
        
        qrCodeFrameView = UIView()
        qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
        qrCodeFrameView.layer.borderWidth = 2
        view.addSubview(qrCodeFrameView)
        // カメラアクセス許可を要求する
        AVCaptureDevice.requestAccess(for: .video) { granted in
            if !granted {
                // 許可されなかった場合は、アラートを表示する
                let alert = UIAlertController(title: "カメラへのアクセスが許可されていません", message: "設定からカメラへのアクセスを許可してください。", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
                alert.addAction(okAction)
                self.present(alert, animated: true, completion: nil)
            } else {
                // カメラアクセスが許可された場合は、カメラを起動する
                self.setupCaptureSession()
                self.setupPreviewLayer()
                self.setupQRCodeFrameView()
                DispatchQueue.main.async {
                    self.view.addSubview(self.imageView)
                }
            }
        }
        guard let captureSession = self.captureSession else {
            return
        }
        
        let previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        self.previewLayer = previewLayer
        
        // カメラの初期化を非同期で実行する
        
        DispatchQueue.global(qos: .userInitiated).async {
            let captureSession = AVCaptureSession()
            guard let captureDevice = AVCaptureDevice.default(for: .video),
                  let input = try? AVCaptureDeviceInput(device: captureDevice) else {
                return
            }
            captureSession.addInput(input)
            
            DispatchQueue.main.async {
                self.previewLayer.session = captureSession
                captureSession.startRunning()
            }
        }
    }
    
    
    
    
    func setupCaptureSession() {
        captureSession = AVCaptureSession()
        
        guard let videoCaptureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            videoInput = try AVCaptureDeviceInput(device: videoCaptureDevice)
        } catch {
            return
        }
        
        if captureSession.canAddInput(videoInput) {
            captureSession.addInput(videoInput)
        } else {
            return
        }
        
        let metadataOutput = AVCaptureMetadataOutput()
        
        if captureSession.canAddOutput(metadataOutput) {
            captureSession.addOutput(metadataOutput)
            
            metadataOutput.setMetadataObjectsDelegate(self, queue: DispatchQueue.main)
            metadataOutput.metadataObjectTypes = [.qr]
        } else {
            return
        }
        
        captureSession.startRunning()
    }
    
    func setupPreviewLayer() {
        previewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        previewLayer.videoGravity = .resizeAspectFill
        DispatchQueue.main.async { [self] in
            previewLayer.frame = CGRect(x: (view.bounds.width - 250) / 2, y: (view.bounds.height - 250) / 2, width: 250, height: 250)

            view.layer.addSublayer(previewLayer)
        }
        
    }
    
    func setupQRCodeFrameView() {
        DispatchQueue.main.async { [self] in
            qrCodeFrameView = UIView()
            qrCodeFrameView.layer.borderColor = UIColor.green.cgColor
        }
        
        
        DispatchQueue.main.async { [self] in
            qrCodeFrameView.layer.borderWidth = 2
            view.addSubview(qrCodeFrameView)
            view.bringSubviewToFront(qrCodeFrameView)
        }
        DispatchQueue.main.async { [self] in
            qrCodeFrameView.frame = CGRect.zero
        }
    }
    
    func metadataOutput(_ output: AVCaptureMetadataOutput, didOutput metadataObjects: [AVMetadataObject], from connection: AVCaptureConnection) {
        
        if metadataObjects.count == 0 {
            qrCodeFrameView.frame = CGRect.zero
            return
        }
        
        let metadataObj = metadataObjects[0] as! AVMetadataMachineReadableCodeObject
        
        if metadataObj.type == .qr, let qrCode = metadataObj.stringValue {
            DispatchQueue.main.async {
                if let qrCodeFrameView = self.qrCodeFrameView {
                    qrCodeFrameView.frame = metadataObj.bounds
                }
                if let url = URL(string: qrCode) {
                    URLSession.shared.dataTask(with: url) { [self] data, response, error in
                        guard let data = data, error == nil else { return }
                        
                        _ = UIImage(data: data)
                        saveImageToCameraRoll(UIImage(data: data)!)
                        DispatchQueue.main.async {
                            let alert: UIAlertController = UIAlertController(title: "保存", message: "写真の保存に成功しました", preferredStyle: .alert)
                            
                            alert.addAction(
                                UIAlertAction(
                                    title: "OK",
                                    style: .default,
                                    handler: { action in
                                        self.dismiss(animated: true, completion: nil)
                                    }
                                )
                            )
                            self.present(alert,animated: true,completion: nil)
                            
                            
                        }
                    }.resume()
                }
                self.view.layoutIfNeeded()
            }
        }
        
        captureSession.stopRunning()
      
        
        // 2. AVCaptureVideoPreviewLayerを非表示にする
        previewLayer.isHidden = true
        
        // QRコードに書かれた文字列が"sample"だった場合に、ボタンの画像を変更する
        if metadataObj.stringValue == "こザメ1" {
            stampindex1 = 1
            idou()
        }
        else if metadataObj.stringValue == "こザメ2" {
            stampindex2 = 1
            idou()
        }
        else if metadataObj.stringValue == "こザメ3" {
            stampindex3 = 1
            idou()
        }
        else if metadataObj.stringValue == "こザメ4" {
            stampindex4 = 1
            idou()
        }
        else if metadataObj.stringValue == "こザメ5" {
            stampindex5 = 1
            idou()
        }
        else  if metadataObj.stringValue == "こザメ6" {
            stampindex6 = 1
            idou()
        }
    }
    
    
    func idou(){
        // storyboardのインスタンス取得
        
        let storyboard: UIStoryboard = self.storyboard!
        
        // 遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "main") as! ViewController
        
        // ①値の設定
        nextView.stampindex1 = stampindex1
        nextView.stampindex2 = stampindex2
        nextView.stampindex3 = stampindex3
        nextView.stampindex4 = stampindex4
        nextView.stampindex5 = stampindex5
        nextView.stampindex6 = stampindex6
        
        // 画面遷移
        self.present(nextView, animated: true, completion: nil)
        
        
    }
    func saveImageToCameraRoll(_ image: UIImage) {
        PHPhotoLibrary.shared().performChanges({
            PHAssetChangeRequest.creationRequestForAsset(from: image)
        }) { success, error in
            if success {
                
                print("Image saved to camera roll.")
            } else if let error = error {
                print("Error saving image to camera roll: \(error.localizedDescription)")
            }
        }
    }
    
    @IBAction func closebutton(){
        
    }
}



