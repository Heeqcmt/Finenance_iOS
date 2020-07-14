//
//  button.swift
//  Finenance
//
//  Created by BerMau on 2020-07-04.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI

struct button: View {
    
    var name:String
    var body: some View {
        Text(name)
        .fontWeight(.heavy)
        .padding(5)
        .background(Color.orange)
        .cornerRadius(40)
        .foregroundColor(.white)
        .frame(height:.some(25))
        .padding(10)
        .overlay(
            RoundedRectangle(cornerRadius: 40)
                .stroke(Color.orange, lineWidth: 5)
            
        )
        
    
    
    }
}

struct button_Previews: PreviewProvider {
    static var previews: some View {
        
        button(name: "Name")
    }
}
