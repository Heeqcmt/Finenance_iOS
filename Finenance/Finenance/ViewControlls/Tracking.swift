//
//  Tracking.swift
//  Finenance
//
//  Created by BerMau on 2020-02-14.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI

struct Tracking: View {
    var body: some View {
        NavigationView{
            VStack {
                       Text("Tracking")
                       TextField("name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                       TextField("amount", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                       TextField("Catagory", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                   HStack {
                                  Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                                  Text("Track")
                                  }
            }
            
           
            }
        }
            
    }
}

struct Tracking_Previews: PreviewProvider {
    static var previews: some View {
        Tracking()
    }
}
