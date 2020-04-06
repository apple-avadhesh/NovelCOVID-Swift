
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
    
    var body: some View {
        HStack{
            KFImage(URL(string: "\(self.country.countryInfo?.flag ?? "")")!).resizable()
                .aspectRatio(contentMode: .fit)
            .frame(width: 50, height: 50, alignment: .center)
//            .clipShape(Circle())
            .shadow(radius: 10)
            
            VStack(alignment: .leading){
                Text(country.country!)
                    .font(.title)
                    .fontWeight(.semibold)
                Text("\(country.cases!)")
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                
            }
        }.padding()
        
    }
}
