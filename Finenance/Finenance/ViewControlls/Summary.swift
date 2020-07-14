//
//  Summary.swift
//  Finenance
//
//  Created by BerMau on 2020-02-17.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI

struct Summary: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Couple.entity(), sortDescriptors: []) var couples : FetchedResults<Couple>
    @FetchRequest(entity: SpentItems.entity(),sortDescriptors:[]) var items : FetchedResults<SpentItems>
    var body: some View {
        VStack
            {
                List{
                    
                    HStack
                        {
                            Text("Name").frame(maxWidth:.infinity)
                            Text("Owning").frame(maxWidth:.infinity)
                    }
                ForEach (couples, id: \.id)
                {
                    cp in
                    HStack{
                        Text(cp.name ?? "unknown").frame(maxWidth:.infinity)
                        Text(cp.tab ?? "unknow").frame(maxWidth:.infinity)
                    }
                }
                }
                
                Button(action:{
                    
                    for item in self.items
                    {
                        self.moc.delete(item)
                    }
                    
                    for couple in self.couples
                    {
                        couple.tab = ""
                    }
                    
                    try? self.moc.save()
                    
                })
                {
                    button(name:"reset")
                }
                
                
        }.navigationBarTitle(Text("Tab Summary"))
   
    }
    
}





struct Summary_Previews: PreviewProvider {
    static var previews: some View {
         let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
               return Summary().environment(\.managedObjectContext, context)
    }
}
