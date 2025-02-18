import Foundation

struct Recipe: Identifiable, Codable {
    var id: UUID = UUID()
    var title: String
    var description: String
    var ingredients: [Ingredient]
    var instructions: [String]
    var prepTime: Int // in minutes
    var cookTime: Int // in minutes
    var servings: Int
    var tags: [String]
    var cuisine: String
    var imageURL: String?
    var isUserCreated: Bool = false
    
    struct Ingredient: Identifiable, Codable {
        var id: UUID = UUID()
        var name: String
        var amount: Double
        var unit: String
    }
}