//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Marcel Benders on 11.12.22.
//

import SwiftUI

struct LandmarkList: View {
    @State private var showFaforitesOnly = false
    
    var filteredLandmarks: [Landmark] {
        landmarks.filter{landmark in
            (!showFaforitesOnly || landmark.isFavorite)
        }
    }
    
     var body: some View {
        NavigationView{
            List{
                /**
                 You use the $ prefix to access a binding to a state variable, or one of its properties.
                 */
                Toggle(isOn: $showFaforitesOnly) {
                    Text("Faforites Only")
                }
                ForEach(filteredLandmarks){landmark in
                    NavigationLink{
                        LandmarkDetail(landmark: landmark)
                    }label: {
                        LandmarkRow(landmark: landmark)
                    }
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
     //   ForEach(["iPhone SE (2nd generation)", "iPhone XS Max"], id: \.self) { deviceName in
            LandmarkList()
           //     .previewDevice(PreviewDevice(rawValue: deviceName))
            //    .previewDisplayName(deviceName)
       // }
    }

}
