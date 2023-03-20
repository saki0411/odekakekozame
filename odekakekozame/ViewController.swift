//
//  ViewController.swift
//  odekakekozame
//
//  Created by saki on 2023/02/24.
//


import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    @IBOutlet var haikeiimageView: UIImageView!
    @IBOutlet var manga1imageView: UIImageView!
    @IBOutlet var manga2imageView: UIImageView!
    @IBOutlet var manga3imageView: UIImageView!
    @IBOutlet var manga4imageView: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var mangahaikeiimageView: UIImageView!
    @IBOutlet var stampbutton: UIButton!
    @IBOutlet var stampbutton2: UIButton!
    @IBOutlet var stampbutton3: UIButton!
    @IBOutlet var stampbutton4: UIButton!
    @IBOutlet var stampbutton5: UIButton!
    @IBOutlet var stampbutton6: UIButton!
    
    
    
    
    var imageNameArray: [String] = ["kozame1","kozame2","kozame3","kozame4","bikkuri","manngastamp"]
    var imageIndex: Int = 0
    var imageView: UIImageView!
    var tapindex: Int = 0
    var Photoselect: Int = 0
    var stampindex1: Int = 0
    var stampindex2: Int = 0
    var stampindex3: Int = 0
    var stampindex4: Int = 0
    var stampindex5: Int = 0
    var stampindex6: Int = 0
    var stampStatus: Bool = false
    var stampStatus2: Bool = false
    var stampStatus3: Bool = false
    var stampStatus4: Bool = false
    var stampStatus5: Bool = false
    var stampStatus6: Bool = false
    var phototap: Int = 0
    var tapkakunin: Int = 0
    var tap: Int = 0
    var tap2: Int = 0
    var tap3: Int = 0
    var tap4: Int = 0
    var tap5: Int = 0
    var tap6: Int = 0
    
    
    var saveData: UserDefaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = CGSize(width: 415, height: 238)
        
        
        // Do any additional setup after loading the view.
        savedataload()
        
        
        if saveData.object(forKey:"stampindex1") != nil{
            stampindex1 = saveData.object(forKey:"stampindex1") as! Int
        }
        
        if saveData.object(forKey:"stampindex2") != nil{
            stampindex2 = saveData.object(forKey:"stampindex2") as! Int
        }
        
        if saveData.object(forKey:"stampindex3") != nil{
            stampindex3 = saveData.object(forKey:"stampindex3") as! Int
        }
        
        if saveData.object(forKey:"stampindex4") != nil{
            stampindex4 = saveData.object(forKey:"stampindex4") as! Int
        }
        
        if saveData.object(forKey:"stampindex5") != nil{
            stampindex5 = saveData.object(forKey:"stampindex5") as! Int
        }
        
        if saveData.object(forKey:"stampindex6") != nil{
            stampindex6 = saveData.object(forKey:"stampindex6") as! Int
            
        }
        
        
        savedataload()
        
    }
    
    @IBAction func stamp1(){
        switch stampStatus{
        case false:
            stampStatus.toggle()
            print(stampStatus)
            if phototap != 1 && tapkakunin == 0 && tap == 0{
                if stampindex1 == 1{
                    if Photoselect == 0{
                        imageIndex = 1
                        phototap = 1
                        tapkakunin = 1
                        tap = 1
                        let stampImage = UIImage(named: "kozame1_black")
                        self.stampbutton.setImage(stampImage, for: .normal)
                        print("c", phototap)
                        print("c", tapkakunin)
                        
                    }
                }
                
            }
            break
        case true:
            stampStatus.toggle()
            print(stampStatus)
            if phototap == 1 && tap == 1{
                imageIndex = 0
                phototap = 0
                tapkakunin = 0
                tap = 0
                let stampImage = UIImage(named: "kozame1")
                self.stampbutton.setImage(stampImage, for: .normal)
                print("d", phototap)
                print("d", tapkakunin)
                
                
            }
            break
        default:
            break
        }
        
        
        
        
    }
    @IBAction func stamp2(){
        switch stampStatus2{
        case false:
            stampStatus2.toggle()
            print(stampStatus2)
            
            if phototap != 1 && tapkakunin == 0 && tap2 == 0{
                if stampindex2 == 1{
                    imageIndex = 2
                    phototap = 1
                    tapkakunin = 1
                    tap2 = 1
                    let stampImage = UIImage(named: "kozame2_black")
                    self.stampbutton2.setImage(stampImage, for: .normal)
                    print("a", phototap)
                    print("a", tapkakunin)
                    
                }
            }
            
            break
        case true:
            stampStatus2.toggle()
            print(stampStatus2)
            if phototap == 1 && tap2 == 1{
                imageIndex = 0
                phototap = 0
                tapkakunin = 0
                tap2 = 0
                let stampImage = UIImage(named: "kozame2")
                self.stampbutton2.setImage(stampImage, for: .normal)
                print("b", phototap)
                print("b", tapkakunin)
            }
            
            break
        default:
            break
        }
        
        
    }
    @IBAction func stamp3(){
        switch stampStatus3{
        case false:
            stampStatus3.toggle()
            print(stampStatus3)
            if phototap != 1 && tapkakunin == 0 && tap3 == 0{
                if stampindex3 == 1{
                    imageIndex = 3
                    phototap = 1
                    tapkakunin = 1
                    tap3 = 1
                    let stampImage = UIImage(named: "kozame3_black")
                    self.stampbutton3.setImage(stampImage, for: .normal)
                    
                }
            }
            
            
            break
        case true:
            stampStatus3.toggle()
            print(stampStatus3)
            if phototap == 1 && tap3 == 1{
                imageIndex = 0
                phototap = 0
                tapkakunin = 0
                tap3 = 0
                let stampImage = UIImage(named: "kozame3")
                self.stampbutton3.setImage(stampImage, for: .normal)
            }
            
            break
        default:
            break
        }
        
        
    }
    @IBAction func stamp4(){
        switch stampStatus4{
        case false:
            stampStatus4.toggle()
            print(stampStatus4)
            if phototap != 1 && tapkakunin == 0 && tap4 == 0{
                if stampindex4 == 1{
                    imageIndex = 4
                    phototap = 1
                    tapkakunin = 1
                    tap4 = 1
                    let stampImage = UIImage(named: "kozame4_black")
                    self.stampbutton4.setImage(stampImage, for: .normal)
                    
                }
            }
            
            break
        case true:
            stampStatus4.toggle()
            print(stampStatus4)
            if phototap == 1 && tap4 == 1{
                imageIndex = 0
                phototap = 0
                tapkakunin = 0
                tap4 = 0
                let stampImage = UIImage(named: "kozame4")
                self.stampbutton4.setImage(stampImage, for: .normal)
            }
            
            break
        default:
            break
        }
        
        
    }
    @IBAction func stamp5(){
        switch stampStatus5{
        case false:
            stampStatus5.toggle()
            print(stampStatus5)
            if phototap != 1 && tapkakunin == 0 && tap5 == 0{
                if stampindex5 == 1{
                    imageIndex = 5
                    phototap = 1
                    tapkakunin = 1
                    tap5 = 1
                    let stampImage = UIImage(named: "bikkuri_black")
                    self.stampbutton5.setImage(stampImage, for: .normal)
                }
            }
            
            break
        case true:
            stampStatus5.toggle()
            print(stampStatus5)
            if phototap == 1 && tap5 == 1{
                imageIndex = 0
                phototap = 0
                tapkakunin = 0
                tap5 = 0
                let stampImage = UIImage(named: "bikkuri")
                self.stampbutton5.setImage(stampImage, for: .normal)
            }
            
            break
        default:
            break
        }
        
    }
    @IBAction func stamp6(){
        switch stampStatus6{
        case false:
            stampStatus6.toggle()
            print(stampStatus6)
            if phototap != 1 && tapkakunin == 0 && tap6 == 0{
                if stampindex6 == 1{
                    imageIndex = 6
                    phototap = 1
                    tapkakunin = 1
                    tap6 = 1
                    let stampImage = UIImage(named: "manngastamp_black")
                    self.stampbutton6.setImage(stampImage, for: .normal)
                }
            }
            
            break
        case true:
            stampStatus6.toggle()
            print(stampStatus6)
            if phototap == 1 && tap6 == 1{
                imageIndex = 0
                phototap = 0
                tapkakunin = 0
                tap6 = 0
                let stampImage = UIImage(named: "manngastamp")
                self.stampbutton6.setImage(stampImage, for: .normal)
                
            }
            
            break
        default:
            break
        }
        
    }
    @IBAction func QRbutton(){
        
    }
    @IBAction func hozon(){
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if imageIndex != 0 && imageIndex != 7{
            let touch: UITouch = touches.first!
            let location: CGPoint = touch.location(in: self.view)
            var addImageView = UIImageView()
            if Photoselect == 0{
                if imageIndex == 3{
                    addImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 80))
                }else if imageIndex == 4{
                    addImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 115, height: 75))
                }
                else{
                    addImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 80, height: 80))
                }
            }
            
            if imageIndex != 8{
                let image: UIImage = UIImage(named: imageNameArray[imageIndex - 1])!
                print(image)
                addImageView.image = image
                
                addImageView.isUserInteractionEnabled = true
                
                addImageView.center = CGPoint(x: location.x, y: location.y)
                
                self.view.addSubview(addImageView)
                
            }
            
            guard let touch = touches.first,
                  let tappedImageView = touch.view as? UIImageView,
                  tappedImageView != haikeiimageView,
                  tappedImageView != manga1imageView,
                  tappedImageView != manga2imageView,
                  tappedImageView != manga3imageView,
                  tappedImageView != manga4imageView else {
                return
            }
            
            // tappedImageViewを現在動かしているUIImageViewとして記憶する
            addImageView = tappedImageView
            
            
            
        }
    }
    
    func modoru(){
        if imageIndex == 8 {
            
            guard let addImageView = view.subviews.last(where: { $0 is UIImageView && $0 != haikeiimageView && $0 != manga1imageView && $0 != manga2imageView && $0 != manga3imageView && $0 != manga4imageView && $0 != mangahaikeiimageView }) as? UIImageView else {
                return
            }
            addImageView.removeFromSuperview()
        }
        
    }
    
    
    
    
    func roadphoto(){
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        imagePickerController.allowsEditing = true
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.originalImage] as? UIImage
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.5) {
            self.dismiss(animated: true, completion: {
                if self.tapindex == 1 {
                    self.manga1imageView.image = image
                    self.manga1imageView.contentMode = .scaleAspectFill
                    self.manga1imageView.clipsToBounds = true
                } else if self.tapindex == 2 {
                    self.manga2imageView.image = image
                    self.manga2imageView.contentMode = .scaleAspectFill
                    self.manga2imageView.clipsToBounds = true
                } else if self.tapindex == 3 {
                    self.manga3imageView.image = image
                    self.manga3imageView.contentMode = .scaleAspectFill
                    self.manga3imageView.clipsToBounds = true
                } else if self.tapindex == 4 {
                    self.manga4imageView.image = image
                    self.manga4imageView.contentMode = .scaleAspectFill
                    self.manga4imageView.clipsToBounds = true
                }
            })
        }
    }
    
    
    
    
    
    @IBAction func tapaction1(){
        if phototap == 0{
            
            roadphoto()
            tapindex = 1
            
        }else{
            
        }
    }
    @IBAction func tapaction2(){
        if phototap == 0{
            roadphoto()
            tapindex = 2
            
        }else{
            
        }
    }
    
    
    @IBAction func tapaction3(){
        if phototap == 0{
            roadphoto()
            tapindex = 3
            
        }else{
            
        }
    }
    
    @IBAction func tapaction4(){
        if phototap == 0{
            roadphoto()
            tapindex = 4
            
        }else{
            
        }
    }
    
    
    
    
    @IBAction func save() {
        let rect = CGRect(x: 0, y: 79, width: 390, height: 530)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, UIScreen.main.scale)
        self.view.layer.render(in: UIGraphicsGetCurrentContext()!)
        let capture = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        UIImageWriteToSavedPhotosAlbum(capture!, nil, nil, nil)
        
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
    
    func savedataload(){
        
        if stampindex1 == 1{
            guard let myButton = self.view?.viewWithTag(1) as? UIButton else { return }
            myButton.setImage(UIImage(named: "kozame1"), for: .normal)
            saveData.set(stampindex1, forKey: "stampindex1")
        }
        if stampindex2 == 1{
            guard let myButton = self.view?.viewWithTag(2) as? UIButton else { return }
            myButton.setImage(UIImage(named: "kozame2"), for: .normal)
            saveData.set(stampindex2, forKey: "stampindex2")
        }
        if stampindex3 == 1{
            guard let myButton = self.view?.viewWithTag(3) as? UIButton else { return }
            myButton.setImage(UIImage(named: "kozame3"), for: .normal)
            saveData.set(stampindex3, forKey: "stampindex3")
        }
        if stampindex4 == 1{
            guard let myButton = self.view?.viewWithTag(4) as? UIButton else { return }
            myButton.setImage(UIImage(named: "kozame4"), for: .normal)
            saveData.set(stampindex4, forKey: "stampindex4")
        }
        if stampindex5 == 1{
            guard let myButton = self.view?.viewWithTag(5) as? UIButton else { return }
            myButton.setImage(UIImage(named: "bikkuri"), for: .normal)
            saveData.set(stampindex5, forKey: "stampindex5")
        }
        if stampindex6 == 1{
            guard let myButton = self.view?.viewWithTag(6) as? UIButton else { return }
            myButton.setImage(UIImage(named: "manngastamp"), for: .normal)
            saveData.set(stampindex6, forKey: "stampindex6")
        }
        
    }
    
    
    override func touchesMoved(_ touches: Set<UITouch>,with event: UIEvent?){
        if imageIndex == 7{
            
            guard let touch = touches.first,
                  let moveImageView = touch.view as? UIImageView,
                  moveImageView != haikeiimageView,
                  moveImageView != manga1imageView,
                  moveImageView != manga2imageView,
                  moveImageView != manga3imageView,
                  moveImageView != manga4imageView else {
                return
            }
            
            let destLocation = touch.location(in: view)
            let prevLocation = touch.previousLocation(in: view)
            
            let deltaX = destLocation.x - prevLocation.x
            let deltaY = destLocation.y - prevLocation.y
            
            moveImageView.frame.origin.x += deltaX
            moveImageView.frame.origin.y += deltaY
        }
        
    }
    //
    
    
    
    @IBAction func idou(){
        imageIndex = 7
    }
    
    @IBAction func delete(){
        imageIndex = 8
        modoru()
    }
    
    
    
    
    
    //メイン
}
