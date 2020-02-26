//
//  Tracking.swift
//  Finenance
//
//  Created by BerMau on 2020-02-14.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI

class LineItem : ObservableObject
{
    
}


struct Tracking: View {
    
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Couple.entity(), sortDescriptors: []) var couple : FetchedResults<Couple>
    @State private var description = ""
    @State private var amount = ""
    @State private var paidBy = 0
    @State private var isSplit = false
    @State private var tabAmount = ""
   
    
    var body: some View {
        
       
            Form{
                
                TextField("What did you spend the money on", text: $description)
                    .textFieldStyle(PlainTextFieldStyle())
                TextField("How much did you spend?", text:$amount)
                    .textFieldStyle(PlainTextFieldStyle())
                Picker(selection: $paidBy, label: Text("Who paid for it")) {
                    ForEach(0..<couple.count)
                    {
                        Text(self.couple[$0].name ?? "Unknow").tag($0)
                    }
                }
                
                Toggle(isOn: $isSplit)
                {
                    Text("Spliting the bill?")
                    
                }

                if isSplit
                {





                    if (paidBy == 1)
                    {
                        HStack{
                        TextField("how much is " + (couple[0].name ?? "Unknow") + " paying", text: $tabAmount)
                            .textFieldStyle(PlainTextFieldStyle())
                        Button(action: {
                            let oldTab = Decimal(string :self.couple[0].tab ?? "0") ?? 0
                            let newTab = Decimal(string :self.tabAmount ) ?? 0
                            let total = oldTab + newTab
                            self.couple[0].tab = "\(total)"
                            
                            try? self.moc.save()
                        }) {
                        Text("Track Tab")
                        }
                        }


                    }else
                    {
                        HStack{
                        TextField("how much is " + (couple[1].name ?? "Unknow") + " paying", text: $tabAmount)
                            .textFieldStyle(PlainTextFieldStyle())
                        Button(action: {
                             let oldTab = Decimal(string :self.couple[1].tab ?? "0") ?? 0
                                                       let newTab = Decimal(string :self.tabAmount ) ?? 0
                                                       let total = oldTab + newTab
                                                       self.couple[1].tab = "\(total)"
                            
                            try? self.moc.save()
                            
                        }) {
                        Text("Track Tab")
                        }
                        }
                    }
                    
                    
                    
                }
                
                
                Button(action: {
                    let lineItem = SpentItems(context:self.moc)
                    lineItem.desc = self.description
                    lineItem.cost = self.amount
                    lineItem.paidBy = self.couple[self.paidBy].name ?? "Unknow"
                    lineItem.date = Date()
                    lineItem.id = UUID()
                    try? self.moc.save()
                    self.mode.wrappedValue.dismiss()
                    
                    
                }) {
                               Text("Track Purchase")
                               
                               }
               
            }.navigationBarTitle(Text("Tracking Expense"))
            
        
        
      
        }
    }


   #if DEBUG
struct Tracking_Previews: PreviewProvider {
    static var previews: some View {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        return Tracking().environment(\.managedObjectContext, context)
    }
}
#endif
