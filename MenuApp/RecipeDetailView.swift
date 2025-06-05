import SwiftUI

struct RecipeDetailView: View {
    let recipe: Recipe

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(recipe.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(8)
                Text(recipe.title)
                    .font(.title)
                    .bold()
                Text("Ingredients")
                    .font(.headline)
                ForEach(recipe.ingredients, id: \.self) { ingredient in
                    Text("- " + ingredient)
                }
                Text("Instructions")
                    .font(.headline)
                ForEach(recipe.instructions, id: \.self) { step in
                    Text(step)
                        .padding(.bottom, 4)
                }
            }
            .padding()
        }
        .navigationTitle(recipe.title)
    }
}
