//
//  Landing.swift
//  Finenance
//
//  Created by BerMau on 2020-02-13.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI

class checkUser : ObservableObject{
    @Published var checked = false
}

struct Landing: View {
    
    
    @ObservedObject var check = checkUser();
    var body: some View {
        
        VStack{
        if(check.checked == false){
            LoginView(check:check)
        }else
        {
            MainSelection()
        }
        }
    }
}

struct LoginView : View
{
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Couple.entity(), sortDescriptors: [])var couples:FetchedResults<Couple>
    @ObservedObject var check = checkUser()
    @State private var nameA: String
    @State private var nameB: String
    
    var body: some View {
       
            VStack {
                //title
                Text("Finenance")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(Color.orange)
                    .multilineTextAlignment(.center)
                
                
                //if(couples.count<2)
                //{
                    //if there are no previous users or enough users in the system 
                    TextField("Person A",text: $nameA)
                        .multilineTextAlignment(.center)
                TextField("Person B", text: $nameB)
                        .multilineTextAlignment(.center)
                    Button(action: {
                        let newCoupleA = Couple(context: self.moc)
                        let newCoupleB = Couple(context: self.moc)
                        newCoupleA.name = self.nameA
                        newCoupleA.tab = 0
                        newCoupleB.name = self.nameB
                        newCoupleB.tab = 0
                        
                    }) {
                        Text("Next")
                }
                    
//                }else
//                {
//                    Text(couples[0].name ?? "Unknow")
//                        .font(.title)
//                        .fontWeight(.regular)
//                        .foregroundColor(Color.orange)
//
//                    Text(couples[1].name ?? "Unknow")
//                        .font(.title)
//                        .fontWeight(.regular)
//                        .foregroundColor(Color.orange)
//                    Button(action: {self.check.checked = true}) {
//                    Text("Start")
//                    }
//
//                }
                
        }
                
          
    }
}

struct Landing_Preview: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
