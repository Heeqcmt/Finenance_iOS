//
//  MainSelection.swift
//  Finenance
//
//  Created by BerMau on 2020-02-17.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI

struct MainSelection: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: SpentItems.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath:\SpentItems.date, ascending:false)]) var items : FetchedResults<SpentItems>
    
    var body: some View {
        
        NavigationView{
            
            VStack{
                List{
                    
                    ForEach(items, id:\.id)
                    {
                        item in
                        Text(item.desc ?? "Unknow")
                            
                        
                        
                        
                    }
                    
                
                }
                
                
                NavigationLink("Tracking", destination: Tracking())
                
                Button(action:{
                    let newItem = SpentItems(context:self.moc)
                    newItem.id = UUID()
                    newItem.desc = "testing1"
                    newItem.cost = "1234"
                    newItem.paidBy = "me"
                    newItem.date = Date()
                    
                    try? self.moc.save()
                })
                {
                    Text("Tester")
                }
                
                
                           
            }.navigationBarTitle(Text("Expanses"))
            
           
        }
        
    }
}



struct MainSelection_Previews: PreviewProvider {
    static var previews: some View {
        MainSelection()
    }
}
