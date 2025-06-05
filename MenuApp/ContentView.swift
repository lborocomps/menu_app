import SwiftUI

struct ContentView: View {
    @State private var recipes: [Recipe] = RecipeData.loadRecipes()
    @State private var selectedCategory: String = "All"
    @State private var searchText: String = ""

    private var filteredRecipes: [Recipe] {
        recipes.filter { recipe in
            (selectedCategory == "All" || recipe.categories.contains(selectedCategory)) &&
            (searchText.isEmpty || recipe.ingredients.joined(separator: " ").localizedCaseInsensitiveContains(searchText))
        }
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                DailyRecommendationView(recipes: recipes)
                categoryPicker
                searchField
                List(filteredRecipes) { recipe in
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        HStack {
                            Image(recipe.image)
                                .resizable()
                                .frame(width: 60, height: 60)
                                .cornerRadius(8)
                            Text(recipe.title)
                        }
                    }
                }
                .listStyle(.plain)
            }
            .navigationTitle("Recipes")
        }
    }

    private var categoryPicker: some View {
        Picker("Category", selection: $selectedCategory) {
            Text("All").tag("All")
            Text("Seafood").tag("Seafood")
            Text("Vegan").tag("Vegan")
            Text("Light").tag("Light")
        }
        .pickerStyle(.segmented)
        .padding([.horizontal, .bottom])
    }

    private var searchField: some View {
        TextField("Search by ingredient", text: $searchText)
            .textFieldStyle(RoundedBorderTextFieldStyle())
            .padding([.horizontal, .bottom])
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
