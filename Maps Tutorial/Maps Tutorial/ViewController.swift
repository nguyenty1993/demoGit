//
//  ViewController.swift
//  Maps Tutorial
//
//  Created by programming-xcode on 10/14/16.
//  Copyright © 2016 programming-xcode. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet var map: MKMapView!
    @IBOutlet var segmentedcontrol: UISegmentedControl!
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func segmentchanged(_ sender: AnyObject) {
        switch segmentedcontrol.selectedSegmentIndex {
        case 0:
            map.mapType = MKMapType.standard
            break
        case 1:
            map.mapType = MKMapType.satellite
            break
        case 2:
            map.mapType = MKMapType.hybrid
            break
        case 4:
            map.mapType = MKMapType.hybridFlyover
            break
        case 3:
            map.mapType = MKMapType.satelliteFlyover
            break
        default:
            break
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        
        let userLocation:CLLocation = locations[0]
        
        let latitude:CLLocationDegrees = userLocation.coordinate.latitude
        
        let longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        let latDelta:CLLocationDegrees = 0.05
        
        let lonDelta:CLLocationDegrees = 0.05
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        
        let pin = MKPointAnnotation()
        pin.coordinate.latitude = userLocation.coordinate.latitude
        pin.coordinate.longitude = userLocation.coordinate.longitude 
        pin.title = "Your movement line"
        map.addAnnotation(pin)
        
    }

}

