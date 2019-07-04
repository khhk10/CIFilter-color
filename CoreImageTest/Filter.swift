import UIKit

extension ViewController {
    // 明度/コントラスト/彩度
    func colorControls(_ input: CIImage, intensity: Double, type: ColorControl) -> CIImage? {
        let filter = CIFilter(name: "CIColorControls")
        filter?.setValue(input, forKey: kCIInputImageKey)
        
        switch type {
        case .brightness:
            filter?.setValue(intensity, forKey: kCIInputBrightnessKey)
        case .contrast:
            filter?.setValue(intensity, forKey: kCIInputContrastKey)
        default:
            filter?.setValue(intensity, forKey: kCIInputSaturationKey)
        }
        return filter?.outputImage
    }
    
    enum ColorControl {
        case brightness
        case contrast
        case saturation
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
    
    // シャープ
    func sharpenFilter(_ input: CIImage, sharpness: Double) -> CIImage? {
        let sharpen = CIFilter(name: "CISharpenLuminance")
        sharpen?.setValue(input, forKey: kCIInputImageKey)
        sharpen?.setValue(sharpness, forKey: kCIInputSharpnessKey)
        
        return sharpen?.outputImage
    }
}
