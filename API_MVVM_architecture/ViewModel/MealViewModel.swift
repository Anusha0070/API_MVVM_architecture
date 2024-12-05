//
//  MealViewModel.swift
//  API_MVVM_architecture
//
//  Created by Anusha Raju on 12/5/24.
////
//
import Foundation

class MealViewModel {
    var meals: [Meal] = []
    
    
    var onDataUpdated: (() -> Void)?
    
    func fetchData(){
        
        let url: String = "https://www.themealdb.com/api/json/v1/1/search.php?f=s"
        
        Network.instance.fetchMealsData(from: url){ [weak self] (data: Meals) in
            DispatchQueue.main.async{
                self?.meals = data.meals
                self?.onDataUpdated?()

            }

        }
        
    }
}
