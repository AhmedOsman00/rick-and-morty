import SwiftUI
import DesignSystem
import UIExtensions

struct CharacterCell: View {
  let name: String
  let specie: String
  let imageUrl: URL
  let backgroundColor: Color
  let isBordered: Bool

  var body: some View {
    HStack(alignment: .top) {
      AsyncImage(url: imageUrl) { image in
        image
          .resizable()
          .clipShape(.rect(cornerRadius: 20))
      } placeholder: {
        ProgressView()
      }
      .frame(width: 100, height: 100)

      VStack(alignment: .leading, spacing: 5) {
        Text(name)
          .bold()
          .font(.title2)
          .foregroundStyle(.primary)
        Text(specie)
          .font(.title3)
          .foregroundStyle(.secondary)
      }
      Spacer()
    }
    .padding()
    .inRect(isBordered: isBordered, fillColor: backgroundColor)
  }
}

#Preview {
  CharacterCell(name: "Rick Sanche",
                specie: "Human",
                imageUrl: URL(string: "https://rickandmortyapi.com/api/character/avatar/1.jpeg")!,
                backgroundColor: .frostedSky,
                isBordered: false)
}
