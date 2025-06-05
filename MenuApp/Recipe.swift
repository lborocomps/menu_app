import Foundation

struct Recipe: Identifiable, Codable {
    let id: Int
    let title: String
    let image: String
    let categories: [String]
    let ingredients: [String]
    let instructions: [String]
}

struct RecipeData {
    static func loadRecipes() -> [Recipe] {
        guard let url = Bundle.main.url(forResource: "recipes", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let recipes = try? JSONDecoder().decode([Recipe].self, from: data) else {
            return []
        }
        return recipes
    }
}
