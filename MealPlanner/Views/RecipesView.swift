import SwiftUI

struct RecipesView: View {
    @StateObject private var viewModel = RecipesViewModel()
    @State private var showingAddRecipe = false
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(viewModel.recipes) { recipe in
                        NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                            RecipeRowView(recipe: recipe)
                                .padding(.horizontal)
                        }
                        .buttonStyle(PlainButtonStyle())
                    }
                }
                .padding(.vertical)
            }
            .background(AppColors.backgroundGray)
            .navigationTitle("Recipes")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddRecipe = true
                    } label: {
                        Image(systemName: "plus")
                            .foregroundColor(AppColors.softDarkTeal)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search recipes")
            .sheet(isPresented: $showingAddRecipe) {
                AddRecipeView()
            }
        }
    }
}

struct RecipeRowView: View {
    let recipe: Recipe
    
    var body: some View {
        HStack(spacing: 16) {
            recipeImage
            
            VStack(alignment: .leading, spacing: 4) {
                Text(recipe.title)
                    .font(.system(size: 18, weight: .medium, design: .rounded))
                    .foregroundColor(.primary)
                
                HStack {
                    Label("\(recipe.prepTime + recipe.cookTime)m", systemImage: "clock")
                    Text("•")
                    Text(recipe.cuisine)
                }
                .font(.system(size: 14, weight: .regular, design: .rounded))
                .foregroundColor(.secondary)
                
                TagsView(tags: Array(recipe.tags.prefix(2)))
            }
        }
        .padding(.vertical, 8)
        .background(Color.white)
    }
    
    private var recipeImage: some View {
        RoundedRectangle(cornerRadius: 12)
            .fill(AppColors.softDarkTeal.opacity(0.1))
            .frame(width: 80, height: 80)
            .overlay(
                Image(systemName: "fork.knife")
                    .foregroundColor(AppColors.softDarkTeal)
            )
    }
}

struct TagsView: View {
    let tags: [String]
    
    var body: some View {
        HStack {
            ForEach(tags, id: \.self) { tag in
                Text(tag)
                    .font(.system(size: 12, weight: .medium, design: .rounded))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(AppColors.burntOrange.opacity(0.1))
                    .foregroundColor(AppColors.burntOrange)
                    .cornerRadius(8)
            }
        }
    }
} 