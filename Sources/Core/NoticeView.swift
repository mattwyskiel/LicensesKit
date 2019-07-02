//
//  NoticeView.swift
//  LicensesKit
//
//  Created by Matthew Wyskiel on 7/1/19.
//  Copyright © 2019 MattWyskiel. All rights reserved.
//

import SwiftUI

public struct NoticeView : View {
    
    let notice: Notice
    
    public var body: some View {
        VStack(alignment: .leading) {
            Text(notice.name)
            .padding([.top, .leading, .trailing])
            .font(.title)
            
            Text(notice.url.absoluteString)
            .padding(.horizontal)
            .font(.subheadline)
            
            LicenseView()
            
        }
    
    }
    
}

#if DEBUG
/*
 {
 "name": "LicensesKit",
 "url": "https://github.com/mattwyskiel/LicensesKit",
 "copyright": "Copyright (C) 2016 Matthew Wyskiel",
 "license": "Apache Software License 2.0"
 },
 */
var notice = Notice(name: "LicensesKit", url: URL(string: "https://github.com/mattwyskiel/LicensesKit")!, copyright: "Copyright (C) 2016 Matthew Wyskiel", license: ApacheSoftwareLicense20)

struct NoticeView_Previews : PreviewProvider {
    static var previews: some View {
        NoticeView(notice: notice)
    }
}
#endif

struct LicenseView : View {
    private let backgroundColor = Color(red: 190.0/255, green: 190.0/255, blue: 190.0/255)

    var body: some View {
        return ZStack{
            Text(notice.license.summaryText!)
                .font(.custom("Courier", size: 10))
                .lineLimit(nil)
                .padding()
        }
            .background(backgroundColor)
    }
}
