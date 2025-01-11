//
//  HomeViewModel.swift
//  fitness-app
//
//  Created by Patrick Niyo on 11/01/2025.
//

import SwiftUI

class HomeViewModel: ObservableObject {
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
    
    var calories: Int = 123
    var active: Int = 54
    var stand: Int = 8
}
