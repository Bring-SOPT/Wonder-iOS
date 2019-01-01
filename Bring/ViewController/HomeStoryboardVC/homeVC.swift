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
    
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var infoImg1: UIImageView!
    @IBOutlet var infoImg2: UIImageView!
    @IBOutlet var infoImg3: UIImageView!
    
    var cafeList: [Cafe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mapSettings()
        cafeMarker()
        setCafeData()
        testMarker()
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
    
//    func cafeMarker() {
//
//        let marker = GMSMarker()
//        marker.position = CLLocationCoordinate2D(latitude: 37.501852, longitude: 127.037243)
//        let markerimg = UIImage(named: "homePinCafe")
//        marker.icon = markerimg
//        marker.title = "뿌잉뿌잉"
//        marker.snippet = "뿡뿡"
//        marker.map = mapView
//
//    }
    
    func mapView(_ mapView: GMSMapView, didTap marker: GMSMarker) -> Bool  {
        print("마커클릭...")
        print("설탕공주")
//        if marker.title == "뿌잉뿌잉"{
//            print("뿌잉뿌잉을 클릭함")
//            infoView.isHidden = false
//        }
        infoView.isHidden = false
        return false
    }
    
    func mapView(_ mapView: GMSMapView, didTapAt coordinate: CLLocationCoordinate2D) {
        
        if infoView.isHidden == false {
            infoView.isHidden = true
        }
    }
    

    @IBAction func menuDetailAction(_ sender: Any) {
        
        guard let dvc = storyboard?.instantiateViewController(withIdentifier: "menudetailVC") as? menudetailVC else { return }
        dvc.cafenameData = infoLabel.text
          self.performSegue(withIdentifier: "naviSegue", sender: self)
//        navigationController?.pushViewController(dvc, animated: true)
        print("왜안되는거지")
        
//        메뉴상세뷰에서 네브바가 추가되면서 데이터전달이 안됨
//        승수찡한테 질문할부분 ...
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
    
    func cafeMarker() {
        
        let cafemarker = GMSMarker()
        cafemarker.position = CLLocationCoordinate2D(latitude: 37.501852, longitude: 127.037243)
        let markerimg = UIImage(named: "homePinCafe")
        cafemarker.icon = markerimg
        cafemarker.title = "뿌잉뿌잉"
        cafemarker.snippet = "뿡뿡"
        cafemarker.map = mapView
        infoLabel.text = cafemarker.title
    }
    
    func setCafeData() {
        
        let cafe0 = Cafe(name: "카페토니", latitude: 37.497718, longitude: 127.037186, Img: "tab_home")
        let cafe1 = Cafe(name: "투썸플레이스 역삼역점", latitude: 37.502401, longitude: 127.038016, Img: "tab_home")
        cafeList = [cafe0, cafe1]
    }
    
    func testMarker() {
        
        let testmarker = GMSMarker()
        testmarker.position = CLLocationCoordinate2D(latitude: 37.784358, longitude: -122.406893)
        let markerimg = UIImage(named: "homePinCafe")
        testmarker.icon = markerimg
        testmarker.title = "설탕공주"
        testmarker.snippet = "김하늘"
        testmarker.map = mapView
        infoLabel.text = testmarker.title
        
    }
    
}
