// Sarah Paetsch 4/15/16
// Soccer League Coordinator Project
// Treehouse iOS Techdegree

// Manually create a single collection that contains all information for all 18 players. Each player should themselves be represented by their own collection.

// Array of dictionaries. Each dictionary stores data for one player. Array stores all player dictionaries.
let allPlayers : [[ String:String ]] = [
    ["name": "Joe Smith", "height": "42", "experience": "YES", "guardians": "Jim and Jan Smith"],
    ["name": "Jill Tanner", "height": "36", "experience": "YES", "guardians" : "Clara Tanner"],
    ["name": "Bill Bon", "height": "43", "experience": "YES", "guardians" : "Sara and Jenny Bon"],
    ["name": "Eva Gordon", "height": "45", "experience": "NO", "guardians" : "Wendy and Mike Gordon"],
    ["name": "Matt Gill", "height": "40", "experience": "NO", "guardians" : "Charles and Sylvia Gill"],
    ["name": "Kimmy Stein", "height": "41", "experience": "NO", "guardians" : "Bill and Hillary Stein"],
    ["name": "Sammy Adams", "height": "45", "experience": "NO", "guardians" : "Jeff Adams"],
    ["name": "Karl Saygan", "height": "42", "experience": "YES", "guardians" : "Heather Bledsoe"],
    ["name": "Suzane Greenberg", "height": "44", "experience": "YES", "guardians" : "Henrietta Dumas"],
    ["name": "Sal Dali", "height": "41", "experience": "NO", "guardians" : "Gala Dali"],
    ["name": "Joe Kavalier", "height": "39", "experience": "NO", "guardians" : "Sam and Elaine Kavalier"],
    ["name": "Ben Finkelstein", "height": "44", "experience": "NO", "guardians" : "Aaron and Jill Finkelstein"],
    ["name": "Diego Soto", "height": "41", "experience": "YES", "guardians" : "Robin and Sarika Soto"],
    ["name": "Chloe Alaska", "height": "47", "experience": "NO", "guardians" : "David and Jamie Alaska"],
    ["name": "Arnold Willis", "height": "43", "experience": "NO", "guardians" : "Claire Willis"],
    ["name": "Phillip Helm", "height": "44", "experience": "YES", "guardians" : "Thomas Helm and Eva Jones"],
    ["name": "Les Clay", "height": "42", "experience": "YES", "guardians" : "Wynonna Brown"],
    ["name": "Herschel Krustofski", "height": "45", "experience": "YES", "guardians" : "Hyman and Rachel Krustofski"]
]

// Create appropriate variables and logic to sort and store players into three teams: Sharks, Dragons and Raptors. Be sure that your logic results in all teams having the same number of experienced players on each.

// Arrays for dividing players based on whether they are experienced
var expPlayers : [[String:String]] = []
var otherPlayers : [[String:String]] = []

// Team arrays
var sharks : [[String:String]] = []
var dragons : [[String:String]] = []
var raptors : [[String:String]] = []

// Divide players into two arrays based on whether they are experienced
for current in allPlayers {
    if (current["experience"] == "YES") {
        expPlayers.append(current)
    } else {
        otherPlayers.append(current)
    }
}

// function takes an array of players and evenly divides its players among the three teams
func dividePlayers(origin: [[String:String]]) {
    var num = 0
    while num < origin.count {
        sharks.append(origin[num])
        dragons.append(origin[num+1])
        raptors.append(origin[num+2])
        num = num + 3
    }
}

// call dividePlayers() on the experienced and inexperienced player arrays to divide them evenly among the three teams
dividePlayers(otherPlayers)
dividePlayers(expPlayers)

// Provide logic that prints a personalized letter to the guardians specifying: the player’s name, guardians' names, team name, and date/time of their first team practice. The letters should be visible when code is placed in a XCode Playground or run in an XCode project.

// function takes team array, team name, and date of first game as arguments
// generates letters to guardians with necessary info
func writeLetters(teamArr: [[String:String]], team: String, gameTime:String, gameDate: String){
    for player in teamArr {
        let name = player["name"]!
        let guardians = player["guardians"]!
        print("Dear \(guardians),\n  This letter is to notify you that your child, \(name), has been assigned to the \(team) soccer team. The first game of the season will be at \(gameTime) on \(gameDate).\n See you then!\n The Super Awesome Soccer League \n")
    }
}

// call writeLetters() for each of the three teams
writeLetters(sharks, team: "Sharks", gameTime: "3pm", gameDate: "March 17")
writeLetters(raptors, team: "Raptors", gameTime: "1pm", gameDate: "March 18")
writeLetters(dragons, team: "Dragons", gameTime: "1pm", gameDate: "March 17")


// Bonus: Logic to ensure that each team's average height is within 1.5 inches of the others as well as having each team contain the same number of experienced players.

// I did not solve the sorting problem, but I did manage to create the logic for determining whether the three teams meet the requirement.

// function takes a team array and returns its average height
func findAvgHeight(team: [[String:String]]) -> Double {
    var htSum  = 0.0
    for current in team {
        htSum += Double(current["height"]!)!
    }
    return htSum / Double(team.count)
}

// function takes two team arrays and a range Double value as arguments
// determines whether the average heights for each team have a difference less than range
// returns Bool
func compareHtAvg(team1: [[String:String]], team2: [[String:String]], range: Double ) -> Bool {
    if (abs(findAvgHeight(team1) - findAvgHeight(team2)) <= range){
        return true
    }
    return false
}

compareHtAvg(sharks, team2: raptors, range: 1.5)
compareHtAvg(raptors, team2: dragons, range: 1.5)
compareHtAvg(sharks, team2: dragons, range: 1.5)



