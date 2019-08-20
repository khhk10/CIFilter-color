
import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var beforeImage: UIImageView! // 処理前
    @IBOutlet weak var afterImage: UIImageView! // 処理後
    var origiImage: CIImage! // 元画像
    let filter = Filter() // フィルタクラス

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.lightGray
        // let url = URL(fileURLWithPath: "\(Bundle.main.bundlePath)/Assets.xcassets/photo1.jpg")
        guard let filePath = Bundle.main.path(forResource: "ramen", ofType: "jpeg") else {
            print("file path not found")
            return
        }
        let url = URL(fileURLWithPath: filePath)
        origiImage = CIImage(contentsOf: url)!
        self.beforeImage.image = UIImage(ciImage: origiImage) // 処理前の画像
        
        let bloom = filter.bloomFilter(origiImage, intensity: 1.9, radius: 5) // ブルーム加工
        self.afterImage.image = UIImage(ciImage: bloom!) // 処理後の画像
    }
    
    // スライダー
    @IBAction func changeSlider(_ sender: UISlider) {
        DispatchQueue.main.async {
            
            let bloom = self.filter.bloomFilter(self.origiImage, intensity: Double(sender.value)+0.5, radius: 5)
            self.afterImage.image = UIImage(ciImage: bloom!)
            
            // コントラスト
            // let contrastImage = self.colorControls(self.origiImage, intensity: Double(sender.value), type: .contrast)
            // self.afterImage.image = UIImage(ciImage: contrastImage!)
            
            // シャープ
            // let unsharpMask = self.sharpenFilter(self.origiImage, sharpness: Double(sender.value))
            // self.afterImage.image = UIImage(ciImage: unsharpMask!)
        }
    }
}

