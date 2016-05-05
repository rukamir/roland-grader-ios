//
//  ViewController.swift
//  Roland Grader
//
//  Created by Jimmy Roland on 4/28/16.
//  Copyright © 2016 Jimmy Roland. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    // MARK: Properties
    var grades = [Grade]()
    @IBOutlet weak var pointsTable: UITableView!
    @IBOutlet var numberOfQuestions: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        pointsTable.delegate = self
        pointsTable.dataSource = self
        numberOfQuestions.text = String(30);
        self.calculateNewGrades(30)
        self.becomeFirstResponder()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Helpers
    func setQuestionCountDisplayed(numberOfQs: Int) {
        //if let indexPath = tableView.index
        
        //for i in 0..<self.grades.count {
        
        
        //tableView.deleteRowsAtIndexPaths(NSIndexSet(index: i), withRowAnimation: .Delete)
        //}
        
        pointsTable.reloadData()
    }
    
    func calculateNewGrades(numberOfQs: Int) {
        var points = 0
        var grade: Grade
        
        for i in 1...numberOfQs {
            points = 100 - ((100 / numberOfQs) * i)
            grade = Grade(questions: i, points: points)
            
            grades += [grade]
        }
        print(grades.count)
    }
    
    // MARK: Gesture Recognizer
    @IBAction func updateQuestionTotal(sender: UISwipeGestureRecognizer) {
        print("Here")
        let currentVal = Int(self.numberOfQuestions.text!)
        
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.Left:
            self.numberOfQuestions.text = String(currentVal! + 1)
        case UISwipeGestureRecognizerDirection.Right:
            self.numberOfQuestions.text = String(currentVal! - 1)
        default:
            print("not valid input")
        }
    }
    
    // MARK: UITableViewDelegate
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return grades.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "GradesTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! GradesTableViewCell
        
        // Fetches the appropriate meal for the data source layout.
        let grade = grades[indexPath.row]
        
        cell.numOfQ.text = String(grade.questions)
        cell.gradePts.text = String(grade.points)
        
        return cell
    }

}

