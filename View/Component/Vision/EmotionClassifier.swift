import CoreML


/// Model Prediction Input Type
@available(macOS 10.14, iOS 12.0, tvOS 12.0, *)
@available(watchOS, unavailable)
class EmotionClassifierInput : MLFeatureProvider {
    
    /// Input image to be classified as color (kCVPixelFormatType_32BGRA) image buffer, 299 pixels wide by 299 pixels high
    var image: CVPixelBuffer
    
    var featureNames: Set<String> {
        get {
            return ["image"]
        }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == "image") {
            return MLFeatureValue(pixelBuffer: image)
        }
        return nil
    }
    
    init(image: CVPixelBuffer) {
        self.image = image
    }
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    convenience init(imageWith image: CGImage) throws {
        self.init(image: try MLFeatureValue(cgImage: image, pixelsWide: 299, pixelsHigh: 299, pixelFormatType: kCVPixelFormatType_32BGRA, options: nil).imageBufferValue!)
    }
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    convenience init(imageAt image: URL) throws {
        self.init(image: try MLFeatureValue(imageAt: image, pixelsWide: 299, pixelsHigh: 299, pixelFormatType: kCVPixelFormatType_32BGRA, options: nil).imageBufferValue!)
    }
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func setImage(with image: CGImage) throws  {
        self.image = try MLFeatureValue(cgImage: image, pixelsWide: 299, pixelsHigh: 299, pixelFormatType: kCVPixelFormatType_32BGRA, options: nil).imageBufferValue!
    }
    
    @available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 6.0, *)
    func setImage(with image: URL) throws  {
        self.image = try MLFeatureValue(imageAt: image, pixelsWide: 299, pixelsHigh: 299, pixelFormatType: kCVPixelFormatType_32BGRA, options: nil).imageBufferValue!
    }
    
}


/// Model Prediction Output Type
@available(macOS 10.14, iOS 12.0, tvOS 12.0, *)
@available(watchOS, unavailable)
class EmotionClassifierOutput : MLFeatureProvider {
    
    /// Source provided by CoreML
    private let provider : MLFeatureProvider
    
    /// Probability of each category as dictionary of strings to doubles
    var classLabelProbs: [String : Double] {
        return self.provider.featureValue(for: "classLabelProbs")!.dictionaryValue as! [String : Double]
    }
    
    /// Most likely image category as string value
    var classLabel: String {
        return self.provider.featureValue(for: "classLabel")!.stringValue
    }
    
    var featureNames: Set<String> {
        return self.provider.featureNames
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        return self.provider.featureValue(for: featureName)
    }
    
    init(classLabelProbs: [String : Double], classLabel: String) {
        self.provider = try! MLDictionaryFeatureProvider(dictionary: ["classLabelProbs" : MLFeatureValue(dictionary: classLabelProbs as [AnyHashable : NSNumber]), "classLabel" : MLFeatureValue(string: classLabel)])
    }
    
    init(features: MLFeatureProvider) {
        self.provider = features
    }
}


/// Class for model loading and prediction
@available(macOS 10.14, iOS 12.0, tvOS 12.0, *)
@available(watchOS, unavailable)
class EmotionClassifier {
    let model: MLModel
    
    /// URL of model assuming it was installed in the same bundle as this class
    class var urlOfModelInThisBundle : URL {
        let resPath = Bundle(for: self).url(forResource: "EmotionClassifier", withExtension: "mlmodel")!
        return try! MLModel.compileModel(at: resPath)
    }
    
    /**
     Construct EmotionClassifier instance with an existing MLModel object.
     
     Usually the application does not use this initializer unless it makes a subclass of EmotionClassifier.
     Such application may want to use `MLModel(contentsOfURL:configuration:)` and `EmotionClassifier.urlOfModelInThisBundle` to create a MLModel object to pass-in.
     
     - parameters:
     - model: MLModel object
     */
    init(model: MLModel) {
        self.model = model
    }
    
    /**
     Construct EmotionClassifier instance by automatically loading the model from the app's bundle.
     */
    convenience init() {
        try! self.init(contentsOf: type(of:self).urlOfModelInThisBundle)
    }
    
    /**
     Construct a model with configuration
     
     - parameters:
     - configuration: the desired model configuration
     
     - throws: an NSError object that describes the problem
     */
    convenience init(configuration: MLModelConfiguration) throws {
        try self.init(contentsOf: type(of:self).urlOfModelInThisBundle, configuration: configuration)
    }
    
    /**
     Construct EmotionClassifier instance with explicit path to mlmodelc file
     - parameters:
     - modelURL: the file url of the model
     
     - throws: an NSError object that describes the problem
     */
    convenience init(contentsOf modelURL: URL) throws {
        try self.init(model: MLModel(contentsOf: modelURL))
    }
    
