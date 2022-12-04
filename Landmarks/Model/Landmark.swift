//
//  Landmark.swift
//  Landmarks
//
//  Created by Marcel Benders on 04.12.22.
//

import Foundation
import SwiftUI
import CoreLocation

/*
 Adding Codable conformance makes it easier to move data between the structure and a data file.
 */
struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    var park: String
    var state: String
    var description: String
    
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    private var coordinates: Coordinates
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable, Codable {
        var latitude: Double
        var longitude: Double
    }
}
