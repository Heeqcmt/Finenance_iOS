//
//  Summary.swift
//  Finenance
//
//  Created by BerMau on 2020-02-17.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI

struct Summary: View {
    
    @FetchRequest(entity: Couple.entity(), sortDescriptors: []) var couples : FetchedResults<Couple>
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
        }
   
    }
    
}

struct Summary_Previews: PreviewProvider {
    static var previews: some View {
        Summary()
    }
}
