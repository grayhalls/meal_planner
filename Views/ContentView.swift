import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            RecipesView()
                .tabItem {
                    Label("Recipes", systemImage: "book")
                }
            
            MealPlanView()
                .tabItem {
                    Label("Meal Plan", systemImage: "calendar")
                }
            
            ShoppingListView()
                .tabItem {
                    Label("Shopping List", systemImage: "cart")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}