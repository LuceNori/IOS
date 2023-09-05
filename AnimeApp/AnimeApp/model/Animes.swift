struct Anime:Decodable{
    var id: Int
    var ranking: Int
    var title: String
    var genres: String
    var image: String
    var episodes: Int
    var synopsis: String
}

struct Response: Decodable{
    var idResponse: [Anime]
}


