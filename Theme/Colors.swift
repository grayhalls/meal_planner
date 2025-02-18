import SwiftUI

struct AppColors {
    static let burntOrange = Color(hex: "CC5500", opacity: 0.9)
    static let softDarkTeal = Color(hex: "006D77", opacity: 0.9)
    static let backgroundGray = Color(hex: "FAFAFA")
    
    // Helper initializer for hex colors
    private static func hex(_ hex: String, opacity: Double = 1.0) -> Color {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)
        
        let r = Double((rgbValue & 0xFF0000) >> 16) / 255.0
        let g = Double((rgbValue & 0x00FF00) >> 8) / 255.0
        let b = Double(rgbValue & 0x0000FF) / 255.0
        
        return Color(.sRGB, red: r, green: g, blue: b, opacity: opacity)
    }
} 