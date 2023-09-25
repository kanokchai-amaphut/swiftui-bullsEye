//
//  Game.swift
//  Bullseye
//
//  Created by Kanokchai Amaphut on 10/1/2566 BE.
//

import Foundation

struct LeaderboardEntry {
    let score: Int
    let date: Date
}

struct Game {
    var target: Int = Int.random(in: 1...100)
    var score: Int = 0
    var round: Int = 1
    var leaderboardEntries: [LeaderboardEntry] = []
    
    init(loadTestData: Bool = false) {
        leaderboardEntries.append(LeaderboardEntry(score: 100, date: Date()))
        leaderboardEntries.append(LeaderboardEntry(score: 87, date: Date()))
        leaderboardEntries.append(LeaderboardEntry(score: 80, date: Date()))
        leaderboardEntries.append(LeaderboardEntry(score: 70, date: Date()))
        leaderboardEntries.append(LeaderboardEntry(score: 40, date: Date()))
    }
    
    func points(sliderValue: Int) -> Int {
        let difference: Int = abs(self.target - sliderValue)
        let bonus: Int
        if difference == 0 {
            bonus = 100
        } else if difference <= 2 {
            bonus = 50
        } else {
            bonus = 0
        }
        return 100 - difference + bonus
    }
    
    mutating func addToLeaderboard(points: Int) {
        leaderboardEntries.append(LeaderboardEntry(score: points, date: Date()))
        leaderboardEntries.sort { $0.score > $1.score }
    }
    
    mutating func startNewRound(points: Int) {
        score += points
        round += 1
        target = Int.random(in: 1...100)
        addToLeaderboard(points: points)
    }
    
    mutating func restart() {
        score = 0
        round = 1
        target = Int.random(in: 1...100)
    }
}
