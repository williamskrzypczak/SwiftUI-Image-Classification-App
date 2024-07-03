//
//  ContentView.swift
//  Image_Class_SUI
//
//  Created by Bill Skrzypczak on 6/2/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ContentViewModel()
    
    var body: some View {
        VStack {
            //Prediction Type
            HStack{
                Text("Prediction: ")
                
                Text(viewModel.prediction)
                //Bottom Of Hstack
            }
            
            //Confidence Level
            HStack{
                
                Text("Confidence: ")
                
                Text(viewModel.confidence)
                
                //Bottom Of Hstack
            }
            
            
            //Camera Preview that the app uses to display previews
            CameraPreview(session: viewModel.session)
                .onAppear{
                    //ENSURE CODE IS RAN IN BACKGROUND
                    DispatchQueue.global().async {
                        self.viewModel.setupSession()
                    }
                    
                }
            
            
            
            
        }
        .background(
            Image(.BDV)
                .resizable()
                .scaledToFit()
                .ignoresSafeArea()
        )
    }
}

#Preview {
    ContentView()
}



