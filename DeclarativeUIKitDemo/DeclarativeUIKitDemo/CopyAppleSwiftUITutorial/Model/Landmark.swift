import Foundation

struct Landmark: Codable {
  var id: Int
  var name: String
  var park: String
  var state: String
  var description: String
  var isFavorite: Bool
  
  var imageName: String
  
  var coordinates: Coordinates
  
  struct Coordinates: Hashable, Codable {
    var latitude: Double
    var longitude: Double
  }
}
