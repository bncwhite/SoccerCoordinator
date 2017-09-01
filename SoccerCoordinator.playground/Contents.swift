//Create all the players
let player1 : [String : String] = ["Name" : "Joe Smith", "Height" : "42", "Soccer Experience" : "YES", "Guardian Name(s)" : "Jim and Jan Smith"]
let player2 : [String : String] = ["Name" : "Jill Tanner", "Height" : "36", "Soccer Experience" : "YES", "Guardian Name(s)" : "Clara Tanner"]
let player3 : [String: String] = ["Name" : "Bill Bon", "Height" : "43", "Soccer Experience" : "YES", "Guardian Name(s)" : "Sara and Jenny Bon"]
let player4 : [String : String] = ["Name" : "Eva Gordon", "Height" : "45", "Soccer Experience" : "NO", "Guardian Name(s)" : "Wendy and Mike Gordon"]
let player5 : [String: String] = ["Name" : "Matt Gill", "Height" : "40", "Soccer Experience" : "NO", "Guardian Name(s)" : "Charles and Sylvia Gill"]
let player6 : [String : String] = ["Name" : "Kimmy Stein", "Height" : "41", "Soccer Experience" : "NO", "Guardian Name(s)" : "Bill and Hillary Stein"]
let player7 : [String : String] = ["Name" : "Sammy Adams", "Height" : "45", "Soccer Experience" : "NO", "Guardian Name(s)" : "Jeff Adams"]
let player8 : [String : String] = ["Name" : "Karl Saygan", "Height" : "42", "Soccer Experience" : "YES", "Guardian Name(s)" : "Heather Bledsoe"]
let player9 : [String : String] = ["Name" : "Suzane Greenberg", "Height" : "44", "Soccer Experience" : "YES", "Guardian Name(s)" : "Henrietta Dumas"]
let player10 : [String : String] = ["Name" : "Sal Dali", "Height" : "41", "Soccer Experience" : "NO", "Guardian Name(s)" : "Gala Dali"]
let player11 : [String : String] = ["Name" : "Joe Kavalier", "Height" : "39", "Soccer Experience" : "NO", "Guardian Name(s)" : "Sam and Elaine Kavalier"]
let player12 : [String : String] = ["Name" : "Ben Finkelstein", "Height" : "44", "Soccer Experience" : "NO", "Guardian Name(s)" : "Aaron and Jill Finkelstein"]
let player13 : [String : String] = ["Name" : "Diego Soto", "Height" : "41", "Soccer Experience" : "YES", "Guardian Name(s)" : "Robin and Sarika Soto"]
let player14 : [String : String] = ["Name" : "Chloe Alaska", "Height" : "47", "Soccer Experience" : "NO", "Guardian Name(s)" : "David and Jamie Alaska"]
let player15 : [String : String] = ["Name" : "Arnold Willis", "Height" : "43", "Soccer Experience" : "NO", "Guardian Name(s)" : "Claire Willis"]
let player16 : [String : String] = ["Name" : "Phillip Helm", "Height" : "44", "Soccer Experience" : "YES", "Guardian Name(s)" : "Thomas Helm and Eva Jones"]
let player17 : [String : String] = ["Name" : "Les Clay", "Height" : "42", "Soccer Experience" : "YES", "Guardian Name(s)" : "Wynonna Brown"]
let player18 : [String : String] = ["Name" : "Herschel Krustofski", "Height" : "45", "Soccer Experience" : "YES", "Guardian Name(s)" : "Hyman and Rachel Krustofski"]

//Single collection of all players
var players = [player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12, player13, player14, player15, player16, player17, player18]

//Each soccer team
var teamSharks: [[String : String]] = []
var teamDragons: [[String : String]] = []
var teamRaptors: [[String : String]] = []

//Create variables and an array to hold the total height of each team
var teamHeights: [String : Int] = [:]
var sharksTotalHeight = 0
var dragonsTotalHeight = 0
var raptorsTotalHeight = 0

//Update each player's information in the players collection
func updateChildInfo(withChild child: [String: String])
{
    //loop through the players until a player's name matches the child name
    for playerIndex in 0..<players.count {
        let player = players[playerIndex]
        let playerName = player ["Name"]
        
        //When a match is found, replace the old object with updated data
        if playerName == child["Name"]!
        {
            //"update" the player in the array by removing the old object and replacing it with the new data
            players.remove(at: playerIndex)
            players.append(child)
        }
    }
}

