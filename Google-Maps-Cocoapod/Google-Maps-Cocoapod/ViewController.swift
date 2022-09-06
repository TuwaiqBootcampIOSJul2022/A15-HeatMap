

import UIKit

import GoogleMaps
import CoreLocation
class ViewController: UIViewController,GMSMapViewDelegate {
    var locitonmanger = CLLocationManager()
    

    @IBOutlet weak var UILabel: UILabel!
    @IBOutlet weak var GMSMapView: GMSMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        locitonmanger.delegate = self
                
                       locitonmanger.requestAlwaysAuthorization()
                       locitonmanger.startUpdatingLocation()
                       // Do any additional setup after loading the view.
                       
                       let center = CLLocationCoordinate2DMake(23.633,46.533)
                       let regen = CLCircularRegion(center: center, radius: 100, identifier: "sara")
                       locitonmanger.startMonitoring(for: regen)
        
                GMSMapView.delegate = self
                GMSMapView.isMyLocationEnabled = true
                GMSMapView.settings.myLocationButton = true

        
    }


}

extension ViewController:CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didEnterRegion region: CLRegion) {
        print("Enter")    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last{
            let longitude = lastLocation.coordinate.longitude
            let latitude = lastLocation.coordinate.latitude
            print("longitude:\(longitude)")
            print("latitude:\(latitude)")
            let camera = GMSCameraPosition(latitude: latitude, longitude: longitude, zoom: 18)
            self.GMSMapView.animate(to:camera )
        }
        
        func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
            print("Failed to find user's location: \(error.localizedDescription)")
        }
        
        func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
            return false
        }
     
     
     func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
         
         
         let marker = GMSMarker()
         
         
         marker.position = coordinate
         
         
         let markerLatitude = Float( coordinate.latitude )
         let markerLongitude = Float(coordinate.longitude)
         
         
         marker.title =  "place"
         marker.snippet = "\(markerLatitude)\n\(markerLongitude)"
         marker.map = mapView
     }
     
    
     
        
            }
