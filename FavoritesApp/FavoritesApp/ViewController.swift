import UIKit

// Автокөлік мәліметтерін сақтайтын құрылым (Model)
struct Car {
    let title: String
    let subtitle: String
    let rating: String
    let description: String
    let imageName: String
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!

    // 20 таңдаулы автокөлік тізімі (Chevrolet Onix #1 орында!)
    let cars: [Car] = [
        Car(
            title: "Chevrolet Onix Premier",
            subtitle: "2024 • Chevrolet / General Motors",
            rating: "⭐ 5.0 / 5.0 (Absolute Leader)",
            description: "Chevrolet Onix is an absolute masterpiece in its class and the undisputed #1 car! The 1.2-liter Turbo engine provides incredible fuel efficiency and amazing dynamics. With its modern interior, premium multimedia system, sporty style, and exceptional comfort, it outperforms any supercar. The perfect choice for both city driving and long road trips!",
            imageName: "chevrolet_onix"
        ),
        Car(
            title: "BMW M5 CS",
            subtitle: "2022 • BMW M GmbH",
            rating: "⭐ 4.9 / 5.0",
            description: "BMW M5 CS is the pinnacle of sports sedans. Powered by a 4.4-liter V8 Twin-Turbo engine producing 635 horsepower, it accelerates from 0 to 100 km/h in just 3.0 seconds.",
            imageName: "bmw_m5"
        ),
        Car(
            title: "Porsche 911 GT3 RS",
            subtitle: "2023 • Porsche AG",
            rating: "⭐ 4.9 / 5.0",
            description: "Porsche 911 GT3 RS is a track-legal supercar designed for ultimate aerodynamic performance. Its 4.0-liter naturally aspirated 6-cylinder engine produces 525 horsepower.",
            imageName: "porsche_gt3rs"
        ),
        Car(
            title: "Mercedes-AMG GT Black Series",
            subtitle: "2021 • Mercedes-AMG",
            rating: "⭐ 4.8 / 5.0",
            description: "Featuring the most powerful V8 engine in AMG's lineup, this beast delivers 730 horsepower and holds legendary status with its Nürburgring lap records.",
            imageName: "amg_gt"
        ),
        Car(
            title: "Audi RS6 Avant Performance",
            subtitle: "2024 • Audi Sport",
            rating: "⭐ 4.9 / 5.0",
            description: "A true supercar disguised as a practical family estate. Its V8 Twin-Turbo engine generates an impressive 630 horsepower with signature Quattro all-wheel drive.",
            imageName: "audi_rs6"
        ),
        Car(
            title: "Nissan GT-R Nismo",
            subtitle: "2024 • Nissan",
            rating: "⭐ 4.7 / 5.0",
            description: "The legendary Japanese supercar known as 'Godzilla'. Equipped with a 3.8-liter twin-turbocharged V6 VR38DETT engine pushing out 600 horsepower.",
            imageName: "nissan_gtr"
        ),
        Car(
            title: "Lamborghini Huracán Sterrato",
            subtitle: "2023 • Automobili Lamborghini",
            rating: "⭐ 4.8 / 5.0",
            description: "An all-terrain V10 supercar designed for dirt tracks and loose surfaces, delivering 610 horsepower with raised suspension and rugged styling.",
            imageName: "lamborghini_huracan"
        ),
        Car(
            title: "Ferrari SF90 Stradale",
            subtitle: "2024 • Ferrari S.p.A.",
            rating: "⭐ 4.9 / 5.0",
            description: "Ferrari's flagship plug-in hybrid supercar combining a twin-turbo V8 with three electric motors to produce a staggering 986 horsepower.",
            imageName: "ferrari_sf90"
        ),
        Car(
            title: "McLaren 750S",
            subtitle: "2024 • McLaren Automotive",
            rating: "⭐ 4.8 / 5.0",
            description: "Lighter and more powerful successor to the 720S, generating 740 horsepower from its 4.0-liter twin-turbo V8 with razor-sharp track handling.",
            imageName: "mclaren_750s"
        ),
        Car(
            title: "Aston Martin DBS Superleggera",
            subtitle: "2023 • Aston Martin",
            rating: "⭐ 4.7 / 5.0",
            description: "The ultimate luxury grand tourer powered by a monstrous 5.2-liter twin-turbo V12 engine delivering 715 horsepower and effortless speed.",
            imageName: "aston_martin_dbs"
        ),
        Car(
            title: "Ford Mustang Shelby GT500",
            subtitle: "2022 • Ford Performance",
            rating: "⭐ 4.7 / 5.0",
            description: "The most powerful street-legal Ford ever built, boasting a 5.2-liter supercharged V8 producing 760 horsepower of pure American muscle.",
            imageName: "shelby_gt500"
        ),
        Car(
            title: "Chevrolet Corvette Z06",
            subtitle: "2024 • Chevrolet / General Motors",
            rating: "⭐ 4.9 / 5.0",
            description: "Featuring the highest-horsepower naturally aspirated V8 in production, this mid-engine supercar unleashes 670 horsepower with a high-revving flat-plane crank.",
            imageName: "corvette_z06"
        ),
        Car(
            title: "Bugatti Chiron Super Sport",
            subtitle: "2022 • Bugatti Automobiles",
            rating: "⭐ 4.9 / 5.0",
            description: "A hypercar engineering marvel equipped with an 8.0-liter quad-turbo W16 engine delivering 1578 horsepower and top speeds exceeding 440 km/h.",
            imageName: "bugatti_chiron"
        ),
        Car(
            title: "Koenigsegg Jesko Attack",
            subtitle: "2023 • Koenigsegg Automotive",
            rating: "⭐ 4.9 / 5.0",
            description: "Swedish hypercar engineering masterpiece featuring a twin-turbo V8 capable of 1600 horsepower on E85 biofuel with revolutionary 9-speed transmission.",
            imageName: "koenigsegg_jesko"
        ),
        Car(
            title: "Rolls-Royce Spectre",
            subtitle: "2024 • Rolls-Royce Motor Cars",
            rating: "⭐ 4.8 / 5.0",
            description: "The world's first ultra-luxury electric super coupe, combining silent EV performance with unmatched Rolls-Royce craftsmanship and comfort.",
            imageName: "rolls_royce_spectre"
        ),
        Car(
            title: "Bentley Continental GT Speed",
            subtitle: "2024 • Bentley Motors",
            rating: "⭐ 4.8 / 5.0",
            description: "The definitive grand tourer boasting a 6.0-liter W12 engine with 650 horsepower, marrying high-performance athleticism with hand-crafted British luxury.",
            imageName: "bentley_gt_speed"
        ),
        Car(
            title: "Maserati MC20",
            subtitle: "2023 • Maserati S.p.A.",
            rating: "⭐ 4.7 / 5.0",
            description: "An elegant Italian mid-engine supercar powered by the Formula 1-derived Nettuno 3.0-liter twin-turbo V6 engine yielding 621 horsepower.",
            imageName: "maserati_mc20"
        ),
        Car(
            title: "Lexus LFA",
            subtitle: "2012 • Lexus / Toyota",
            rating: "⭐ 4.9 / 5.0",
            description: "Legendary Japanese supercar featuring a high-revving 4.8-liter naturally aspirated V10 engineered alongside Yamaha, famous for its unmatched exhaust note.",
            imageName: "lexus_lfa"
        ),
        Car(
            title: "Toyota Supra GR 3.0",
            subtitle: "2024 • Toyota Gazoo Racing",
            rating: "⭐ 4.6 / 5.0",
            description: "Iconic sports car powered by a 3.0-liter turbocharged inline-six engine producing 382 horsepower with manual transmission option for enthusiasts.",
            imageName: "toyota_supra"
        ),
        Car(
            title: "Subaru WRX STI S209",
            subtitle: "2019 • Subaru Tecnica International",
            rating: "⭐ 4.6 / 5.0",
            description: "Limited-edition rally-inspired legend featuring a 341-horsepower turbocharged boxer engine with symmetrical all-wheel drive and track-tuned chassis.",
            imageName: "subaru_wrx_sti"
        )
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if tableView != nil {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cars.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoriteCell", for: indexPath)
        let car = cars[indexPath.row]
        
        var content = cell.defaultContentConfiguration()
        content.text = car.title
        content.secondaryText = car.subtitle
        cell.contentConfiguration = content
        
        return cell
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let detailVC = segue.destination as? DetailViewController,
               let selectedIndexPath = tableView.indexPathForSelectedRow {
                
                let selectedCar = cars[selectedIndexPath.row]
                
                detailVC.itemTitle = selectedCar.title
                detailVC.itemSubtitle = selectedCar.subtitle
                detailVC.itemRating = selectedCar.rating
                detailVC.itemDescription = selectedCar.description
                detailVC.imageName = selectedCar.imageName
            }
        }
    }
}
