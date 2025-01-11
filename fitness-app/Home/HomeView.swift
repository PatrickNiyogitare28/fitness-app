//
//  HomeView.swift
//  fitness-app
//
//  Created by Patrick Niyo on 07/01/2025.
//

import SwiftUI

struct HomeView: View {
    @State var calories: Int = 123
    @State var active: Int = 123
    @State var stand: Int = 8
    
    @State var mockActivities = [
         Activity(id: 0, title: "Today steps", subtitle: "Goal 10,000", image: "figure.walk", tinColor: .green, amount: "9,500"),
        
         Activity(id: 1, title: "Today steps", subtitle: "Goal 10,000", image: "figure.walk", tinColor: .red, amount: "500"),
        
         Activity(id: 2, title: "Today steps", subtitle: "Goal 10,000", image: "figure.walk", tinColor: .blue, amount: "563"),
        
         Activity(id: 3, title: "Today steps", subtitle: "Goal 10,000", image: "figure.run", tinColor: .purple, amount: "6,334")
        
    ]
    
    @State var mockWorkouts = [
        Workout(id: 1, title: "Running", image: "figure.run", duration: "25 mins", date: "Aug 4", calories: "423 kcal", tinColor: .cyan),
        
        Workout(id: 2, title: "Strength Training", image: "figure.run", duration: "12 mins", date: "Aug 21", calories: "423 kcal", tinColor: .green),
        
        Workout(id: 3, title: "Walk", image: "figure.run", duration: "45 mins", date: "Oct 5", calories: "423 kcal", tinColor: .purple),
        
        Workout(id: 4, title: "Swimming", image: "figure.run", duration: "34 mins", date: "Sept 1", calories: "423 kcal", tinColor: .orange)
    ]
       
    var body: some View {
        NavigationStack {
            ScrollView(showsIndicators: false){
                VStack(alignment: .leading){
                    Text("Welcome")
                        .font(.largeTitle)
                        .padding()
                    
                    HStack{
                        Spacer()
                        VStack{
                            VStack(alignment: .leading, spacing:  8){
                                Text("Calories")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.red)
                                Text("123 Kcal")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading, spacing:  8){
                                Text("Active")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.green)
                                Text("52 mins")
                                    .bold()
                            }
                            .padding(.bottom)
                            
                            VStack(alignment: .leading, spacing:  8){
                                Text("Stand")
                                    .font(.callout)
                                    .bold()
                                    .foregroundColor(.blue)
                                Text("8 hours")
                                    .bold()
                            }
                            
                        }
                        Spacer()
                        
                        ZStack{
                            ProgressCircleView(progress: $calories, goal: 600, color: .red)
                            ProgressCircleView(progress: $active, goal: 60, color: .green)
                                .padding(.all, 20)
                            ProgressCircleView(progress: $stand, goal: 12, color: .blue)
                                .padding(.all, 40)
                        }
                        .padding(.horizontal)
                        Spacer()
                        
                    }
                    .padding()
                    
                    HStack{
                        Text("Fitness Activity")
                            .font(.title2)
                        
                        Spacer()
                        
                        Button{
                            print("Show more")
                        }
                        label : {
                            Text("Show more")
                                .padding(.all, 10)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                    }
                    .padding(.horizontal)
                    
                    LazyVGrid(columns: Array(repeating: GridItem(spacing: 20), count: 2)){
                        ForEach(mockActivities, id: \.id) { activity in
                            ActivityCard(activity: activity)
                        }
                    }
                    .padding(.horizontal)
                    
                    HStack{
                        Text("Recent Workouts")
                            .font(.title2)
                        
                        Spacer()
                        
                        NavigationLink{
                            EmptyView()
                        }
                        label : {
                            Text("Show more")
                                .padding(.all, 10)
                                .background(.blue)
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        
                    }
                    .padding(.horizontal)
                    .padding(.top)
                    
                    LazyVStack{
                        ForEach(mockWorkouts, id: \.id) { workout in
                            WorkoutCard(workout: workout)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.bottom)
                }
            }
        }
    }
}

#Preview {
    HomeView()
}
