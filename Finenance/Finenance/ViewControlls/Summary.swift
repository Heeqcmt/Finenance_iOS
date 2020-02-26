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
                ForEach (couples, id: \.id)
                {
                    cp in
                    HStack{
                        Text(cp.name ?? "unknown" )
                        Text(cp.tab ?? "unknow")
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
                    Text("Reset")
                }
                
                
        }.navigationBarTitle(Text("Tab Summary"))
   
    }
    
}





struct Summary_Previews: PreviewProvider {
    static var previews: some View {
        Summary()
    }
}
