import Foundation

struct Track {
    let title: String
    let artist: String
    let coverName: String
    let fileName: String

    // Барлық тректердің тізімі
    static let allTracks: [Track] = [
        Track(title: "Big City Life", artist: "ASKHA prince", coverName: "bigcitylife", fileName: "bigcitylife"),
        Track(title: "Ballada", artist: "Xcho", coverName: "ballada", fileName: "ballada"),
        Track(title: "Meni Kut", artist: "Ernar Amandyq", coverName: "menikut", fileName: "menikut"),
        Track(title: "Men Dep Oyla", artist: "Yenlik", coverName: "mendepoyla", fileName: "mendepoyla"),
        Track(title: "Kel Kel", artist: "ayau", coverName: "kelkel", fileName: "kelkel"),
        Track(title: "Uide", artist: "Darkhan Juzz", coverName: "uide", fileName: "uide"),
        Track(title: "Shym", artist: "Shiza", coverName: "shym", fileName: "shym"),
        Track(title: "An Sal Sarbaz", artist: "Madina Sadvakasova", coverName: "ansalsarbaz", fileName: "ansalsarbaz"),
        Track(title: "Iz-za Tebya", artist: "abdr", coverName: "izzatebya", fileName: "izzatebya")
    ]
}
