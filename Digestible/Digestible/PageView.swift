//
//  PageView.swift
//  Digestible
//
//  Created by Athul Rajagopal on 2020-08-18.
//  Copyright © 2020 DigestLabs. All rights reserved.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @State var currentPage = 0

    init(_ views: [Page]) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage)
            PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                .padding(.bottom, 100)
        }
    }
}

struct PageView_Previews: PreviewProvider {
    static var previews: some View {
        PageViewer()
            .overlay(RoundedRectangle(cornerRadius: 10).stroke())
            .padding(5)
    }
}
