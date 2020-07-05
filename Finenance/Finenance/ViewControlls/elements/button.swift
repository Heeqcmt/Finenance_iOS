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
        .fontWeight(.bold)
    
        .padding()
        .background(Color.orange)
        .cornerRadius(5)
        .foregroundColor(.white)
        .padding(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(Color.orange, lineWidth: 5)
        )
    
    
    }
}

struct button_Previews: PreviewProvider {
    static var previews: some View {
        
        button(name: "Name")
    }
}
