//
//  Model.swift
//  productivity hero
//
//  Created by Дарья on 10.11.2020.
//

import Foundation

struct Hero {
    var health: Float
    var defence: Float
    var strength: Float
    var mana: Float}

struct Task {
    let title: String
    let healthEffect: Float
    let defenceEffect: Float
    let strengthEffect: Float
    let manaEffect: Float
}

struct List {
    var title: String
    var tasks: [String]
}


struct TestData {
    static var health = List(title: "Health", tasks: ["take vitamins", "drink water", "eat a salad"])
    static var study = List(title: "Study", tasks: ["finish assignment", "prepare for a test","do homework"])
    static var exersize = List(title: "Exersize", tasks: ["workout", "stretch", "walk", "run"])
    static var mental = List(title: "Mental", tasks: ["read a book", "meditate"])
}



struct List2 {
    var title: String
    var tasks: [Task]
}

struct TestData2 {
    static var health = List2(title: "Health", tasks: [Task(title: "take vitamins", healthEffect: 0.2, defenceEffect: 0.1, strengthEffect: 0.1, manaEffect: 0.0), Task(title: "drink water", healthEffect: 0.1, defenceEffect: 0.0, strengthEffect: 0.1, manaEffect: 0.0), Task(title: "eat a salad", healthEffect: 0.2, defenceEffect: 0.1, strengthEffect: 0.1, manaEffect: 0.0)])
    static var study = List2(title: "Study", tasks: [Task(title: "finish assignment", healthEffect: 0.0, defenceEffect: 0.0, strengthEffect: 0.0, manaEffect: 0.3), Task(title: "prepare for a test", healthEffect: 0.0, defenceEffect: 0.1, strengthEffect: 0.0, manaEffect: 0.2), Task(title: "do homework", healthEffect: 0.0, defenceEffect: 0.0, strengthEffect: 0.0, manaEffect: 0.1)])
    static var exersize = List2(title: "Exersize", tasks: [Task(title: "workout", healthEffect: 0.1, defenceEffect: 0.1, strengthEffect: 0.2, manaEffect: 0.0), Task(title: "stretch", healthEffect: 0.0, defenceEffect: 0.1, strengthEffect: 0.1, manaEffect: 0.0), Task(title: "walk", healthEffect: 0.1, defenceEffect: 0.0, strengthEffect: 0.1, manaEffect: 0.0), Task(title: "run", healthEffect: 0.1, defenceEffect: 0.0, strengthEffect: 0.2, manaEffect: 0.0)])
    static var mental = List2(title: "Mental", tasks: [Task(title: "read a book", healthEffect: 0.0, defenceEffect: 0.0, strengthEffect: 0.0, manaEffect: 0.2), Task(title: "meditate", healthEffect: 0.1, defenceEffect: 0.1, strengthEffect: 0.1, manaEffect: 0.4)])
}
