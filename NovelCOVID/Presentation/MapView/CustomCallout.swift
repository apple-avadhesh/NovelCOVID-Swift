//
//  CustomCallout.swift
//  NovelCOVID
//
//  Created by Developer Bully on 06/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI

struct CalloutView: View {
    
    var country: CountryModel
    
    var body: some View {
        VStack {
            HStack {
                KFImage(URL(string: "\(self.country.countryInfo?.flag ?? "")")).resizable()
                    .frame(width: 50, height: 30)
                    .shadow(radius: 10)
                    .aspectRatio(contentMode: ContentMode.fit)
                VStack {
                    Text(country.country!)
                        .font(.title)
                        .fontWeight(.semibold)
                }
                Spacer()
            }
            
            HStack(spacing: 10.0) {
                
                GridView(title: "Cases", subTitle: "\(country.cases ?? 0)", textColor: Color.white).frame(maxWidth: .infinity, maxHeight: 80.0).background(Color.blue).cornerRadius(8.0).shadow(color: Color.blue, radius: 2.0)
                
                GridView(title: "Recovered", subTitle: "\(country.recovered ?? 0)", textColor: Color.green).frame(maxWidth: .infinity, maxHeight: 80.0).background(Color.blue).cornerRadius(8.0).shadow(color: Color.blue, radius: 2.0)
            }.frame(height: 80.0)
            Spacer(minLength: 10.0)
            HStack(spacing: 10.0) {
                
                GridView(title: "Deaths", subTitle: "\(country.deaths ?? 0)", textColor: Color.red).frame(maxWidth: .infinity, maxHeight: 80.0).background(Color.blue).cornerRadius(8.0).shadow(color: Color.blue, radius: 2.0)
                               
                               GridView(title: "Today's", subTitle: "\(country.todayCases ?? 0)", textColor: Color.black).frame(maxWidth: .infinity, maxHeight: 80.0).background(Color.blue).cornerRadius(8.0).shadow(color: Color.blue, radius: 2.0)
            }.frame(height: 80.0)
        }
        .frame(width: 200, height: 220)
        .padding()
        .background(Color.black)
        .cornerRadius(10)
        .alignmentGuide(HorizontalAlignment.center) { (_ ) -> CGFloat in
            10
        }
        .alignmentGuide(VerticalAlignment.center) { (_) -> CGFloat in
            10
        }
    }
}