//Add players to the three teams
func addPlayers(toTeam group: [[String: String]])
{
    //Add players to the teams evenly
    for var child in group
    {
        let childHeight = Int(child["Height"]!)!
        
        //Check if the Sharks fewer players than the Dragons, add the player to the team if that is true
        //Or if the total height of the Sharks is less than or equal to the other teams' height
        //then add the player
        if teamSharks.count < teamDragons.count || (sharksTotalHeight <= dragonsTotalHeight && dragonsTotalHeight <= raptorsTotalHeight)
        {
            //Add to the total team height
            sharksTotalHeight += childHeight
            
            //Add team information to the player
            child["Team"] = "The Sharks"
            child["Practice Date"] = "March 17th"
            child["Practice Time"] = "3pm"
            
            //Assign the player to the Sharks
            teamSharks.append(child)
        }
            
        //Check if the Dragons fewer players than the Raptors, add the player to the team if that is true
        //Or if the total height of the Dragons is less than or equal to the other teams' height
        //then add the player
        else if teamDragons.count < teamRaptors.count || (dragonsTotalHeight < raptorsTotalHeight && dragonsTotalHeight < sharksTotalHeight)
        {
            //Add to the total team height
            dragonsTotalHeight += childHeight
            
            //Add team information to the player
            child["Team"] = "The Dragons"
            child["Practice Date"] = "March 17th"
            child["Practice Time"] = "1pm"
            
            //Assign the player to the Sharks
            teamDragons.append(child)
        }
            
            //The player didn't make it onto the other two teams so he will be assigned to the awesome team name of Raptors
        else
        {
            //Add to the total team height
            raptorsTotalHeight += childHeight
            
            //Add team information to the player
            child["Team"] = "The Raptors"
            child["Practice Date"] = "March 18th"
            child["Practice Time"] = "1pm"
            
            //Assign the player to the Sharks
            teamRaptors.append(child)
        }
        //Update the child's information in the players collection
        updateChildInfo(withChild: child)
    }
}

//Divide the players by whether or not they have soccer experience
func dividePlayersByExperience()
{
    //Temporary arrays to sort players based on their experience
    var returningPlayers: [[String: String]] = []
    var newPlayers: [[String: String]] = []
    
    //Split the players into two temporary teams of returning and new players so that the experienced players can be distributed evenly to the teams.
    //For each player in the players collection
    for player in players
    {
        //Put all the experienced players in one corner and the newbies in a separate corner
        if player["Soccer Experience"]! == "YES"
        {
            returningPlayers.append(player)
        }
        else
        {
            newPlayers.append(player)
        }
    }
    
    //Add all the players to teams, first by new players then returning players
    let allPlayers = [newPlayers, returningPlayers]

    //Assign the new players to teams first.
    //Once the new players are assigned, then assign the experienced players
    for playerGroup in allPlayers
    {
        addPlayers(toTeam: playerGroup)
    }
}

//Create the soccer teams for the season
func createTeams()
{
    //Separate the players based on if they've played soccer already
    dividePlayersByExperience()
    
    //Send the letters to the guardians
    sendLetters()
    
    //Print the average height of each team
    printHeightAverages()
}

//Contact the player's guardian(s) and inform them of their team selection as well as practice time.
func sendLetters()
{
    //Loop through all the players and send their guardian(s) letters informing them of their child's team name and when to meet for soccer practice
    for player in players
    {
        //Create the letter and interpolate the player's information into the template.
                    print("Hello \(player["Guardian Name(s)"]!),\n\n  The yellow card has been thrown down!!! It's my pleasure to inform you that \(player["Name"]!) is assigned to play for (drumroll please...)\n\n  \(player["Team"]!)!\n\n  The team's first practice will be at the Treehouse Practice Soccer Field on \(player["Practice Date"]!) at \(player["Practice Time"]!). I will be handing out uniforms to The Sharks at that time.\n\n  Please call me if you have any questions. My number is 873-346-8730. (TRE-EHO-USE0)\n\nWith excitement,\nBradley White\n\n\n")
    }
}

//Print the average height of each team. Their average should be within 1.5 inches of the other teams
func printHeightAverages()
{
    //Add the team heights to one collection so they can be used in a loop
    teamHeights = ["Sharks" : sharksTotalHeight, "Dragons" : dragonsTotalHeight, "Raptors" : raptorsTotalHeight ]
    
    //Add the teams' total player count to an array to loop through as each team's height is calculated
    let totalTeamPlayers : [Int] = [teamSharks.count, teamDragons.count, teamRaptors.count]
    
    var teamIndex = 0
    for teamHeight in teamHeights
    {
        let teamName : String = teamHeight.key
        let teamCount = totalTeamPlayers[teamIndex]
        let totalHeight : Float = Float(teamHeight.value) / Float(teamCount)
        
        //Print the average height of the current team in this loop.
        print("The \(teamName)' average height is \(totalHeight).")
        teamIndex += 1
    }
}

//Create the soccer teams
createTeams()
