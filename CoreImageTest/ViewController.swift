
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var beforeImage: UIImageView!
    @IBOutlet weak var afterImage: UIImageView!
    var origiImage: CIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = CIContext()
        
        // let url = URL(fileURLWithPath: "\(Bundle.main.bundlePath)/Assets.xcassets/photo1.jpg")
        
        // 処理前の画像
        guard let filePath = Bundle.main.path(forResource: "photo4", ofType: "jpg") else {
            // ファイルが存在しなかった
            return
        }
        let url = URL(fileURLWithPath: filePath)
        origiImage = CIImage(contentsOf: url)!
        self.beforeImage.image = UIImage(ciImage: origiImage)
        
        // セピアフィルタ
        // let sepiaImage = sepiaFilter(origiImage, intensity: 0.9)
        
        // クランプフィルタ
        // let clampImage = clampFilter(origiImage, inputMin: CIVector(x: 0, y: 0, z: 0, w: 0), inputMax: CIVector(x: 1.0, y: 1.0, z: 0.3, w: 0.8))
        
        // シャープ
        // let sharpImage = sharpenFilter(origiImage, sharpness: 0.5)
        let unsharpMaskImage = unsharpMaskFilter(origiImage, radius: 2.5, intensity: 0.5)
        
        // 処理後の画像
        self.afterImage.image = UIImage(ciImage: unsharpMaskImage!)
    }
    
    // スライダー
    @IBAction func changeSlider(_ sender: UISlider) {
        DispatchQueue.main.async {
            /*
            // コントラスト
            let contrastImage = self.colorControls(self.origiImage, intensity: Double(sender.value), type: .contrast)
            self.beforeImage.image = UIImage(ciImage: contrastImage!)
            */
            
            // シャープ
            let unsharpMask = self.sharpenFilter(self.origiImage, sharpness: Double(sender.value))
            self.afterImage.image = UIImage(ciImage: unsharpMask!)
        }
    }
}

