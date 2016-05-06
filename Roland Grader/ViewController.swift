//
//  ViewController.swift
//  Roland Grader
//
//  Created by Jimmy Roland on 4/28/16.
//  Copyright © 2016 Jimmy Roland. All rights reserved.
//

import UIKit
import Foundation

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
        self.setQuestionCountDisplayed(25)
        self.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Helpers
    func setQuestionCountDisplayed(numberOfQs: Int) {
        self.numberOfQuestions.text = String(numberOfQs)
        grades.removeAll()
        self.calculateNewGrades(numberOfQs)
        pointsTable.reloadData()
    }
    
    func calculateNewGrades(numberOfQs: Int) {
        var points: Float = 0
        var grade: Grade
        let ptsPerQuestion: Float = (100 / Float(numberOfQs))
        
        for i in 1...numberOfQs {
            points = 100 - (ptsPerQuestion * Float(i))
            points = roundf(points)
            grade = Grade(questions: i, points: Int(points))
            grades += [grade]
        }
    }
    
    // MARK: Gesture Recognizer
    @IBAction func updateQuestionTotal(sender: UISwipeGestureRecognizer) {
        let currentVal = Int(self.numberOfQuestions.text!)
        
        switch sender.direction {
        case UISwipeGestureRecognizerDirection.Left:
            self.setQuestionCountDisplayed(currentVal! + 1)
        case UISwipeGestureRecognizerDirection.Right:
            self.setQuestionCountDisplayed(currentVal! - 1)
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

