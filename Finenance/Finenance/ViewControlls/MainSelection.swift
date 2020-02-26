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
                        HStack{
                            Text(item.desc ?? "Unknow")
                            Text(item.cost ?? "Unknow")
                            Text(item.paidBy ?? "Unknow")
                        
                        }
                        
                    }
                    
                
                }
                
                HStack{
                NavigationLink("Tracking", destination: Tracking())
                    NavigationLink("Summary", destination:Summary())
                }
                
                
                           
            }.navigationBarTitle(Text("Expanses"))
            
           
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
