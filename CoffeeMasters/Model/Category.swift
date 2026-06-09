import Foundation

nonisolated struct Category: Decodable, Identifiable {
    var id: String{
        return self.name
    }
    var name: String
    var products: [Product] = []
}

