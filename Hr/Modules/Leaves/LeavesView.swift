//
//  LeavesView.swift
//  Hr
//
//  Created by Omar Yousef on 10/09/2024.
//

import SwiftUI

struct LeavesView: View {
    
    @State  var selectedDate = Date()
    @State  var selectedStartTime = Date()
    @State  var selectedEndTime = Date()
    @State  var showAlert = false
    @State  var reason : String = ""
    @StateObject var viewModel = LeavesViewModel()
    
    var onSuccess : () -> Void
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading){
                Text("Date")
                
                DatePicker(
                    "Start Date", // This label will be hidden
                    selection: $selectedDate,
                    displayedComponents: [.date]
                )
                
                .labelsHidden() // Hide the default label
                .padding(10) // Inner padding around the DatePicker
                .frame(maxWidth: .infinity,alignment: .leading)
                .cornerRadius(10) // Rounded corners
                .overlay( // Optional: Overlay for a border effect
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("primary"), lineWidth: 1) // Use your primary color for stroke
                )
                
                Spacer().frame(height: 24)
                
                
                Text("Start of leave")
                
                DatePicker(
                    "Start Date", // This label will be hidden
                    selection: $selectedStartTime,
                    displayedComponents: [.hourAndMinute]
                )
                
                .labelsHidden() // Hide the default label
                .padding(10) // Inner padding around the DatePicker
                .frame(maxWidth: .infinity,alignment: .leading)
                .cornerRadius(10) // Rounded corners
                .overlay( // Optional: Overlay for a border effect
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("primary"), lineWidth: 1) // Use your primary color for stroke
                )
                
                Spacer().frame(height: 24)
                
                
                Text("End of leave")
                
                DatePicker(
                    "Start Date", // This label will be hidden
                    selection: $selectedEndTime,
                    displayedComponents: [.hourAndMinute]
                )
                
                .labelsHidden() // Hide the default label
                .padding(10) // Inner padding around the DatePicker
                .frame(maxWidth: .infinity,alignment: .leading)
                .cornerRadius(10) // Rounded corners
                .overlay( // Optional: Overlay for a border effect
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("primary"), lineWidth: 1) // Use your primary color for stroke
                )
                
                Spacer().frame(height: 24)
                
                Text("Reason")
                
                TextField("Reason", text: $reason)
                    .padding(10) // Inner padding around the DatePicker
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .cornerRadius(10) // Rounded corners
                    .overlay( // Optional: Overlay for a border effect
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color("primary"), lineWidth: 1) // Use your primary color for stroke
                    )
                
                
                
                Spacer()
                
                
                Button(action: {
                    viewModel.addLeave(selectedDate: selectedDate, startTime: selectedStartTime, endTime: selectedEndTime, reason: reason) {
                        showAlert = true
                    }
                }, label: {
                    Text("Submit Request")
                        .frame(maxWidth: .infinity)
                        .padding(4)
                }) .buttonStyle(.borderedProminent)
                    .tint(Color("primary"))
                    .cornerRadius(10)
                
                
                Spacer()
                
                
            }.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .padding(.horizontal)
            
            // Loading indicator
            if viewModel.isLoading {
                LoadingView()
            }
        }
        .alert(isPresented: $showAlert) {
            Alert(
                title: Text("Success"),
                message: Text("Cool"), // Use alertMessage for dynamic content
                dismissButton: .default(Text("OK")) {
                    // Additional actions when dismissing, if needed
                    onSuccess()
                }
            )
        }
        
        
    }
}

//#Preview {
//    LeavesView(selectedDate: {}, onSuccess: <#() -> Void#>)
//}
