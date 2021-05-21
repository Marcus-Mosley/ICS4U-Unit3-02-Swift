//
// ContentView.swift
// ICS4U-Unit3-02-Swift
//
// Created by Marcus A. Mosley on 2021-05-21
// Copyright (C) 2021 Marcus A. Mosley. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var num = ""
    @State private var factorial: Int = 0
    @State private var showingAlert = false

    var body: some View {
        VStack {
            TextField("Enter an integer:", text: $num)
                .padding()
            Button("Enter", action: {
                if Int(num) == nil || Int(num)! <= 0 {
                    showingAlert = true
                } else {
                    factorial = recFactorial(Int(num)!)
                }
            }).padding().alert(isPresented: $showingAlert) {
                Alert(title: Text("Important Message"), message: Text("Not Valid Input"),
                      dismissButton: .default(Text("Got It!")))
            }
            Text("\(String(factorial)) is the factorial of \(num).")
        }
    }

    // Uses recursion to output the reversed string
    func recFactorial(_ num: Int) -> Int {

        if num == 1 {
            return num
        } else {
            return num * recFactorial(num - 1)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
