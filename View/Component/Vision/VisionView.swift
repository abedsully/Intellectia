import SwiftUI
import AVFoundation

struct CameraCaptureView: UIViewControllerRepresentable {
    @Binding var emotionResult: EmotionClassifierOutput?
    
    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: CameraCaptureView
        
        init(parent: CameraCaptureView) {
            self.parent = parent
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let image = info[.originalImage] as? UIImage {

                if let pixelBuffer = image.pixelBuffer(width: 299, height: 299) {

                    let input = EmotionClassifierInput(image: pixelBuffer)
                    
                    do {
                        let output = try parent.emotionClassifier.prediction(input: input)
                        parent.emotionResult = output
                    } catch {
                        print("Error making prediction: \(error)")
                    }
                }
            }
            
            picker.dismiss(animated: true, completion: nil)
        }
        
        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    var emotionClassifier: EmotionClassifier
    var sourceType: UIImagePickerController.SourceType
    
    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = UIViewController()
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        picker.sourceType = sourceType
        viewController.present(picker, animated: true, completion: nil)
        return viewController
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(parent: self)
    }
}

struct VisionView: View {
    @State private var emotionResult: EmotionClassifierOutput?
    @State private var showImagePicker: Bool = false
    @State private var selectedImage: UIImage?
    
    var body: some View {
        VStack {
            if let selectedImage = selectedImage {
                Image(uiImage: selectedImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding()
                    .frame(width: 299, height: 299)
                
                if emotionResult != nil {
                    Text("Emotion: \(emotionResult!.classLabel)")
                }
            }
            
            Button("Select Image") {
                showImagePicker.toggle()
            }
            .sheet(isPresented: $showImagePicker, onDismiss: {
                if let selectedImage = selectedImage {
                    analyzeEmotion(image: selectedImage)
                }
            }) {
                ImagePicker(image: $selectedImage, sourceType: .photoLibrary)
            }
            .padding()
        }
    }
    
    
    
    func analyzeEmotion(image: UIImage) {
        emotionResult = nil
        
        if let pixelBuffer = image.pixelBuffer(width: 299, height: 299) {
            let input = EmotionClassifierInput(image: pixelBuffer)
            
            do {
                let output = try EmotionClassifier().prediction(input: input)
                emotionResult = output
            } catch {
                print("Error making prediction: \(error)")
            }
        }
    }
    
}


extension UIImage {
    func pixelBuffer(width: Int, height: Int) -> CVPixelBuffer? {
        var pixelBuffer: CVPixelBuffer?
        let options: [String: Any] = [
            kCVPixelBufferCGImageCompatibilityKey as String: true,
            kCVPixelBufferCGBitmapContextCompatibilityKey as String: true
        ]
        let status = CVPixelBufferCreate(kCFAllocatorDefault, width, height, kCVPixelFormatType_32BGRA, options as CFDictionary, &pixelBuffer)
        
        guard status == kCVReturnSuccess, let buffer = pixelBuffer else {
            return nil
        }
        
        CVPixelBufferLockBaseAddress(buffer, CVPixelBufferLockFlags(rawValue: 0))
        let context = CGContext(data: CVPixelBufferGetBaseAddress(buffer),
                                width: width,
                                height: height,
                                bitsPerComponent: 8,
                                bytesPerRow: CVPixelBufferGetBytesPerRow(buffer),
                                space: CGColorSpaceCreateDeviceRGB(),
                                bitmapInfo: CGImageAlphaInfo.noneSkipFirst.rawValue)
        
        guard let cgImage = context?.makeImage() else {
            return nil
        }
        
        CVPixelBufferUnlockBaseAddress(buffer, CVPixelBufferLockFlags(rawValue: 0))
        context?.draw(cgImage, in: CGRect(x: 0, y: 0, width: width, height: height))
        
        return buffer
    }
}

