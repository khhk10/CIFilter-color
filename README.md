# CoreImage-intro
Introduction to image processing with Core Image

### CIFilter
CICategoryColorAdjustment
- CIColorControls (brightness / contrast / saturation)
- CIColorClamp

CICategoryColorEffect
- CISepiaTone
- CIColorPosterize
- CIColorInvert
- CIMasktoAlpha

CICategorySharpen
- CISharpenLuminance
- CIUnsharpMask

## 1. Implement the sequence of steps

### Example (CIColorClamp)

_Filter.swift_
```
class Filter {
    func clampFilter(_ input: CIImage, inputMin: CIVector, inputMax: CIVector) -> CIImage? {
        let clampFilter = CIFilter(name: "CIColorClamp")
        clampFilter?.setValue(input, forKey: kCIInputImageKey)
        clampFilter?.setValue(inputMin, forKey: "inputMinComponents")
        clampFilter?.setValue(inputMax, forKey: "inputMaxComponents")
        return clampFilter?.outputImage
    }
```
_ViewController.swift_
```
let filter = Filter()
let min = CIVector(x: 0, y: 0, z: 0, w: 0)
let max = CIVector(x: 1.0, y: 1.0, z: 0.3, w: 0.8)
let clampImage = filter.clampFilter(uiImage, inputMin: min, inputMax: max)
self.imageView.image = UIImage(ciImage: clampImage!)
```

Result

<img src="https://github.com/khhk10/CoreImage-intro/blob/master/images/clamp_before.png" height="170"> <img src="https://github.com/khhk10/CoreImage-intro/blob/master/images/clamp_after.png" height="170">

### Example (CIMaskToAlpha)

_Filter.swift_
```
func maskToAlphaFilter(_ input: CIImage) -> CIImage? {
    let mask = CIFilter(name: "CIMaskToAlpha")
    mask?.setValue(input, forKey: kCIInputImageKey)
    return mask?.outputImage
}
```

_ViewController.swift_
```
let maskedImage = filter.maskToAlphaFilter(uiImage)
self.imageView.image = UIImage(ciImage: maskToAlpha!)
```

Result

<img src="https://github.com/khhk10/CoreImage-intro/blob/master/images/maskToAlpha_before.png" height="170"> <img src="https://github.com/khhk10/CoreImage-intro/blob/master/images/maskToAlpha_after.png" height="170">

## 2. Call CIImage instance method

[applyingFilter(\_:parameters:)](https://developer.apple.com/documentation/coreimage/ciimage/1437589-applyingfilter)

### CIColorClamp

```
let min = CIVector(x: 0, y: 0, z: 0, w: 0)
let max = CIVector(x: 1.0, y: 1.0, z: 0.3, w: 0.8)
let clampImage = origiImage.applyingFilter("CIColorClamp", parameters: ["inputMinComponents": min, "inputMaxComponents": max])
```

### CIMaskToAlpha

```
let maskToAlpha = origiImage.applyingFilter("CIMaskToAlpha")
```

## reference

- [Core Image Filter Reference](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBloom)
- [applyingFilter(\_:parameters:)](https://developer.apple.com/documentation/coreimage/ciimage/1437589-applyingfilter)

## License

Test image: Photo by Bram. on Unsplash

