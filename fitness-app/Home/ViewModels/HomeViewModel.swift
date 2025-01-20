//
//  HomeViewModel.swift
//  fitness-app
//
//  Created by Patrick Niyo on 11/01/2025.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    let healthManager = HealthManager.shared
    
    @Published var calories: Int = 0
    @Published var active: Int = 0
    @Published var stand: Int = 0
    @Published var exercise: Int = 0
    
    var mockActivities = [
         Activity(id: 0, title: "Today steps", subtitle: "Goal 10,000", image: "figure.walk", tinColor: .green, amount: "9,500"),
        
         Activity(id: 1, title: "Today steps", subtitle: "Goal 10,000", image: "figure.walk", tinColor: .red, amount: "500"),
        
         Activity(id: 2, title: "Today steps", subtitle: "Goal 10,000", image: "figure.walk", tinColor: .blue, amount: "563"),
        
         Activity(id: 3, title: "Today steps", subtitle: "Goal 10,000", image: "figure.run", tinColor: .purple, amount: "6,334")
        
    ]
    
    var mockWorkouts = [
        Workout(id: 1, title: "Running", image: "figure.run", duration: "25 mins", date: "Aug 4", calories: "423 kcal", tinColor: .cyan),
        
        Workout(id: 2, title: "Strength Training", image: "figure.run", duration: "12 mins", date: "Aug 21", calories: "423 kcal", tinColor: .green),
        
        Workout(id: 3, title: "Walk", image: "figure.run", duration: "45 mins", date: "Oct 5", calories: "423 kcal", tinColor: .purple),
        
        Workout(id: 4, title: "Swimming", image: "figure.run", duration: "34 mins", date: "Sept 1", calories: "423 kcal", tinColor: .orange)
    ]
    
    init(){
        Task {
            do {
                try await healthManager.requestHealthKitAccess()
                fetchTodayCalories()
                fetchTodayExerciseTime()
                fetchTodayStandHours()
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchTodayCalories(){
        healthManager.fetchTodayCaloriesBurned { result in
         switch result {
         case .success(let calories):
             DispatchQueue.main.async {
                 self.calories = Int(calories)
             }
         case .failure(let _failure):
//                     print(failure.localizedDescription)
             print("An error occured in calories")
            }
        }
    }
    
    func fetchTodayExerciseTime(){
        healthManager.fetchTodayExerciseTime { result in
            switch result {
                case .success(let time):
                DispatchQueue.main.async {
                    self.exercise = Int(time)
                }
            case .failure(let _failure):
//                print(failure.localizedDescription)
                print("Error occured in excercise")
            }
        }
    }
    
    func fetchTodayStandHours(){
        healthManager.fetchTodayStandHours { result in
            switch result {
            case .success(let hours):
                DispatchQueue.main.async {
                    self.stand = Int(hours)
                }
            case .failure(let failure):
                print(failure.localizedDescription)
               }
        }
    }
    
}
