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
                    HStack{
                        Text("Item").frame(maxWidth:.infinity)
                        Text("Amount").frame(maxWidth:.infinity)
                        Text("Paid By").frame(maxWidth:.infinity)
                                
                    }
                    
                    ForEach(items, id:\.id)
                    {
                        item in
                        HStack{
                            Text(item.desc ?? "Unknow").frame(maxWidth:.infinity)
                            Text(item.cost ?? "Unknow").frame(maxWidth:.infinity)
                            Text(item.paidBy ?? "Unknow").frame(maxWidth:.infinity)
                        
                        }
                        
                    }
                    
                
                }
                
                HStack{
                    NavigationLink(destination: Tracking())
                    {
                        button(name:"Tracking")
                            .frame(maxWidth:.infinity)
                    }
                    NavigationLink(destination:Summary())
                    {
                        button(name:"Summary")
                            .frame(maxWidth:.infinity)
                    }
                }
                
                
                           
            }.navigationBarTitle(Text("Expenses"))
            
           
        }
        
    }
}



   #if DEBUG
struct MainSelection_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return MainSelection().environment(\.managedObjectContext, context)
    }
}
#endif
