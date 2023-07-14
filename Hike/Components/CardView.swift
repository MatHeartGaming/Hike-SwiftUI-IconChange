//
//  CardView.swift
//  Hike
//
//  Created by Matteo Buompastore on 13/07/23.
//

import SwiftUI

struct CardView: View {
    
    //MARK: - Properties
    @State private var imageNumber : Int = 1
    @State private var randomNumber  : Int = 1
    @State private var isShowingSheet  = false
    
    //MARK: - Functions
    private func randomImage() {
        //withAnimation(.easeOut(duration: 0.4)) {
            repeat {
                randomNumber = Int.random(in: 1...5)
            } while(randomNumber == imageNumber)
            imageNumber = randomNumber
        //}
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            VStack {
                //MARK: - Header
                VStack(alignment: .leading) {
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(colors: [
                                    .customGrayLight,
                                    .customGrayMedium],
                                               startPoint: .top,
                                               endPoint: .bottom)
                        )
                        
                        Spacer()
                        
                        Button {
                            isShowingSheet.toggle()
                        } label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }

                        
                    }//: HStack
                    
                    Text("Fun and enjoyable outdoor activities for friends and families")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//: Header
                .padding(.horizontal, 30)
                
                //MARK: - Main Content
                
                
                ZStack {
                     CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut, value: imageNumber)
                }
                
                //MARK: - Footer
                Button {
                    //Generate a random number
                    randomImage()
                } label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom)
                        )
                        .shadow(color: .black.opacity(0.25), radius: 0.25, x: 1, y: 2)
                }
                .buttonStyle(GradientButton())
                
            }//: VSTACK
        }//: ZStack - Card
        .frame(width: 320, height: 570)
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView()
    }
}
