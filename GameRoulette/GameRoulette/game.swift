import Foundation

struct Game {
    let title: String
    let description: String
    let imageName: String
}

let gamesList: [Game] = [
    Game(title: "EA Sports FC (FIFA)", description: "The world's most popular football simulator featuring real teams, players, and thrilling tournaments.", imageName: "fifa"),
    Game(title: "GTA V", description: "An open-world action-adventure game set in the fictional state of San Andreas, following three criminals.", imageName: "gta"),
    Game(title: "Minecraft", description: "A sandbox game where players can build, explore, and survive in a blocky, procedurally generated 3D world.", imageName: "Minecraft"),
    Game(title: "God of War", description: "Kratos and his son Atreus journey through Norse realms, battling mythical creatures and gods.", imageName: "god_of_war"),
    Game(title: "Mortal Kombat 11", description: "A legendary fighting game featuring iconic characters, brutal fatalities, and a cinematic story mode.", imageName: "mortal_kombat"),
    Game(title: "EA Sports UFC", description: "An intense mixed martial arts fighting game featuring realistic octagon action and top UFC fighters.", imageName: "ufc"),
    Game(title: "Marvel's Spider-Man", description: "Swing through New York City as Spider-Man to fight crime, iconic villains, and save the city.", imageName: "spider_man"),
    Game(title: "Cyberpunk 2077", description: "An open-world, action-adventure RPG set in the megalopolis of Night City as a cyberpunk mercenary.", imageName: "cyberpunk"),
    Game(title: "Red Dead Redemption 2", description: "An epic tale of life in America's unforgiving heartland at the dawn of the modern age.", imageName: "rdr2"),
    Game(title: "Call of Duty", description: "A fast-paced first-person shooter game featuring intense multiplayer battles and gripping campaigns.", imageName: "call_of_duty")
]
