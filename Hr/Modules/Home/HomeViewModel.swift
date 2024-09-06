//
//  HomeViewModel.swift
//  Hr
//
//  Created by Omar Yousef on 20/09/2024.
//

import Foundation


class HomeViewModel : ObservableObject {
    
    @Published var empName = ""
    @Published var jobName = ""
    @Published var image = ""
    
    // Initializer
    init() {
        // Call getUser to initialize empName and jobName
        getUser()
    }
    
    // Function to get user data from UserDefaults
    func getUser() {
        let userData = UserDefaults.standard.getCustomObject(forKey: Constants.UserDefaultsKeys.savedUser, objectType: UserData.self)
        empName = userData?.empName ?? ""
        jobName = userData?.jobName ?? ""
        image = userData?.picture ?? ""
    }
}
