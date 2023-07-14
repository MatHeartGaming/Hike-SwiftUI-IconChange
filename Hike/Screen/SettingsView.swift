//
//  SettingsView.swift
//  Hike
//
//  Created by Matteo Buompastore on 13/07/23.
//

import SwiftUI

struct SettingsView: View {
    
    //MARK: - Properties
    private let alternateAppIcons = ["AppIcon-Backpack", "AppIcon-Camera", "AppIcon-Campfire", "AppIcon-MagnifyingGlass", "AppIcon-Map", "AppIcon-Mushroom"]
    
    var body: some View {
        List {
            //MARK: - SECTION HEADER
            Section {
                HStack(alignment: .center) {
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        Text("Editor's choice")
                            .fontWeight(.medium)
                    }
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(
                    LinearGradient(colors: [.customGreenLight, .customGreenMedium, .customGreenDark], startPoint: .top, endPoint: .bottom)
                )
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gorgeous in photos but is even better once you're actually there. The hike that you hope to do again someday. \nFind the best hikes in the app.")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! It's time for a walk.")
                        .fontWeight(.heavy)
                        .foregroundColor(.customGreenMedium)
                }
                .multilineTextAlignment(.center)
                .padding(.bottom)
                .frame(maxWidth: .infinity)
            }//: Header
            .listRowSeparator(.hidden)
            
            //MARK: - SECTION ICONS
            Section {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons, id: \.self) { icon in
                            Button {
                                UIApplication.shared.setAlternateIconName(icon) {error in
                                    if error != nil {
                                        print("Failed to request icon \(icon)")
                                        return
                                    }
                                    print("Icon changed to \(icon)")
                                }
                            } label: {
                                Image("\(icon)-Preview")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                            .buttonStyle(.borderless)
                        }
                    }
                    
                }//: SCROLLVIEW
                .padding(.top, 12)
                
                Text("Choose your favorite app icon from the collection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundColor(.secondary)
                    .font(.footnote)
                    .padding(.top, 12)
            } header: {
                Text("Alternate Icons")
            }//: SECTION
            .listRowSeparator(.hidden)
            
            
            
            //MARK: - SECTION ABOUT
            Section {
                //1. Basic Labeled Content
                //LabeledContent("Application", value: "Hike")
                
                //2. Advanced Labeled Content
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "HIKE", rowTintColor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "iOS, iPadOS", rowTintColor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "SWIFT", rowTintColor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintColor: .purple)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Mat Buompy", rowTintColor: .mint)
                
                CustomListRowView(rowLabel: "Designer", rowIcon: "paintpalette", rowContent: "Mat Buompy", rowTintColor: .pink)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowContent: nil, rowTintColor: .indigo, rowLinkLabel: "Credo Academy", rowLinkDestination: "https://credo.academy")
                
                
                
            } header: {
                Text("ABOUT THE APP")
            } footer: {
                HStack(alignment: .center) {
                    Text("Copyright All right reserved")
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 8)
            }//: SECTION
            
            
            
            
        }//: LIST
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
