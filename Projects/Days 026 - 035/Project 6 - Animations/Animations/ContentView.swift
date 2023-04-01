import SwiftUI

// Creates a model for the display of each flag. Used in the ForEach loop in ContentView's body.
struct FlagImage: View {
    var flags: [String]
    var flagNumber: Int
    var selectedFlag: Int
    var body: some View {
        Image(flags[flagNumber])
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 5)
            .rotation3DEffect(.degrees(selectedFlag == flagNumber ? 360 : 0), axis: (x: 0, y: 1, z: 0))
            .opacity(selectedFlag == -1 || selectedFlag == flagNumber ? 1.0 : 0.25)
            .scaleEffect(selectedFlag == flagNumber ? 1.5 : 1)
            .animation(.easeInOut(duration: 1), value: selectedFlag)
    }
}

struct ContentView: View {
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var userScore = 0
    @State private var gameEnded = false
    @State private var questionsAsked = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var tappedFlag = -1
    
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red:0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 700)
            .ignoresSafeArea()
            
            VStack {
                Text("Guess the Flag")
                    .font(.largeTitle.bold())
                    .foregroundColor(.white)
                
                Spacer()
                
                VStack(spacing: 27 ) {
                    VStack {
                        Text("Tap the flag of")
                            .foregroundStyle(.secondary)
                            .font(.subheadline.weight(.heavy))
                        Text(countries[correctAnswer])
                            .font(.largeTitle.weight(.semibold))
                    }
                    
                    ForEach(0..<3) { number in
                        FlagImage(flags: countries, flagNumber: number, selectedFlag: tappedFlag)
                            .onTapGesture {
                                flagTapped(number)
                            }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 40)
                .background(.regularMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                Spacer()
                
                Text("Score: \(userScore)")
                    .foregroundColor(.white)
                    .font(.title.bold())
                Spacer()
            }
            .padding()
        }
        .alert(scoreTitle, isPresented: $showingScore) {
            Button("Continue", action: askQuestion)
        } message: {
            Text("Your score is: \(userScore)")
        }
        .alert(scoreTitle, isPresented: $gameEnded) {
            Button("Reset", action: resetGame)
        } message: {
            Text("Tap to reset the game.")
        }
    }
    func flagTapped(_ number: Int) {
        
        if number == correctAnswer {
            withAnimation {
                tappedFlag = number
            }
            scoreTitle = "Correct!"
            userScore += 1
            
        } else {
            scoreTitle = "Wrong! That's the flag of \(countries[number])."
            userScore -= 1
        }
        
        showingScore = true
        questionsAsked += 1
    }
    
    func askQuestion() {
        if questionsAsked >= 8 {
            scoreTitle = "Game Over!"
            gameEnded = true
        } else {
            countries.shuffle()
            correctAnswer = Int.random(in: 0...2)
        }
        tappedFlag = -1

    }
    
    func resetGame() {
        userScore = 0
        questionsAsked = 0
        gameEnded = false
        askQuestion()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
