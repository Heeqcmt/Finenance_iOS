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
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Couple.entity(), sortDescriptors: []) var couple : FetchedResults<Couple>;
    @ObservedObject var check = checkUser();
   
    @State var name = "";
    @State var CPname = "";
    
    var body: some View {
        
        VStack{
        if(check.checked == false){
            
            
            VStack {
                Text("Finenance")
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(Color.orange)
                    .multilineTextAlignment(.center)
                
                //check if there is a couple in the system
                if(couple.count<2)
                {
                        //if not ask user to input one
                    HStack {
                        TextField("Your name", text: $name)
                            .foregroundColor(Color.orange)
                            .multilineTextAlignment(.center)
                        
                        Button(action:{saveUser(userName: self.name,moc: self.moc)}) {
                        Text("Submit")
                        }
                    }
                    
                    HStack {
                        TextField("Your partner's name", text: $CPname)
                            .foregroundColor(Color.orange)
                            .multilineTextAlignment(.center)
                        
                        Button(action:{saveUser(userName: self.CPname,moc: self.moc)}) {
                        Text("Submit")
                        }
                    }
                    
                  
                    
                    
                    
                }
                //if yes display names
                else
                {
                    VStack {
                        Text(couple[0].name ?? "Unknow")
                            .foregroundColor(Color.orange)
                        Text(couple[1].name ?? "Unknow")
                            .foregroundColor(Color.orange)
                        
                        Button(action:{self.check.checked = true}) {
                        Text("Start")
                        }
                    }
                    
                }
                
                
                
                
            }
            
        }else{
            MainSelection()
        }
        }
    }

}

//save the user name
func saveUser (userName:String, moc : NSManagedObjectContext)
{
    let person = Couple(context:moc)
    person.name = userName
    person.tab = 0
    try? moc.save()
}


struct Landing_Preview: PreviewProvider {
    static var previews: some View {
        Landing()
    }
}
