//
//  Untitled.swift
//  Hr
//
//  Created by Omar Yousef on 04/10/2024.
//
import SwiftUI


// Function to extract the day from the date
func getDay(date: Date) -> Int {
    let calendar = Calendar.current
    return calendar.component(.day, from: date)
}

// Function to extract the month from the date
func getMonth(date: Date) -> Int {
    let calendar = Calendar.current
    return calendar.component(.month, from: date)
}

// Function to extract the year from the date
func getYear(date: Date) -> Int {
    let calendar = Calendar.current
    return calendar.component(.year, from: date)
}

// Function to get the hour in 24-hour format
func getHour(date: Date) -> Int {
    let calendar = Calendar.current
    return calendar.component(.hour, from: date)
}

// Function to get the minute
func getMinute(date: Date) -> Int {
    let calendar = Calendar.current
    return calendar.component(.minute, from: date)
}
