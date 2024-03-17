import SwiftUI
import CoreText
import Foundation

extension View {
    
    func splashFont() -> Font {
        guard let cfURL = Bundle.main.url(forResource: "Poppins-Bold", withExtension: "ttf") as CFURL? else {
            return .system(size: 30.0)
        }
        
        if CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil) {
            let uiFont = UIFont(name: "Poppins-Bold", size: 40)
            return Font(uiFont ?? UIFont())
        } else {
            return .system(size: 30.0)
        }
    }
    
    
    func descriptionFont() -> Font {
        guard let cfURL = Bundle.main.url(forResource: "Poppins-Regular", withExtension: "ttf") as CFURL? else {
            return .system(size: 30.0)
        }
        
        if CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil) {
            let uiFont = UIFont(name: "Poppins-Regular", size: 30)
            return Font(uiFont ?? UIFont())
        } else {
            return .system(size: 30.0)
        }
    }
    
    func locationFont() -> Font {
        guard let cfURL = Bundle.main.url(forResource: "Poppins-Light", withExtension: "ttf") as CFURL? else {
            return .system(size: 30.0)
        }
        
        if CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil) {
            let uiFont = UIFont(name: "Poppins-Light", size: 20)
            return Font(uiFont ?? UIFont())
        } else {
            return .system(size: 30.0)
        }
    }
    
    func sectionFont() -> Font {
        guard let cfURL = Bundle.main.url(forResource: "Poppins-Italic", withExtension: "ttf") as CFURL? else {
            return .system(size: 20.0)
        }
        
        if CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil) {
            let uiFont = UIFont(name: "Poppins-Italic", size: 18)
            return Font(uiFont ?? UIFont()) // Use system font if uiFont is nil
        } else {
            return .system(size: 20.0)
        }
    }
    
    
}
