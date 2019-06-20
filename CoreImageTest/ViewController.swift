
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var beforeImage: UIImageView!
    @IBOutlet weak var afterImage: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let context = CIContext()
        
        // let url = URL(fileURLWithPath: "\(Bundle.main.bundlePath)/Assets.xcassets/photo1.jpg")
        
        // オリジナル画像
        guard let filePath = Bundle.main.path(forResource: "photo4", ofType: "jpg") else {
            // ファイルが存在しなかった
            return
        }
        let url = URL(fileURLWithPath: filePath)
        let origiImage = CIImage(contentsOf: url)!
        // self.beforeImage.contentMode = .scaleAspectFill
        // self.beforeImage.clipsToBounds = true
        self.beforeImage.image = UIImage(ciImage: origiImage)
        
        // セピアフィルタ
        // let sepiaImage = sepiaFilter(origiImage, intensity: 0.9)
        
        // クランプフィルタ
        let clampImage = clampFilter(origiImage, inputMin: CIVector(x: 0, y: 0, z: 0, w: 0), inputMax: CIVector(x: 1.0, y: 1.0, z: 0.3, w: 0.8))
        
        // 処理後の画像
        self.afterImage.image = UIImage(ciImage: clampImage!)
    }
    
    // セピアフィルタ
    func sepiaFilter(_ input: CIImage, intensity: Double) -> CIImage? {
        let sepiaFilter = CIFilter(name: "CISepiaTone")
        sepiaFilter?.setValue(input, forKey: kCIInputImageKey)
        sepiaFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
        
        return sepiaFilter?.outputImage
    }
    
    // クランプフィルタ
    func clampFilter(_ input: CIImage, inputMin: CIVector, inputMax: CIVector) -> CIImage? {
        let clampFilter = CIFilter(name: "CIColorClamp")
        clampFilter?.setValue(input, forKey: kCIInputImageKey)
        clampFilter?.setValue(inputMin, forKey: "inputMinComponents")
        clampFilter?.setValue(inputMax, forKey: "inputMaxComponents")
        
        return clampFilter?.outputImage
    }
}

