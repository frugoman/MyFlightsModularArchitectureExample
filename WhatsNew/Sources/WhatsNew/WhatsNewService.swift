import Foundation

public class WhatsNewService {
    public init() {}
    
    public func getWhatsNew(callback: @escaping (WhatsNew) -> Void) {
        //Simulating network call...
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            callback(WhatsNew(title: "There%27s%20a%20new%20flight!", message: "Check%20it%20out%20now", action: "myFlights%3A%2F%2Fflights%2Fdetail%3Fid%3D1"))
        }
    }
}