    /**
     Construct a model with URL of the .mlmodelc directory and configuration
     
     - parameters:
     - modelURL: the file url of the model
     - configuration: the desired model configuration
     
     - throws: an NSError object that describes the problem
     */
    convenience init(contentsOf modelURL: URL, configuration: MLModelConfiguration) throws {
        try self.init(model: MLModel(contentsOf: modelURL, configuration: configuration))
    }
    
    /**
     Construct EmotionClassifier instance asynchronously with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - configuration: the desired model configuration
     - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
     */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<EmotionClassifier, Error>) -> Void) {
        return self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration, completionHandler: handler)
    }
    
    /**
     Construct EmotionClassifier instance asynchronously with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - configuration: the desired model configuration
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> EmotionClassifier {
        return try await self.load(contentsOf: self.urlOfModelInThisBundle, configuration: configuration)
    }
    
    /**
     Construct EmotionClassifier instance asynchronously with URL of the .mlmodelc directory with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - modelURL: the URL to the model
     - configuration: the desired model configuration
     - handler: the completion handler to be called when the model loading completes successfully or unsuccessfully
     */
    @available(macOS 11.0, iOS 14.0, tvOS 14.0, watchOS 7.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration(), completionHandler handler: @escaping (Swift.Result<EmotionClassifier, Error>) -> Void) {
        MLModel.load(contentsOf: modelURL, configuration: configuration) { result in
            switch result {
            case .failure(let error):
                handler(.failure(error))
            case .success(let model):
                handler(.success(EmotionClassifier(model: model)))
            }
        }
    }
    
    /**
     Construct EmotionClassifier instance asynchronously with URL of the .mlmodelc directory with optional configuration.
     
     Model loading may take time when the model content is not immediately available (e.g. encrypted model). Use this factory method especially when the caller is on the main thread.
     
     - parameters:
     - modelURL: the URL to the model
     - configuration: the desired model configuration
     */
    @available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
    class func load(contentsOf modelURL: URL, configuration: MLModelConfiguration = MLModelConfiguration()) async throws -> EmotionClassifier {
        let model = try await MLModel.load(contentsOf: modelURL, configuration: configuration)
        return EmotionClassifier(model: model)
    }
    
    /**
     Make a prediction using the structured interface
     
     - parameters:
     - input: the input to the prediction as EmotionClassifierInput
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as EmotionClassifierOutput
     */
    func prediction(input: EmotionClassifierInput) throws -> EmotionClassifierOutput {
        return try self.prediction(input: input, options: MLPredictionOptions())
    }
    
    /**
     Make a prediction using the structured interface
     
     - parameters:
     - input: the input to the prediction as EmotionClassifierInput
     - options: prediction options 
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as EmotionClassifierOutput
     */
    func prediction(input: EmotionClassifierInput, options: MLPredictionOptions) throws -> EmotionClassifierOutput {
        let outFeatures = try model.prediction(from: input, options:options)
        return EmotionClassifierOutput(features: outFeatures)
    }
    
    /**
     Make an asynchronous prediction using the structured interface
     
     - parameters:
     - input: the input to the prediction as EmotionClassifierInput
     - options: prediction options 
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as EmotionClassifierOutput
     */
    @available(macOS 14.0, iOS 17.0, tvOS 17.0, watchOS 10.0, *)
    func prediction(input: EmotionClassifierInput, options: MLPredictionOptions = MLPredictionOptions()) async throws -> EmotionClassifierOutput {
        let outFeatures = try await model.prediction(from: input, options:options)
        return EmotionClassifierOutput(features: outFeatures)
    }
    
    /**
     Make a prediction using the convenience interface
     
     - parameters:
     - image: Input image to be classified as color (kCVPixelFormatType_32BGRA) image buffer, 299 pixels wide by 299 pixels high
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as EmotionClassifierOutput
     */
    func prediction(image: CVPixelBuffer) throws -> EmotionClassifierOutput {
        let input_ = EmotionClassifierInput(image: image)
        return try self.prediction(input: input_)
    }
    
    /**
     Make a batch prediction using the structured interface
     
     - parameters:
     - inputs: the inputs to the prediction as [EmotionClassifierInput]
     - options: prediction options 
     
     - throws: an NSError object that describes the problem
     
     - returns: the result of the prediction as [EmotionClassifierOutput]
     */
    func predictions(inputs: [EmotionClassifierInput], options: MLPredictionOptions = MLPredictionOptions()) throws -> [EmotionClassifierOutput] {
        let batchIn = MLArrayBatchProvider(array: inputs)
        let batchOut = try model.predictions(from: batchIn, options: options)
        var results : [EmotionClassifierOutput] = []
        results.reserveCapacity(inputs.count)
        for i in 0..<batchOut.count {
            let outProvider = batchOut.features(at: i)
            let result =  EmotionClassifierOutput(features: outProvider)
            results.append(result)
        }
        return results
    }
}
