import Foundation

enum Genre: String, CaseIterable {
    case action = "Action"
    case comedy = "Comedy"
    case drama = "Drama"
    case sciFi = "Sci-Fi"
}

struct Movie {
    let title: String
    let genre: Genre
    var rating: Double
}

class User {
    let name: String
    private(set) var favoriteMovies: [Movie] = []
    
    init(name: String) {
        self.name = name
    }
    
    func addFavorite(movie: Movie) {
        if !favoriteMovies.contains(where: { $0.title == movie.title }) {
            favoriteMovies.append(movie)
        }
    }
    
    func removeFavorite(title: String) {
        favoriteMovies.removeAll { $0.title == title }
    }
}

class MovieLibrary {
    private(set) var movies: [Movie] = []
    
    func addMovie(_ movie: Movie) {
        movies.append(movie)
    }
    
    func movies(in genre: Genre) -> [Movie] {
        return movies.filter { $0.genre == genre }
    }
    
    func highestRatedMovie() -> Movie? {
        return movies.max(by: { $0.rating < $1.rating })
    }
    
    var averageRating: Double {
        guard !movies.isEmpty else { return 0.0 }
        let totalRating = movies.reduce(0.0) { $0 + $1.rating }
        return totalRating / Double(movies.count)
    }
}


let library = MovieLibrary()

let movie1 = Movie(title: "1+1", genre: .drama, rating: 8.8)
let movie2 = Movie(title: "Home alone", genre: .comedy, rating: 9.0)
let movie3 = Movie(title: "Interstellar", genre: .sciFi, rating: 8.6)
let movie4 = Movie(title: "The Hangover", genre: .comedy, rating: 7.7)

library.addMovie(movie1)
library.addMovie(movie2)
library.addMovie(movie3)
library.addMovie(movie4)

print("=== 📚 Movie Library Status ===")
print("Average rating:", String(format: "%.2f", library.averageRating))

if let topMovie = library.highestRatedMovie() {
    print("Highest rated movie:", topMovie.title, "(\(topMovie.rating))")
}

let sciFiMovies = library.movies(in: .sciFi)
print("Sci-Fi movies:", sciFiMovies.map { $0.title })

print("\n=== 👤 User Activity ===")
let user = User(name: "Nariman")

user.addFavorite(movie: movie1)
user.addFavorite(movie: movie2)
print("\(user.name)'s favorite movies:", user.favoriteMovies.map { $0.title })

user.removeFavorite(title: "Inception")
print("After removing Inception:", user.favoriteMovies.map { $0.title })
