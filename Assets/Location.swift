// Location.swift
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    let manager = CLLocationManager()

    override init() {
        super.init()
        manager.delegate = self
        manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("\(location.coordinate.latitude),\(location.coordinate.longitude)")
            manager.stopUpdatingLocation()
        }
    }
}

let locationManager = LocationManager()
RunLoop.main.run()