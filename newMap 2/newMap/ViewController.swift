import GoogleMaps
import UIKit
import GoogleMapsUtils

class ViewController: UIViewController , CLLocationManagerDelegate , GMSMapViewDelegate {

    let myLocation = CLLocationManager()   // object from type CLLocationManager
    
    
    @IBOutlet var mapView: GMSMapView!
    @IBOutlet var myAdress: UILabel!
    
    private var heatmapLayer:GMUHeatmapTileLayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myLocation.delegate = self
        myLocation.requestWhenInUseAuthorization()
        myLocation.startUpdatingLocation()
        
        mapView.delegate = self
        mapView.isIndoorEnabled = true
        mapView.settings.myLocationButton = true
        
        
        setUpHeatMap()

    }
    

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last{
            let latitidude = location.coordinate.latitude
            let longitude = location.coordinate.longitude
            let camera = GMSCameraPosition(latitude: latitidude, longitude: longitude, zoom: 17.0)
            self.mapView.animate(to: camera)
        }
    }
    
    func myLocation(coordinates:CLLocationCoordinate2D){
        //هنا بديت احول الاحدثيات لعنوان نصي
   let geocoder = GMSGeocoder()
        
        geocoder.reverseGeocodeCoordinate(coordinates){
            response , error in
            if let adress = response?.firstResult(),
               let lines = adress.lines{
                self.myAdress.text=lines.joined(separator: "\n")
            }
        }
    }
    
    
    
    
    
    func mapView(_ mapView: GMSMapView, didChange position: GMSCameraPosition) {
        let latitude = mapView.camera.target.latitude
        let logitude = mapView.camera.target.longitude
        
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: logitude)
        myLocation(coordinates: location)
    }
    
    
  
    
    func mapView(_ mapView: GMSMapView, didLongPressAt coordinate: CLLocationCoordinate2D) {
        let marker = GMSMarker()
        
        let markerLat = coordinate.latitude
        let markerLong = coordinate.longitude
        
        marker.position = coordinate
        marker.title = "الاحداثيات"
        marker.snippet = "\(markerLat) \n \(markerLong)"
        
        marker.map = mapView
    }
    
    func didTapMyLocationButton(for mapView: GMSMapView) -> Bool {
        return false
    }
    
    
    
    
    
    
    private func getDummyLocation() -> [Location]{
    
        
        let locationArray : [Location] = [
            Location(latitude:24.633333 , longitude:46.716667 ),
            Location(latitude:24.6333334 , longitude:46.7166674 ),
            Location(latitude:24.6333335 , longitude:46.7166676 ),
            Location(latitude:24.6333336 , longitude:46.7166675 ),
            Location(latitude:24.6333337, longitude:46.7166678 ),

        ]
         
        return locationArray
    }
    
    private func addHeatMap(){
        var list = [GMUWeightedLatLng]()
        let locations = getDummyLocation()
        
        for location in locations {
            let lat = location.latitude
            let longi = location.longitude
            let coords = GMUWeightedLatLng(coordinate: CLLocationCoordinate2DMake(lat, longi), intensity: 2.0)
            list.append(coords)
        }
        heatmapLayer.weightedData = list
    }
    
    private func setUpHeatMap(){
        heatmapLayer = GMUHeatmapTileLayer()
        heatmapLayer.radius = 90
        heatmapLayer.opacity = 0.8
        addHeatMap()
        heatmapLayer.map = mapView

    }}

struct Location{
    var latitude:Double
    var longitude:Double
}
