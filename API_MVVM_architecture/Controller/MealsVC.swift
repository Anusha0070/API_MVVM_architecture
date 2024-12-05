//
//  MealsVC.swift
//  API_MVVM_architecture
//
//  Created by Anusha Raju on 12/5/24.
//

import UIKit

class MealsVC: UIViewController {

    @IBOutlet weak var mealsTableView: UITableView!
    
//    var meals: [Meal]?
    
    var mealViewModel = MealViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        mealsTableView.dataSource = self
        
        mealViewModel.onDataUpdated = { [weak self] in
            self?.mealsTableView.reloadData()
        }
        
        mealViewModel.fetchData()
        
    }

}

extension MealsVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return meals?.count ?? 0
        
        print(mealViewModel.meals.count)
        return mealViewModel.meals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? MyTableViewCell else {
            return UITableViewCell()
        }
        
        let mealsList = mealViewModel.meals[indexPath.row]
        
        cell.strMeal?.text = mealsList.strMeal
        
        return cell
    }
}
