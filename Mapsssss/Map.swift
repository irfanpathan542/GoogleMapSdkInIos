//
//  Map.swift
//  Mapsssss
//
//  Created by iFlame on 6/1/17.
//  Copyright © 2017 iFlame. All rights reserved.
//

import UIKit
import CoreLocation
import GoogleMaps

class Map: UIViewController,CLLocationManagerDelegate  {

    @IBOutlet var myMapView: UIView!
    
    let locationManager = CLLocationManager()
    var mapView = GMSMapView()
    var camera = GMSCameraPosition()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        // Do any additional setup after loading the view.
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.showCurrentLocationOnMap()
        self.locationManager.stopUpdatingLocation()
    }
    func showCurrentLocationOnMap() {
        
        let camera = GMSCameraPosition.camera(withLatitude: (self.locationManager.location?.coordinate.latitude)!, longitude: (self.locationManager.location?.coordinate.longitude)!, zoom: 14)
        let mapView = GMSMapView.map(withFrame: CGRect(origin: CGPoint(x: 0, y: 0),size: CGSize(width: self.myMapView.frame.size.width,height: self.myMapView.frame.size.height)),  camera: camera)
        
        mapView.settings.myLocationButton = true
        mapView.isMyLocationEnabled = true
        let marker = GMSMarker()
        marker.position = camera.target
        marker.snippet = "Current Location"
        marker.appearAnimation = GMSMarkerAnimation.pop
        marker.map = mapView
        self.myMapView.addSubview(mapView)
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
