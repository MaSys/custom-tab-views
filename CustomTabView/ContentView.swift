//
//  ContentView.swift
//  CustomTabView
//
//  Created by Yaser Almasri on 16/03/21.
//

import SwiftUI

struct ContentView: View {

    @State var index = 0

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                if self.index == 0 {
                    Color.black.opacity(0.05).edgesIgnoringSafeArea(.top)
                } else if self.index == 1 {
                    Color.red.edgesIgnoringSafeArea(.top)
                } else if self.index == 2 {
                    Color.green.edgesIgnoringSafeArea(.top)
                } else if self.index == 3 {
                    Color.blue.edgesIgnoringSafeArea(.top)
                }
            }
            .padding(.bottom, -35)

            CustomTabs(index: self.$index)
        }
        .background(Color.black.opacity(0.05).edgesIgnoringSafeArea(.top))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CustomTabs: View {

    @Binding var index: Int

    var body: some View {
        HStack {

            Button(action: {
                self.index = 0
            }, label: {
                Image(systemName: "house")
                    .imageScale(.large)
            })
            .foregroundColor(Color.black.opacity(self.index == 0 ? 1 : 0.2))

            Spacer(minLength: 0)

            Button(action: {
                self.index = 1
            }, label: {
                Image(systemName: "magnifyingglass")
                    .imageScale(.large)
            })
            .foregroundColor(Color.black.opacity(self.index == 1 ? 1 : 0.2))
            .offset(x: 10)

            Spacer(minLength: 0)

            Button(action: {

            }, label: {
                Image(systemName: "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
            })
            .offset(y: -25)

            Spacer(minLength: 0)

            Button(action: {
                self.index = 2
            }, label: {
                Image(systemName: "heart")
                    .imageScale(.large)
            })
            .foregroundColor(Color.black.opacity(self.index == 2 ? 1 : 0.2))
            .offset(x: -10)

            Spacer(minLength: 0)

            Button(action: {
                self.index = 3
            }, label: {
                Image(systemName: "person")
                    .imageScale(.large)
            })
            .foregroundColor(Color.black.opacity(self.index == 3 ? 1 : 0.2))

        }
        .padding(.horizontal, 35)
        .padding(.top, 35)
        .background(Color.white)
        .clipShape(CShape())
    }
}


struct CShape: Shape {
    func path (in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 35))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 35))

            path.addArc(
                center: CGPoint(x: (rect.width / 2) + 4, y: 35),
                radius: 35,
                startAngle: .zero,
                endAngle: .init(degrees: 180),
                clockwise: true
            )
        }
    }
}
