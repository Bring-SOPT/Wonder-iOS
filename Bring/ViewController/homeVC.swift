//
//  homeVC.swift
//  Bring
//
//  Created by 박소현 on 27/12/2018.
//  Copyright © 2018 sohyeon. All rights reserved.
//

import UIKit
import GoogleMaps
import CoreLocation
import AddressBookUI

class homeVC: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var infoView: UIView!
    @IBOutlet var mapView: GMSMapView!
    var myMarker = GMSMarker()
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapSettings()
        cafeMarker()
         mapView.delegate = self
        self.view.addSubview(mapView!)
        
 
        self.view.addSubview(infoView)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.delegate = self
        
        // 사용할때만 위치정보를 사용한다는 팝업이 발생
        //        locationManager.requestWhenInUseAuthorization()
        
        // 항상 위치정보를 사용한다는 판업이 발생
        locationManager.requestAlwaysAuthorization()
        
        locationManager.startUpdatingLocation()
        
        move(at: locationManager.location?.coordinate)
    }
    
    func mapSettings() {
        mapView.isMyLocationEnabled = true;
        mapView.settings.myLocationButton = true;
    }
    

    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let firstLocation = locations.first else {
            return
        }
        
//        move(at: firstLocation.coordinate)
    }
    
    func cafeMarker() {
        
        let marker = GMSMarker()
        marker.position = CLLocationCoordinate2D(latitude: 37.501852, longitude: 127.037243)
        let markerimg = UIImage(named: "homePinCafe")
        marker.icon = markerimg
        marker.title = "뿌잉뿌잉"
        marker.snippet = "뿡뿡"
        marker.map = mapView
        
    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool  {
        print("마커클릭...")
        print("설탕공주")
        if marker.title == "뿌잉뿌잉"{
            print("뿌잉뿌잉을 클릭함")
            infoView.isHidden = false
        }
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        if infoView.isHidden == false {
            infoView.isHidden = true
        }
    }
    

    @IBAction func menudetailAction(_ sender: Any) {

        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "menudetailVC") as? menudetailVC else { return }
//
        navigationController?.pushViewController(dvc, animated: true)
        
//        self.performSegue(withIdentifier: "menudetailSegue", sender: self)
        
        
    }
    


    

}

extension homeVC {
    func move(at coordinate: CLLocationCoordinate2D?) {
        guard let coordinate = coordinate else {
            return
        }
        
        print("move = \(coordinate)")
        
        let latitude = coordinate.latitude
        let longitude = coordinate.longitude
        
        let camera = GMSCameraPosition.camera(withLatitude: latitude, longitude: longitude, zoom: 14.0)
        mapView.camera = camera
//
//        myMarker.position = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
//        myMarker.title = "My Position"
//        myMarker.snippet = "Known"
//        myMarker.map = mapView
    }
}
