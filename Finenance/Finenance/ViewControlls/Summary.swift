//
//  Summary.swift
//  Finenance
//
//  Created by BerMau on 2020-02-17.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI

struct Summary: View {
    var body: some View {
        
        GeometryReader{ metrics in
        NavigationView{
        VStack
            {
                Text("Spending Summary")
                    .font(.largeTitle)
                    .frame(height: metrics.size.height*0.15)
                    .offset(y:-50)
                    
                    
                List {
                /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
                }.frame( height: metrics.size.height*0.6 )
                    .offset(y:-100)
                    
                HStack(spacing:100){
                    NavigationLink("Home",destination: Landing())
                        .navigationBarBackButtonHidden(true)
                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                Text("Reset")
                }.frame(height: metrics.size.height*0.15)
                    
                }
        }
    }
    }
    }
}

struct Summary_Previews: PreviewProvider {
    static var previews: some View {
        Summary()
    }
}
