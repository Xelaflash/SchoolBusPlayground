/*: 
⬇️ *Vous pouvez ignorez le code ci-dessous, il nous permet juste d'initialiser et de visualiser le canvas à droite.*
 */
import PlaygroundSupport
let canvas = Canvas()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = canvas



enum RoadSectionType {
    case plain
    case home
    case school
}

class RoadSection {
    var type: RoadSectionType
    init(type: RoadSectionType) {
        self.type = type
        switch type {
        case .plain:
            canvas.createRoadSection()
        case .home:
            canvas.createHomeRoadSection()
        case .school:
            canvas.createSchoolRoadSection()
        }
    }
    
    static func createRoadToSchool() -> Road {
        let road = Road(length: 0)
        for i in 0..<30 {
            if i%7 == 1 {
                road.sections.append(HomeRoadSection(children: 2))
            } else {
                road.sections.append(RoadSection(type: .plain))
            }
        }
        road.sections.append(SchoolRoadSection())
        return road
    }
}

// super fait ref à l'init de la classe mère
class HomeRoadSection: RoadSection {
    var children : Int
    init(children: Int) {
        self.children = children
        super.init(type: .home)
    }
}

class SchoolRoadSection: RoadSection {
    init() {
        super.init(type: .school)
    }
}

class Road {
    static let maxLength = 77
    var sections = [RoadSection]()

    init(length: Int) {
        var length = length
//        on verifie si la taille est inférieure à la taille max
        if length > Road.maxLength {
            length = Road.maxLength
        }
        for _ in 0..<length {
            self.sections.append(RoadSection(type: .plain))
        }
    }
}

class Bus {
    var driversName: String
    var seats = 20
    var occupiedSeats = 0
    
    init(driversName: String) {
        self.driversName = driversName
    }
    
    func moveForward() {
        canvas.moveBusForward()
    }
    
    func stop() {
        canvas.stopBus()
    }
    
    func drive(road: Road) {
        for _ in road.sections {
            moveForward()
        }
    }
}

class SchoolBus: Bus {
    var SchoolName = ""
    //    L'override est une technique qui permet à une classe fille de réécrire une méthode de la classe mère.
    override func drive(road: Road) {
        for section in road.sections {
            switch section.type {
            case .plain:
                moveForward()
            case .home:
                if shouldPickChildren() {
                    pickChildren(from: section)
                    stop()
                }
                moveForward()
            case .school:
                dropChildren()
                stop()
            }
        }
    }
    
    func shouldPickChildren() -> Bool {
        return occupiedSeats < seats
    }
    
    func pickChildren(from roadSection: RoadSection) {
        if let section = roadSection as? HomeRoadSection {
            occupiedSeats += section.children
        }
    }
    
    func dropChildren() {
        occupiedSeats = 0
    }
}



//var testBus = Bus(driversName: "Schumi")
////print(testBus.driversName)
//var testRoad = Road(length: 40)
//testBus.moveForward()
//testBus.drive(road: testRoad)
