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
}

class RoadSection {
    
}

class Road {
    var sections = [RoadSection]()
}

var testBus = Bus(driversName: "bite")
print(testBus.driversName)
