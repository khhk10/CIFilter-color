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

___

__Example (CIColorClamp)__

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

__Result__

<img src="https://github.com/khhk10/CoreImage-intro/blob/master/images/coreimage-intro.png" width="250">

__Example (CIMaskToAlpha)__

```
let maskedImage = filter.maskToAlphaFilter(uiImage)
```

<img src="https://github.com/khhk10/CoreImage-intro/blob/master/images/maskToAlpha_before.png" width="250">
<img src="https://github.com/khhk10/CoreImage-intro/blob/master/images/maskToAlpha_after.png" width="250">


## reference

- [Core Image Filter Reference](https://developer.apple.com/library/archive/documentation/GraphicsImaging/Reference/CoreImageFilterReference/index.html#//apple_ref/doc/filter/ci/CIBloom)

## License

Test image: Photo by Bram. on Unsplash

