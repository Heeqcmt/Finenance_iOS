//
//  titleText.swift
//  Finenance
//
//  Created by BerMau on 2020-07-14.
//  Copyright © 2020 BerMau. All rights reserved.
//

import SwiftUI

struct titleText: View {
    var text : String;
    var body: some View {
        Text(text)
            .fontWeight(.bold)
            .foregroundColor(.orange)
            .font(.largeTitle)
    }
}

struct titleText_Previews: PreviewProvider {
    static var previews: some View {
        titleText(text:"title")
    }
}
