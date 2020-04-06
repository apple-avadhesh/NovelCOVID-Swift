
//
//  CountryCell.swift
//  NovelCOVID
//
//  Created by Developer Bully on 05/04/20.
//  Copyright © 2020 Avadhesh. All rights reserved.
//

import SwiftUI
import KingfisherSwiftUI


struct CountryCell: View {
    
    var country: CountryModel
    
    //    var body: some View {
    //
    //     VStack(spacing: 0.0) {
    //
    //     HStack(){
    //
    //     //MARK: Flag View
    //     KFImage(URL(string: "\(self.country.countryInfo?.flag ?? "")")!).resizable()
    //     .aspectRatio(contentMode: .fit)
    //     .frame(width: 50, height: 50, alignment: .center)
    //     .shadow(radius: 10)
    //     .padding(.leading, -14.0)
    //
    //     VStack{
    //     Text(country.country!)
    //     .font(.title)
    //     .fontWeight(.semibold)
    //     }
    //     }.padding()
    //
    //     //            HStack(spacing: 10.0) {
    //     //
    //     //                Button(action: {}) {
    //     //                    Image(systemName: "text.alignleft")
    //     //                        .padding(.horizontal, 10.0)
    //     //                        .padding(.vertical, 40.0)
    //     //                        .background(Color.green)
    //     //                        .cornerRadius(4)
    //     //                    .frame(minWidth: 0, maxWidth: .infinity)
    //     //                }.frame(minWidth: 100, maxWidth: .infinity)
    //     //                Button(action: {}) {
    //     //                    Image(systemName: "text.aligncenter")
    //     //                        .padding(.horizontal, 10.0)
    //     //                        .padding(.vertical, 40.0)
    //     //                        .background(Color.green)
    //     //                        .cornerRadius(4)
    //     //                    .frame(minWidth: 0, maxWidth: .infinity)
    //     //
    //     //                }.frame(minWidth: 100, maxWidth: .infinity)
    //     //                Button(action: {}) {
    //     //                    Image(systemName: "text.aligncenter")
    //     //                        .padding(.horizontal, 10.0)
    //     //                        .padding(.vertical, 40.0)
    //     //                        .background(Color.green)
    //     //                        .cornerRadius(4)
    //     //                    .frame(minWidth: 0, maxWidth: .infinity)
    //     //
    //     //                }.frame(minWidth: 100, maxWidth: .infinity)
    //     //                Button(action: {}) {
    //     //                    Image(systemName: "text.alignright")
    //     //                        .padding(.horizontal, 10.0)
    //     //                        .padding(.vertical, 40.0)
    //     //                        .background(Color.green)
    //     //                        .cornerRadius(4)
    //     //                    .frame(minWidth: 0, maxWidth: .infinity)
    //     //                }.frame(minWidth: 100, maxWidth: .infinity)
    //     //            }.frame(maxWidth: .infinity, maxHeight: .infinity)
    //     }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .topLeading)
    //     }
    
    
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

                GridView(title: "Cases", subTitle: "\(country.cases ?? 0)").frame(maxWidth: .infinity, maxHeight: 80.0).background(Color.blue).cornerRadius(8.0).shadow(color: Color.blue, radius: 2.0)
                
                GridView(title: "Recovered", subTitle: "\(country.recovered ?? 0)").frame(maxWidth: .infinity, maxHeight: 80.0).background(Color.blue).cornerRadius(8.0).shadow(color: Color.blue, radius: 2.0)
                
                GridView(title: "Deaths", subTitle: "\(country.deaths ?? 0)").frame(maxWidth: .infinity, maxHeight: 80.0).background(Color.blue).cornerRadius(8.0).shadow(color: Color.blue, radius: 2.0)
                
                GridView(title: "Today's", subTitle: "\(country.todayCases ?? 0)").frame(maxWidth: .infinity, maxHeight: 80.0).background(Color.blue).cornerRadius(8.0).shadow(color: Color.blue, radius: 2.0)

            }.frame(height: 80.0)
        }
    }
}


// MARK: GridVew
struct GridView: View {
    var title: String
    var subTitle: String
    
    var body: some View {
        
        VStack {
            Text("\(title)").fontWeight(.semibold)
            
            Text("\(subTitle)").fontWeight(.medium)
        }
    }
}

