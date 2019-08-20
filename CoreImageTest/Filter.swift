import UIKit

class Filter {
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
    
    // bloomフィルタ
    func bloomFilter(_ input: CIImage, intensity: Double, radius: Double) -> CIImage? {
        let bloomFilter = CIFilter(name: "CIBloom")
        bloomFilter?.setValue(input, forKey: kCIInputImageKey)
        bloomFilter?.setValue(intensity, forKey: kCIInputIntensityKey)
        bloomFilter?.setValue(radius, forKey: kCIInputRadiusKey)
        
        return bloomFilter?.outputImage
    }
    
    // クランプフィルタ
    func clampFilter(_ input: CIImage, inputMin: CIVector, inputMax: CIVector) -> CIImage? {
        let clampFilter = CIFilter(name: "CIColorClamp")
        clampFilter?.setValue(input, forKey: kCIInputImageKey)
        clampFilter?.setValue(inputMin, forKey: "inputMinComponents")
        clampFilter?.setValue(inputMax, forKey: "inputMaxComponents")
        
        return clampFilter?.outputImage
    }
    
    // ポスタリゼーション
    func posterizeFilter(_ input: CIImage, inputLevels: Double) -> CIImage? {
        let posterize = CIFilter(name: "CIColorPosterize")
        posterize?.setValue(input, forKey: kCIInputImageKey)
        posterize?.setValue(inputLevels, forKey: "inputLevels")
        
        return posterize?.outputImage
    }
    
    // シャープ
    func sharpenFilter(_ input: CIImage, sharpness: Double) -> CIImage? {
        let sharpen = CIFilter(name: "CISharpenLuminance")
        sharpen?.setValue(input, forKey: kCIInputImageKey)
        sharpen?.setValue(sharpness, forKey: kCIInputSharpnessKey)
        
        return sharpen?.outputImage
    }
    
    func unsharpMaskFilter(_ input: CIImage, radius: Double, intensity: Double) -> CIImage? {
        let unsharpMask = CIFilter(name: "CIUnsharpMask")
        unsharpMask?.setValue(input, forKey: kCIInputImageKey)
        unsharpMask?.setValue(radius, forKey: kCIInputRadiusKey)
        unsharpMask?.setValue(intensity, forKey: kCIInputIntensityKey)

        return unsharpMask?.outputImage
    }
    
    // ネガポジ反転
    func invertFilter(_ input: CIImage) -> CIImage? {
        let invert = CIFilter(name: "CIColorInvert")
        invert?.setValue(input, forKey: kCIInputImageKey)
        
        return invert?.outputImage
    }
    
    // アルファでマスクされた白だけの画像
    func maskToAlphaFilter(_ input: CIImage) -> CIImage? {
        let mask = CIFilter(name: "CIMaskToAlpha")
        mask?.setValue(input, forKey: kCIInputImageKey)
        
        return mask?.outputImage
    }
    
    func minimumComponent(_ input: CIImage) -> CIImage? {
        let minimum = CIFilter(name: "CIMinimumComponent")
        minimum?.setValue(input, forKey: kCIInputImageKey)
        
        return minimum?.outputImage
    }
    
    func maximumComponent(_ input: CIImage) -> CIImage? {
        let maximum = CIFilter(name: "CIMaximumComponent")
        maximum?.setValue(input, forKey: kCIInputImageKey)
        
        return maximum?.outputImage
    }
    
    // グレースケール（低いコントラスト）
    func photoEffectMono(_ input: CIImage) -> CIImage? {
        let mono = CIFilter(name: "CIPhotoEffectMono")
        mono?.setValue(input, forKey: kCIInputImageKey)
        
        return mono?.outputImage
    }
    
    // グレースケール（誇張したコントラスト）
    func photoEffectNoir(_ input: CIImage) -> CIImage? {
        let noir = CIFilter(name: "CIPhotoEffectNoir")
        noir?.setValue(noir, forKey: kCIInputImageKey)
        
        return noir?.outputImage
    }
    
    // グレースケール（コントラストを大幅に変更しない）
    func photoEffectTonal(_ input: CIImage) -> CIImage? {
        let tonal = CIFilter(name: "CIPhotoEffectTonal")
        tonal?.setValue(tonal, forKey: kCIInputImageKey)
        
        return tonal?.outputImage
    }
}
