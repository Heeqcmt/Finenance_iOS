//
//  Landing.swift
//  Finenance
//
//  Created by BerMau on 2020-02-13.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI

struct Landing: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Finenance")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                    .multilineTextAlignment(.center)
                Text("person one")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color.orange)
                
                Text("person two")
                    .font(.title)
                    .fontWeight(.regular)
                    .foregroundColor(Color.orange)
                
                NavigationLink("Start", destination: MainSelection())
                
            }
        }
    }
}

struct Landing_Preview: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
