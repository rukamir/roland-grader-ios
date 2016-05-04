//
//  Grades.swift
//  Roland Grader
//
//  Created by Jimmy Roland on 4/30/16.
//  Copyright © 2016 Jimmy Roland. All rights reserved.
//

import UIKit

class Grade {
    // MARK: Property
    var questions: Int
    var points: Int
    
    // MARK: Initilaizers
    init(questions: Int, points: Int) {
        self.questions = questions
        self.points = points
    }
}
