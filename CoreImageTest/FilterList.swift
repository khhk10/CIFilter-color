import UIKit

extension ViewController {
    
    // フィルタのテスト
    func testFilters() -> CIImage? {
        // セピアフィルタ
        let sepiaImage = filter.sepiaFilter(origiImage, intensity: 0.9)
        
        // クランプフィルタ 1
        // let clampImage = filter.clampFilter(origiImage, inputMin: CIVector(x: 0, y: 0, z: 0, w: 0), inputMax: CIVector(x: 1.0, y: 1.0, z: 0.3, w: 0.8))
        
        // クランプフィルタ 2
        // let min = CIVector(x: 0, y: 0, z: 0, w: 0)
        // let max = CIVector(x: 1.0, y: 1.0, z: 0.3, w: 0.8)
        // let clampImage = origiImage.applyingFilter("CIColorClamp", parameters: ["inputMinComponents": min, "inputMaxComponents": max])
        
        // シャープ
        // let sharpImage = filter.sharpenFilter(origiImage, sharpness: 0.5)
        // let unsharpMaskImage = unsharpMaskFilter(origiImage, radius: 2.5, intensity: 0.5)
        
        // ポスタライズ
        // let posterize = filter.posterizeFilter(origiImage, inputLevels: 6.0)
        
        // ネガポジ反転
        // let invertImage = filter.invertFilter(origiImage)
        
        // マスクされた白だけの画像
        // let maskToAlpha = filter.maskToAlphaFilter(origiImage)
        // let maskToAlpha = origiImage.applyingFilter("CIMaskToAlpha", parameters: [:])
        
        // グレースケール画像（最小値と最大値）
        // let minGray = filter.minimumComponent(origiImage)
        // let maxGray = filter.maximumComponent(origiImage)
        
        // グレースケール画像（白黒写真のような表現）
        // let mono = filter.photoEffectMono(origiImage)
        // let noir = filter.photoEffectNoir(origiImage)
        
        // 切り抜き
        /*
         let newWidth = clampImage.extent.width - 200
         let newHeight = clampImage.extent.height - 200
         let newRect = CGRect(x: 100, y: 100, width: newWidth, height: newHeight)
         let croppedImage = clampImage.cropped(to: newRect)
         let final = context.createCGImage(croppedImage, from: croppedImage.extent)
         */
        
        return sepiaImage
    }
}
