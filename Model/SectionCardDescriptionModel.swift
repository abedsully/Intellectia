import Foundation
import SwiftUI

struct SectionCard1Description {
    let imageName: String
    let title: String
    let color: Color
    
    static var defaultDescription: SectionCard1Description {
        return SectionCard1Description(imageName: "splash-bg", title: "Intellectia", color: Color.mainColor)
    }
}

struct SectionCard2Description {
    let title: String
    
    static var defaultDescription: SectionCard2Description {
        return SectionCard2Description(title: "Intellectia")
    }
}

struct SectionCard3Description {
    let description: String
    
    static var defaultDescription: SectionCard3Description {
        return SectionCard3Description(
            description: "description"
        )
    }
}

struct SectionCard4Description {
    let title: String
    
    static var defaultDescription: SectionCard4Description {
        return SectionCard4Description(
            title: "Intellectia"
        )
    }
}

struct SectionCard8Description {
    let title: String
    
    static var defaultDescription: SectionCard8Description {
        return SectionCard8Description(
            title: "Intellectia"
        )
    }
}

struct SectionCard10Description {
    let title: String
    
    static var defaultDescription: SectionCard10Description {
        return SectionCard10Description(
            title: "Intellectia"
        )
    }
}

import SwiftUI

struct SectionCardApplicationExample {
    let number: String
    let title: String
    let imageName: String
    let description: String
    
    
    static var defaultDescription: SectionCardApplicationExample {
        return SectionCardApplicationExample(
            number: "0", title: "Intellectia", imageName: "splash-bg", description: "Intellectia"
        )
    }
}

struct SectionCardDescription {
    let description: String
    
    static var defaultDescription: SectionCardDescription {
        return SectionCardDescription(
            description: "Intellectia"
        )
    }
}








