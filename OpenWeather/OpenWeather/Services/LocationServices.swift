import Foundation
import CoreLocation

class LocationManager: NSObject, CLLocationManagerDelegate {
    
    typealias DidStartLocationUpdate = () -> Void
    typealias DidFinishLocationUpdate = (CLLocation?, String?) -> Void
    
    static let sharedInstance = LocationManager()
    
    private var locationManager: CLLocationManager = CLLocationManager()
    
    private var startCallback: DidStartLocationUpdate?
    private var endCallback: DidFinishLocationUpdate?
    
    func getLocation(startCallback: (DidStartLocationUpdate)? = nil, endCallback: (DidFinishLocationUpdate)? = nil){
        
        self.startCallback = startCallback;
        self.endCallback = endCallback;
        
        if self.startCallback != nil{
            self.startCallback!()
        }
        
        self.locationManager = CLLocationManager()
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
        self.isAuthorizedToGetUserLocation()
        
        if CLLocationManager.locationServicesEnabled() {
            
            self.locationManager.delegate = self
            self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            self.locationManager.startUpdatingLocation()
            
        }else{
            
            if self.endCallback != nil{
                self.endCallback!(nil, "Localização desativada")
            }
            
        }
        
    }
    
    func isAuthorizedToGetUserLocation() {
        
        if CLLocationManager.authorizationStatus() != .authorizedWhenInUse{
            
            self.locationManager.requestWhenInUseAuthorization()
            
        }
        
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        if status == .denied {
            
            if self.endCallback != nil{
                self.endCallback!(nil, "Usuário negou")
            }
            
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let userLocation:CLLocation = locations[0] as CLLocation
        self.locationManager.stopUpdatingLocation()
        self.locationManager.delegate = nil
        
        if self.endCallback != nil{
            self.endCallback!(userLocation, nil)
        }
        
        
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        
        self.locationManager.stopUpdatingLocation()
        self.locationManager.delegate = nil
        
        if self.endCallback != nil{
            self.endCallback!(nil, error.localizedDescription)
        }
        
    }
    
}
