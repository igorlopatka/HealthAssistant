//
//  HealthAssistantApp.swift
//  HealthAssistant
//
//  Created by Igor Łopatka on 04/09/2023.
//

import SwiftUI
import HealthKit

@main
struct HealthkitIntegrationApp: App {
    
    private let healthStore: HKHealthStore
    
    init() {
        guard HKHealthStore.isHealthDataAvailable() else {  fatalError("This app requires a device that supports HealthKit") }
        healthStore = HKHealthStore()
        requestHealthkitPermissions()
    }
    
    
    private func requestHealthkitPermissions() {
        let sampleTypesToShare = Set([
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
        ])
        
        let sampleTypesToRead = Set([
            HKObjectType.quantityType(forIdentifier: .heartRate)!,
            HKObjectType.quantityType(forIdentifier: .stepCount)!,
            HKObjectType.categoryType(forIdentifier: .sleepAnalysis)!,
        ])
        
        healthStore.requestAuthorization(toShare: sampleTypesToShare, read: sampleTypesToRead) { (success, error) in
            print("Request Authorization -- Success: ", success, " Error: ", error ?? "nil")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(healthStore)
        }
    }
}

extension HKHealthStore: ObservableObject{}
