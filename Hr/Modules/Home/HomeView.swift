//
//  HomeView.swift
//  Hr
//
//  Created by Omar Yousef on 06/09/2024.
//

import SwiftUI

struct HomeView: View {
    
    var onItemClicked : (Destination) -> Void
    var onLogoutClicked : () -> Void
    
    let items = [
        TableItemModel(id: .checkInOutScreen,text: "Check In/Out", icon: "star.fill", backgroundColor: Color.pink),
        TableItemModel(id: .vacationsScreen ,text: "Vacation Request", icon: "star.fill", backgroundColor: Color.green),
        TableItemModel(id: .leavesScreen, text: "Leave Request", icon: "star.fill", backgroundColor: Color("primary"))]
    
    let columns: [GridItem] = [GridItem(.adaptive(minimum: 100))]
    
    @StateObject var viewModel = HomeViewModel()
    
    @State private var isMenuOpen = false
    
    @EnvironmentObject var languageManager: LanguageManager
    
    var body: some View {
        
        GeometryReader { geometry in
            
            ZStack {
                
                VStack(spacing: 0) {
                    // Your content here
                    
                    Spacer().frame(height: 70.0)
                    
                    
                    HStack(alignment: .top) {
                        
                        Image(systemName: "line.horizontal.3")
                            .frame(width: 20,height: 20)
                            .padding(.all ,8) // Padding around the icon
                            .background(Color.white) // Background color
                            .clipShape(Circle()) // Rounded shape
                            .padding(.horizontal)
                            .onTapGesture {
                                withAnimation {
                                    isMenuOpen.toggle()
                                }
                            }
                        
                        Spacer()
                        
                        AsyncImage(url: URL(string: viewModel.image)) { image in
                            image
                                .resizable()
                                .scaledToFit()  // Keeps the entire image within the frame, no cropping
                                .frame(width: 80, height: 80)
                                .background(Color.white)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .contentShape(Circle())
                            
                            
                        } placeholder: {
                            // Placeholder view while the image is loading
                            Image(systemName: "person.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80)
                                .clipShape(Circle())
                                .overlay(Circle().stroke(Color.white, lineWidth: 2))
                                .foregroundColor(.white)
                        }
                        
                        Spacer()
                        
                        Image(systemName: "bell") // Notification icon
                            .frame(width: 20,height: 20)
                            .padding(.all ,8) // Padding around the icon
                            .background(Color.white) // Background color
                            .clipShape(Circle()) // Rounded shape
                            .padding(.horizontal)
                    }
                    
                    
                    
                    
                    Text(viewModel.empName)
                        .foregroundColor(Color.white)
                        .padding(.top)
                        .font(.title)
                        .bold()
                    
                    Text(viewModel.jobName)
                        .foregroundColor(Color.white)
                    
                    Spacer().frame(height: 50.0)
                    
                    HStack(spacing: 16) {
                        // Dynamically create TableItems using ForEach
                        ForEach(items, id: \.id) { item in
                            TableItemView(
                                text: item.text,
                                icon: item.icon,
                                backgroundColor: item.backgroundColor,
                                onItemClicked: {onItemClicked(item.id)}
                            )
                            .frame(maxWidth: .infinity) // Each item takes equal space
                        }
                    }
                    .padding()
                    .frame(maxWidth: .infinity) // Max width for the entire HStack
                    .background(Color.white) // White background
                    .cornerRadius(12) // Rounded corners
                    .padding(.horizontal) // Outer padding
                    
                    Spacer().frame(height: 50.0)
                    
                    ScrollView {
                        LazyVGrid(columns: columns, spacing: 15, content: {
                            TableItemWithBackgroundView(text: "Hi", icon: "star.fill", backgroundColor: .cyan)
                            TableItemWithBackgroundView(text: "Hi", icon: "star.fill", backgroundColor: .cyan)
                            TableItemWithBackgroundView(text: "Hi", icon: "star.fill", backgroundColor: .cyan)
                            TableItemWithBackgroundView(text: "Hi", icon: "star.fill", backgroundColor: .cyan)
                            TableItemWithBackgroundView(text: "Hi", icon: "star.fill", backgroundColor: .cyan)
                            TableItemWithBackgroundView(text: "Hi", icon: "star.fill", backgroundColor: .cyan)
                        })
                    }.frame(height: 250)
                    
                    Spacer()
                    
                }
                .frame(width: geometry.size.width, height: geometry.size.height,alignment: Alignment.top) // Fill the entire screen
                .background(
                    VStack(spacing: 0) {
                        Color("primary")
                            .frame(height: geometry.size.height * 1.2 / 3) // 1.25/3 height is primary color
                        Color("background")
                            .frame(height: geometry.size.height * 1.8 / 3) // 2/3 height is white
                    }
                )
            }
            
            // Overlay to close the menu
            if isMenuOpen {
                Color.black.opacity(0.1)
                    .onTapGesture {
                        withAnimation {
                            isMenuOpen = false
                        }
                    }
                    .edgesIgnoringSafeArea(.all)
            }
            
            // Side menu
            if isMenuOpen {
                SideMenu(isMenuOpen: $isMenuOpen,onChangeLanguage: {languageManager.toggleLanguage()},onLogoutClicked: onLogoutClicked)
                    .transition(.move(edge: .leading))
            }
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}


struct SideMenu: View {
    @Binding var isMenuOpen: Bool
    var onChangeLanguage : () -> Void
    var onLogoutClicked : () -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Spacer().frame(height: 70.0)
            
            SideMenuItem(id : 0 ,icon: "person.circle", title: "My Profile",onItemClicked: {_ in isMenuOpen = false})
            SideMenuItem(id : 1 ,icon: "bag", title: "My Requests",onItemClicked: {_ in isMenuOpen = false})
            SideMenuItem(id : 3 ,icon: "bubble.left.and.bubble.right", title: "Suggestions and Complaints",onItemClicked: {_ in isMenuOpen = false})
            SideMenuItem(id : 4 ,icon: "lock", title: "Change Password",onItemClicked: {_ in isMenuOpen = false})
            SideMenuItem(id : 5 ,icon: "globe", title: "Language",onItemClicked: {_ in isMenuOpen = false
                
                onChangeLanguage()})
            SideMenuItem(id : 6 ,icon: "arrow.right.square", title: "Logout",onItemClicked: {_ in isMenuOpen = false
                onLogoutClicked()})
            
            Spacer()
        }
        .frame(width: 350)
        .background(Color.white)
        .cornerRadius(20) // Set corner radius
    }
}

struct SideMenuItem : View{
    
    let id : Int
    let icon : String
    let title : LocalizedStringKey
    var onItemClicked : (Int) -> Void
    @Environment(\.layoutDirection) var layoutDirection
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: icon)
                    .foregroundColor(Color("primary"))
                
                Text(title)
            
                Spacer()
                
                Image(systemName: "arrow.right")
                    .rotationEffect(.degrees(layoutDirection == .rightToLeft ? 180 : 0))
                    .foregroundColor(Color("primary"))
                
            }.frame(maxWidth: .infinity, alignment: .leading)
            
            Rectangle()
                .fill(Color("primary")) // Color and opacity
                .frame(height: 1) // Height of the line
        }   .padding(.horizontal , 16 )
            .padding(.vertical, 8)
            .contentShape(Rectangle()) // Make the entire VStack tappable
            .onTapGesture {
                onItemClicked(id)
            }
        
    }
    
}


#Preview {
    SideMenuItem(id : 0 ,icon: "bell", title: "Profile",onItemClicked: {_ in })
}

#Preview {
    HomeView(onItemClicked: {_ in }, onLogoutClicked: {})
}




