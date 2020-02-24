//
//  Landing.swift
//  Finenance
//
//  Created by BerMau on 2020-02-13.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI
import CoreData

class checkUser : ObservableObject{
    @Published var checked = false
}


struct Landing: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: User.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \User.name, ascending: true)]) var users: FetchedResults<User>
    
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
    @ObservedObject var check = checkUser();
    var body: some View {
       
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
                
                Button(action: {self.check.checked = true}) {
                Text("Start")
                }
        }
                
          
    }
}

struct Landing_Preview: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
