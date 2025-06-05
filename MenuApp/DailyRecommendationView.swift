import SwiftUI

struct DailyRecommendationView: View {
    let recipe: Recipe?

    init(recipes: [Recipe]) {
        self.recipe = DailyRecommendationView.dailyRecipe(from: recipes)
    }

    var body: some View {
        if let recipe = recipe {
            VStack(alignment: .leading) {
                Text("Today's Recommendation")
                    .font(.headline)
                NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                    HStack {
                        Image(recipe.image)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 120)
                            .cornerRadius(8)
                        Text(recipe.title)
                            .font(.title3)
                            .foregroundColor(.primary)
                    }
                }
            }
            .padding()
        }
    }

    private static func dailyRecipe(from recipes: [Recipe]) -> Recipe? {
        guard !recipes.isEmpty else { return nil }
        let calendar = Calendar.current
        let components = calendar.dateComponents([.year, .month, .day], from: Date())
        let seed = components.year! * 10000 + components.month! * 100 + components.day!
        let index = seed % recipes.count
        return recipes[index]
    }
}
