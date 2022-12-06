//
//  SettingsView.swift
//  Fructus
//
//  Created by David Owen on 12/5/22.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @AppStorage("isOnboarding") var isOnboarding: Bool = false
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 20) {
                    //MARK: - Section 1
                    GroupBox {
                        Divider()
                            .padding(.vertical, 4)
                        HStack(alignment: .center, spacing: 10) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 80, height: 80)
                                .cornerRadius(9)
                            Text("Most fruits are naturally low in fat, sodium and calories. None have cholesterol. Fruits are sources of many essential nutrients, including potassium, dietary fiber, vitamins and much more.")
                                .font(.footnote)
                        }
                    } label: {
                        SettingsLabelView(labelText: "Fructus", labelImage: "info.circle")
                    }

                    //MARK: - Section 2
                    GroupBox {
                        Divider()
                            .padding(.vertical, 4)
                        Text("If you wish you can restart the application by toggling the switch in this box. That way it starts the onboarding process and you will see the welcome screen again.")
                            .padding(.vertical, 8)
                            .frame(minHeight: 60)
                            .layoutPriority(1)
                            .font(.footnote)
                            .multilineTextAlignment(.leading)
                        Toggle(isOn: $isOnboarding) {
                            if isOnboarding {
                                Text("Restarted".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.green)
                            } else {
                                Text("Restart".uppercased())
                                    .fontWeight(.bold)
                                    .foregroundColor(.secondary)
                            }
                        }
                        .padding()
                        .background(
                            Color(uiColor: .tertiarySystemBackground)
                                .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                        )
                            
                        
                    } label: {
                        SettingsLabelView(labelText: "Customization", labelImage: "paintbrush")
                    }


                    
                    //MARK: - Section 3
                    GroupBox {
                        SettingsRowView(name: "Developer", content: "John / Jane")
                        SettingsRowView(name: "Designer", content: "Robert Petras")
                        SettingsRowView(name: "Compatibility", content: "iOS 14")
                        SettingsRowView(name: "Website", linkLabel: "SwiftUI Masterclass", linkDestination: "swiftuimasterclass.com")
                        SettingsRowView(name: "Twitter", linkLabel: "@RobertPetras", linkDestination: "twitter.com/robertpetras")
                        SettingsRowView(name: "SwiftUI", content: "2.0")
                        SettingsRowView(name: "Version", content: "1.1.0")
                    } label: {
                        SettingsLabelView(labelText: "Application", labelImage: "apps.iphone")
                    }
                    
                    
                }//: VStack
            }//: Scroll View
            .padding()
            .navigationTitle("Settings")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "xmark")
                }
            }
        }//: Navigation View
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
