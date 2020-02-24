//
//  MainSelection.swift
//  Finenance
//
//  Created by BerMau on 2020-02-17.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI

struct MainSelection: View {
    var body: some View {
        
        NavigationView{
        VStack {
            Text("Recent Spending")
                .font(.largeTitle)
                .fontWeight(.black)
                .frame(height:5)
                .padding(.top,-75)
                
            List {
            /*@START_MENU_TOKEN@*/ /*@PLACEHOLDER=Content@*/Text("Content")/*@END_MENU_TOKEN@*/
            }
                
            
            HStack(spacing: 100.0){
            
                
                
                NavigationLink("Tracking",destination: Tracking())
        
                NavigationLink("Summary", destination: Summary())
                        
                
            }.frame(height:100)
            
            
          
            
        }
        
    }
    }
}

struct MainSelection_Previews: PreviewProvider {
    static var previews: some View {
        MainSelection()
    }
}
