
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var beforeImage: UIImageView!
    @IBOutlet weak var afterImage: UIImageView!
    var origiImage: CIImage!
    
    let filter = Filter()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        
        let context = CIContext()
        
        // let url = URL(fileURLWithPath: "\(Bundle.main.bundlePath)/Assets.xcassets/photo1.jpg")
        
        // 処理前の画像
        guard let filePath = Bundle.main.path(forResource: "photo1", ofType: "jpg") else {
            // ファイルが存在しなかった
            return
        }
        let url = URL(fileURLWithPath: filePath)
        origiImage = CIImage(contentsOf: url)!
        self.beforeImage.image = UIImage(ciImage: origiImage)
        
        // セピアフィルタ
        // let sepiaImage = filter.sepiaFilter(origiImage, intensity: 0.9)
        
        // クランプフィルタ
        // let clampImage = filter.clampFilter(origiImage, inputMin: CIVector(x: 0, y: 0, z: 0, w: 0), inputMax: CIVector(x: 1.0, y: 1.0, z: 0.3, w: 0.8))
        
        // シャープ
        // let sharpImage = filter.sharpenFilter(origiImage, sharpness: 0.5)
        // let unsharpMaskImage = unsharpMaskFilter(origiImage, radius: 2.5, intensity: 0.5)
        
        // ポスタライズ
        // let posterize = filter.posterizeFilter(origiImage, inputLevels: 6.0)
        
        // ネガポジ反転
        // let invertImage = filter.invertFilter(origiImage)
        
        // マスクされた白だけの画像
        // let maskToAlpha = filter.maskToAlphaFilter(origiImage)
        
        // グレースケール画像（最小値と最大値）
        // let minGray = filter.minimumComponent(origiImage)
        // let maxGray = filter.maximumComponent(origiImage)
        
        // グレースケール画像（白黒写真のような表現）
        // let mono = filter.photoEffectMono(origiImage)
        let noir = filter.photoEffectNoir(origiImage)
        // let noir = origiImage.applyingFilter("CIPhotoEffectNoir", parameters: [:])
        
        // 処理後の画像
        // self.beforeImage.image = UIImage(ciImage: noir!)
        self.afterImage.image = UIImage(ciImage: noir!)
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
            // let unsharpMask = self.sharpenFilter(self.origiImage, sharpness: Double(sender.value))
            // self.afterImage.image = UIImage(ciImage: unsharpMask!)
        }
    }
}

