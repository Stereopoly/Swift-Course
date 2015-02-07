//
//  ViewController.swift
//  Learning Maps
//
//  Created by Oscar Bjorkman on 1/22/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {

    @IBOutlet var mapView: MKMapView!
    
    var manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Core Location
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
        
        
        
        
        // 37.386036, -122.089892
        
        var latitude:CLLocationDegrees = 37.386036
        var longitude:CLLocationDegrees = -122.089892
        
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = location
        
        annotation.title = "Home"
        
        annotation.subtitle = "I live here"
        
        mapView.addAnnotation(annotation)
        
        var longPress = UILongPressGestureRecognizer(target: self, action: "action:")   // need colon because func has parameters
        
        longPress.minimumPressDuration = 2.0
    
        mapView.addGestureRecognizer(longPress)

    }
    
    func action(gestureRecognizer:UIGestureRecognizer) {
        
        var touchPoint = gestureRecognizer.locationInView(self.mapView)
        
        var newCoordinate:CLLocationCoordinate2D = mapView.convertPoint(touchPoint, toCoordinateFromView: self.mapView)
        
        var annotation = MKPointAnnotation()
        
        annotation.coordinate = newCoordinate
        
        annotation.title = "New Point"
        
        annotation.subtitle = "My new point."
        
        mapView.addAnnotation(annotation)
        
    }

    func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        
        var userLocation:CLLocation = locations[0] as CLLocation
        
        var latitude:CLLocationDegrees = userLocation.coordinate.latitude
        var longitude:CLLocationDegrees = userLocation.coordinate.longitude
        
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        mapView.setRegion(region, animated: true)

        
    }
    
    func locationManager(manager: CLLocationManager!, didFailWithError error: NSError!) {
        println(error)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

