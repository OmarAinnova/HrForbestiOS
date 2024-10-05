//
//  SplashViewModel.swift
//  Hr
//
//  Created by Omar Yousef on 06/09/2024.
//

import Foundation
import HrDataSource

class LoginViewModel : ObservableObject {
    
    var apiHandler = HrDataSource.Companion().create(withLog: true)
   
    @Published var isLoading = false
    @Published var user : LoginResponse? = nil
    
    func initKmm(){
        RequestData.Companion().create().setBaseUrl(url: "https://api.forbestjo.com/")
    }
    
    func login(data : LoginRequest, completion: @escaping () -> Void){
        initKmm()
        isLoading = true
        apiHandler.login(body: data){res, error  in
            DispatchQueue.main.async {
                self.isLoading = false
                if let data = res?.data {
                    let user = UserData(userId: data.userId, empNo: data.empNo, empName: data.empName, fingerprintNo: data.fingerprintNo, jobName: data.jobName, picture: data.picture)
                    UserDefaults.standard.saveCustomObject(user, forKey: Constants.UserDefaultsKeys.savedUser)
                    UserDefaults.standard.saveBool(true, forKey:  Constants.UserDefaultsKeys.isLoggedIn)
                    self.user = data
                    completion()
                }
            }
        }
    }
}
