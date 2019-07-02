//
//  NoticesListView.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 7/1/19.
//  Copyright © 2019 MattWyskiel. All rights reserved.
//

import SwiftUI

struct NoticesListView : View {
    let noticesList: [Notice]
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    ForEach(self.noticesList.identified(by: \.name)) { notice in
                        NoticeView(notice: notice)
                        .frame(width: geometry.size.width)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Licenses"))
    }
}

#if DEBUG

var list = [Notice(name: "LicensesKit", url: URL(string: "https://github.com/mattwyskiel/LicensesKit")!, copyright: "Copyright (C) 2016 Matthew Wyskiel", license: ApacheSoftwareLicense20), Notice(name: "StringBuilder", url: URL(string: "https://github.com/mattwyskiel/StringBuilder")!, copyright: "Copyright (C) 2016 Matthew Wyskiel", license: ApacheSoftwareLicense20)]

struct NoticesListView_Previews : PreviewProvider {
    static var previews: some View {
        NavigationView {
            NoticesListView(noticesList: list)
            
        }
    }
}
#endif
