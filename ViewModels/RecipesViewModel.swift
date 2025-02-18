import Foundation

class RecipesViewModel: ObservableObject {
    @Published var recipes: [Recipe] = []
    
    init() {
        loadRecipes()
    }
    
    private func loadRecipes() {
        // TODO: Load from database
        // For now, let's add some sample data
        recipes = [
            Recipe(
                title: "Spaghetti Carbonara",
                description: "Classic Italian pasta dish",
                ingredients: [
                    Recipe.Ingredient(name: "Spaghetti", amount: 400, unit: "g"),
                    Recipe.Ingredient(name: "Eggs", amount: 4, unit: "whole"),
                    Recipe.Ingredient(name: "Pecorino Romano", amount: 100, unit: "g")
                ],
                instructions: [
                    "Boil pasta in salted water",
                    "Mix eggs and cheese",
                    "Combine with hot pasta"
                ],
                prepTime: 10,
                cookTime: 20,
                servings: 4,
                tags: ["pasta", "italian"],
                cuisine: "Italian"
            )
        ]
    }
    
    func addRecipe(_ recipe: Recipe) {
        recipes.append(recipe)
        // TODO: Save to database
    }
}