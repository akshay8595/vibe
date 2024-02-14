//
//  BusinessProfileHeaderView.swift
//  Vibe
//
//  Created by Akshay Bhasin on 1/14/24.
//

import SwiftUI


struct Tab {
    var icon: Image?
    var title: String
}

struct BusinessProfileHeaderView: View {
    
    var fixed = false
    var tabs: [Tab]
    var geoWidth: CGFloat
    @Binding var selectedTab: Int
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            ScrollViewReader { proxy in
                VStack(spacing: 0) {
                    HStack(spacing: 0) {
                        ForEach(0 ..< tabs.count, id: \.self) { row in
                            Button(action: {
                                withAnimation {
                                    selectedTab = row
                                }
                            }, label: {
                                ZStack {

                                    Rectangle().fill(selectedTab == row ? Color.selectedTabColor : Color.clear)
                                        .cornerRadius(10)
                                    
                                    VStack(spacing: 0) {
                                        
                                        HStack {
                                            Text(tabs[row].title)
                                                .font(Font.system(size: 16, weight: .regular))
                                                .foregroundColor(Color.themeColor)
                                                .padding(EdgeInsets(top: 10, leading: 3, bottom: 10, trailing: 15))
                                        }
                                        .frame(width: fixed ? (geoWidth / CGFloat(tabs.count)) : .none, height: 40)
                                        
                                        Rectangle().fill(selectedTab == row ? Color.red : Color.clear)
                                            .cornerRadius(10.0)
                                            .frame(height: 3)
                                    }
                                    
                                }
                                .fixedSize()
                            })
                            .id(row)
                            .accentColor(Color.white)
                            .buttonStyle(PlainButtonStyle())
                        }
                        .onChange(of: selectedTab, perform: { target  in
                            withAnimation {
                                proxy.scrollTo(target)
                            }
                        })
                    }
                    
                }
            }
            .frame(height: 55)
            .onAppear(perform: {
                UIScrollView.appearance().bounces = fixed ? false : true
            })
            .onDisappear(perform: {
                UIScrollView.appearance().bounces = true
            })
        }
    }
}
        



struct BusinessProfileHeaderView_Preview: PreviewProvider {
    static var previews: some View {

        BusinessProfileHeaderView(fixed: true,
                                  tabs: [.init(icon: Image(systemName: "star.fill"), title: "Tab 1"),
                                         .init(icon: Image(systemName: "star.fill"), title: "Tab 2"),
                                         .init(icon: Image(systemName: "star.fill"), title: "Tab 3")],
                                  geoWidth: 375,
                                  selectedTab: .constant(0))
        
    }
}

