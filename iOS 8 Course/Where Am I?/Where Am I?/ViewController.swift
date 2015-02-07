//
//  ViewController.swift
//  Where Am I?
//
//  Created by Oscar Bjorkman on 1/25/15.
//  Copyright (c) 2015 Oscar Bjorkman. All rights reserved.
//

import UIKit
import CoreLocation
import MapKit

class ViewController: UIViewController, CLLocationManagerDelegate {
    
    
    @IBAction func findMe(sender: AnyObject) {
        
        manager.requestWhenInUseAuthorization()
        manager.startUpdatingLocation()
        
    }
    
    @IBOutlet var myMap: MKMapView!
    
    @IBOutlet var latitudeLabel: UILabel!
    
    @IBOutlet var longitudeLabel: UILabel!
    
    @IBOutlet var altitudeLabel: UILabel!
    
    @IBOutlet var headingLabel: UILabel!
    
    @IBOutlet var speedLabel: UILabel!
    
    @IBOutlet var addressLabel: UILabel!
    
    var manager:CLLocationManager!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        manager = CLLocationManager()
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        
        if activePlace == -1 {
            manager.requestWhenInUseAuthorization()
            manager.startUpdatingLocation()

        }
        else {
        
        let lat = NSString(string: places[activePlace]["lat"]!).doubleValue
        let long = NSString(string: places[activePlace]["long"]!).doubleValue
        
        var latitude:CLLocationDegrees = lat
        var longitude:CLLocationDegrees = long
        
        var latDelta:CLLocationDegrees = 0.01
        var longDelta:CLLocationDegrees = 0.01
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, longDelta)
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        myMap.setRegion(region, animated: true)
        
        var annotation = MKPointAnnotation()
            
        annotation.coordinate = location
            
        annotation.title = places[activePlace]["name"]
            
        myMap.addAnnotation(annotation)
        
        latitudeLabel.text = ""
        longitudeLabel.text = ""
        altitudeLabel.text = ""
        headingLabel.text = ""
        speedLabel.text = ""
        addressLabel.text = ""
        
        }
        
    }
    
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.navigationBarHidden = false
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "back" {
        
            places.removeAtIndex(0)
        }
        
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
        
        myMap.setRegion(region, animated: true)
        
        manager.stopUpdatingLocation()

        CLGeocoder().reverseGeocodeLocation(userLocation, completionHandler:{(placemarks, error) in
            
            if error != nil {
                println(error)
            }
            else {
                let p = CLPlacemark(placemark: placemarks[0] as CLPlacemark)
                
                self.addressLabel.text = "\(p.subThoroughfare) \(p.thoroughfare) \n \(p.subAdministrativeArea) \n \(p.postalCode) \n \(p.country)"
                
            }
            
        })
        
      //  println(userLocation)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

