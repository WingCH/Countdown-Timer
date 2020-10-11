//
//  ContentView.swift
//  Countdown Timer
//
//  Created by CHAN Hong Wing on 11/10/2020.
//

import SwiftUI

struct ContentView: View {
    @State var currentDate = Date()
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            Text("\(currentDate)")
                .font(Font.system(size: 34.0))
                .fontWeight(.semibold)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16.0)
                .padding(.vertical, 12.0)
                .frame(width: 360.0, height: 320.0, alignment: .topLeading)
                .onReceive(timer) { input in
                    self.currentDate = input
                }
            
            Button(action: {
                NSApplication.shared.terminate(self)
            })
            {
                Text("Quit App")
                    .font(.caption)
                    .fontWeight(.semibold)
            }
            .padding(.trailing, 16.0)
            .frame(width: 360.0, alignment: .trailing)
        }
        .padding(0)
        .frame(width: 360.0, height: 360.0, alignment: .top)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
