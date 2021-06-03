//
//  SettingsRowView.swift
//  FRUCTUS
//
//  Created by JJ Santos on 03/06/21.
//

import SwiftUI

struct SettingsRowView: View {
    
    // MARK: - PROPERTIES
    
    var name: String
    var content: String? = nil
    var linkLabel: String? = nil
    var linkDestination: String? = nil //Might not exist so we initialize it as an optional
    
    var body: some View {
        VStack {
            
            // Add a divider for each row
            Divider().padding(.vertical, 4)
            
            HStack {
                Text(name).foregroundColor(Color.gray)
                Spacer()
                // Safe unwrapping
                if (content != nil) {
                    Text(content!)
                } else if (linkLabel != nil && linkDestination != nil)
                {
                    Link(linkLabel!, destination: URL(string: "https://\(linkDestination!)")!)
                    Image(systemName: "arrow.up.right.square")
                        .foregroundColor(.pink)
                } else  {
            
                    EmptyView()
                }
            }
        }
    }
}

// MARK: - MULTIPLE PREVIEWS

struct SettingsRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SettingsRowView(name: "Developer", content: "JJ")
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
            SettingsRowView(name: "Website", linkLabel: "Masterclass", linkDestination: "masterclass.com")
                .preferredColorScheme(.dark)
                .previewLayout(.fixed(width: 375, height: 60))
                .padding()
        }
    }
}


