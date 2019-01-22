/*: 
⬇️ *Vous pouvez ignorez le code ci-dessous, il nous permet juste d'initialiser et de visualiser le canvas à droite.*
 */
import PlaygroundSupport
let canvas = Canvas()
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = canvas

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

class RoadSection {
    init() {
        canvas.createRoadSection()
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
            self.sections.append(RoadSection())
        }
    }
}

var testBus = Bus(driversName: "Schumi")
//print(testBus.driversName)
var testRoad = Road(length: 40)
testBus.moveForward()
testBus.drive(road: testRoad)
