import Foundation

struct Product : Decodable {
    var id: Int
    var name: String
    var description: String
    var price: Double
    var image: String = ""
    
    var imageURL: URL {
            URL(string: "https://firtman.github.io/coffeemasters/api/images/\(self.image)")!
        }
}
