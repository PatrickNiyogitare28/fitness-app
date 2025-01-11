//
//  WorkoutCard.swift
//  fitness-app
//
//  Created by Patrick Niyo on 11/01/2025.
//

import SwiftUI


struct WorkoutCard: View {
    @State var workout: Workout
    
    var body: some View {
        HStack{
            Image(systemName: workout.image)
                .resizable()
                .scaledToFit()
                .frame(width: 48, height: 48)
                .foregroundColor(workout.tinColor)
                .padding()
                .background(.gray.opacity(0.1))
                .cornerRadius(10)
            
            VStack(spacing: 16){
                HStack{
                    Text(workout.title)
                        .font(.title3)
                        .bold()
                    
                    Spacer()
                    
                    Text(workout.duration)
                }
                
                HStack{
                    Text(workout.date)
                    
                    Spacer()
                    
                    Text(workout.calories)
                }
            }
        }
    }
}

#Preview {
    WorkoutCard(workout: Workout(id: 1, title: "Running", image: "figure.run", duration: "25 mins", date: "Aug 4", calories: "423 kcal", tinColor: .cyan))
}
