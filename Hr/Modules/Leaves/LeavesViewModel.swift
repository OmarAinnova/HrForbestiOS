//
//  SplashViewModel.swift
//  Hr
//
//  Created by Omar Yousef on 06/09/2024.
//

import Foundation
import HrDataSource

class LeavesViewModel : ObservableObject {
    
    var apiHandler = HrDataSource.Companion().create(withLog: true)
    
    @Published var isLoading = false

    func addLeave(selectedDate: Date, startTime: Date, endTime: Date, reason: String, completion: @escaping () -> Void){
        
        let date = ExtKt.formatLocalDate(year: Int32(getYear(date: selectedDate)), month: Int32(getMonth(date: selectedDate)), day: Int32(getDay(date: selectedDate)), format: "yyyy-MM-dd")
        
        let start = ExtKt.formatLocalDateTime(year: Int32(getYear(date: selectedDate)), month: Int32(getMonth(date: selectedDate)), day: Int32(getDay(date: selectedDate)),
                                                  hour: Int32(getHour(date: startTime)), minute: Int32(getMinute(date: startTime)), second: 0, format: "dd-MM-yyyy hh:mm:ssaa")
        
        let end = ExtKt.formatLocalDateTime(year: Int32(getYear(date: selectedDate)), month: Int32(getMonth(date: selectedDate)), day: Int32(getDay(date: selectedDate)),
                                                  hour: Int32(getHour(date: endTime)), minute: Int32(getMinute(date: endTime)), second: 0, format: "dd-MM-yyyy hh:mm:ssaa")
        
        let data  = LeaveOrderRequest(empNo: "1", eDate: date, dateFrom: start, dateTo: end, eComment: reason)
        
        isLoading = true
        apiHandler.addLeaveOrder(body : data){res , error in
            DispatchQueue.main.async {
                self.isLoading = false
                if let data = res?.data {
                    completion()
                }
            }
        }
        
        
    }
}
