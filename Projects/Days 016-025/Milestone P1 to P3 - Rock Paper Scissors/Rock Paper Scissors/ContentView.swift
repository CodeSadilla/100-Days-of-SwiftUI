import SwiftUI

struct DisplayWinOrLoseText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .multilineTextAlignment(.center)
            .font(.title.weight(.medium))
    }
}

struct ContentView: View {
    @State private var currentChoice = Moves.allCases.randomElement()
    @State private var shouldWin = Bool.random()
    @State private var playerScore = 0
    @State private var showingScore = false
    @State private var gameEnded = false
    @State private var roundsAttempted = 0
    @State private var scoreTitle = ""
    
    @ViewBuilder var displayWinOrLose: some View {
        if shouldWin {
            DisplayWinOrLoseText(text: "Computer wants you to win.")
        } else {
            DisplayWinOrLoseText(text: "Computer wants you to lose or tie.")
        }
    }
    
    enum Moves: String, CaseIterable {
        case rock, paper, scissors
        var name: String {
            rawValue.capitalized
        }
    }
    
    let isCorrectString = "Correct!"
    let isWrongString = "Wrong!"
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.314, green: 0.7, blue: 0.471), location: 0.3),
                .init(color: Color(red: 0.38, green: 0, blue: 0.631), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Text("Player Score: \(playerScore)")
                    .font(.title)
                Text("Computer chooses: \n\(currentChoice!.name)")
                    .multilineTextAlignment(.center)
                    .font(.largeTitle.weight(.semibold))
                
                displayWinOrLose
                
                HStack {
                    ForEach(Moves.allCases, id: \.self) { move in
                        Button {
                            moveTapped(move)
                        } label: {
                            Text("\(move.name)")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding(5)
                                .background(.black)
                                .padding()
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, 20)
            .background(.regularMaterial)
            .clipShape(RoundedRectangle(cornerRadius: 20))
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: startRound)
        } message: {
            Text("Your score is: \(playerScore)")
        }
        .alert(scoreTitle, isPresented: $gameEnded) {
            Button("Reset", action: resetGame)
        } message: {
            Text("Tap to reset the game.")
        }
    }
    
    func moveTapped(_ move: Moves) {
        switch move {
        case .rock:
            if (currentChoice == .scissors) && shouldWin {
                playerScore += 1
                scoreTitle = isCorrectString
            } else if (currentChoice != .scissors) && !shouldWin {
                playerScore += 1
                scoreTitle = isCorrectString
            } else {
                playerScore -= 1
                scoreTitle = isWrongString
            }
        case .paper:
            if (currentChoice == .rock) && shouldWin {
                playerScore += 1
                scoreTitle = isCorrectString
            } else if (currentChoice != .rock) && !shouldWin {
                playerScore += 1
                scoreTitle = isCorrectString
            } else {
                playerScore -= 1
                scoreTitle = isWrongString
            }
        case .scissors:
            if (currentChoice == .paper) && shouldWin {
                playerScore += 1
                scoreTitle = isCorrectString
            } else if (currentChoice != .paper) && !shouldWin {
                playerScore += 1
                scoreTitle = isCorrectString
            } else {
                playerScore -= 1
                scoreTitle = isWrongString
            }
        }
        
        showingScore = true
        roundsAttempted += 1
    }
    
    func startRound() {
        if roundsAttempted >= 10 {
            scoreTitle = "Game Over!"
            gameEnded = true
        } else {
            shouldWin.toggle()
            currentChoice = Moves.allCases.randomElement()
        }
    }
    
    func resetGame() {
        playerScore = 0
        roundsAttempted = 0
        gameEnded = false
        startRound()
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
