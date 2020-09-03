//
//  currencyField.swift
//  Finenance
//
//  Created by YuMing Zhang on 2020-09-03.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI
import Combine

struct currencyField: View {
    @Binding var amount:String
    var name:String
    
    var body: some View {
        TextField("How much did \(name) spend?", text:$amount)
        .textFieldStyle(PlainTextFieldStyle())
        .onReceive(Just(amount))
        {
            newValue in
            let filtered = newValue.filter{"0123456789.".contains($0)}
                if filtered != newValue
                {
                    self.amount = filtered
                }
    }
}
}


