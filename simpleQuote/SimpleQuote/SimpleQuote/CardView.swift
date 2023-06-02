//
//  CardView.swift
//  SimpleQuote
//
//  Created by Thebekhruz on 30/05/23.
//



import Foundation
import SwiftUI
let quotes = [
        "The only way to do great work is to love what you do. - Steve Jobs",
        "The best time to plant a tree was 20 years ago. The second best time is now. - Chinese Proverb",
        "An unexamined life is not worth living. - Socrates",
        "Your time is limited, don't waste it living someone else's life. - Steve Jobs",
        "Education is the key to unlocking the world; a passport to freedom.",
        "The only limit to your education is your willingness to learn.",
        "Education is not preparation for life; education is life itself.",
        "The more that you read, the more things you will know. The more that you learn, the more places you'll go.",
        "Education is the foundation upon which we build our future.",
        "An investment in knowledge pays the best interest.",
        "The beautiful thing about learning is that no one can take it away from you.",
        "Education is the passport to the future, for tomorrow belongs to those who prepare for it today.",
        "The power of education extends beyond the classroom.",
        "Education is the most powerful weapon which you can use to change the world.",
        "Learning is a treasure that will follow its owner everywhere.",
        "Education is not filling a pail but lighting a fire.",
        "The roots of education are bitter, but the fruit is sweet.",
        "Education is the movement from darkness to light.",
        "Education is the pathway to a brighter tomorrow.",
        "Education is not about filling a bucket; it's about lighting a fire.",
        "A good education is a foundation for a better future.",
        "The more you learn, the more you earn.",
        "Education is the gift that keeps on giving.",
        "Knowledge is power, and education is the key to unlock it.",
        "The best way to predict the future is to create it through education.",
        "Education is the bridge that connects dreams to reality.",
        "Education is not just about acquiring knowledge; it's about shaping character.",
        "The purpose of education is to replace an empty mind with an open one.",
        "Education is the passport out of poverty.",
        "Learning is a lifelong journey; never stop seeking knowledge.",
        "Education is the foundation upon which dreams are built.",
        "Invest in your education; it's the best investment you can make.",
        "Education is the key to unlocking your full potential.",
        "Education is the gateway to a world of opportunities.",
        "Education is the wings to help you fly.",
        "A well-educated mind is a powerful weapon.",
        "Education is the fuel that ignites the flame of success.",
        "Education is not a destination; it's a lifelong pursuit.",
        "Knowledge is the compass that guides us through life's journey.",
        "Education is the antidote to ignorance.",
        "Education is the light that brightens the path to success.",
        "Education is the foundation of progress and prosperity.",
        "The more you learn, the more doors of opportunity open for you.",
        "Education is the roadmap to a better future.",
        "Education is the anchor that keeps us grounded in a changing world.",
        "Education is the currency for success.",
        "Learning is the key that unlocks the doors of possibilities.",
        "Education is the catalyst for personal growth and development.",
        "Education is the foundation of a strong and vibrant society.",
        "Knowledge is the weapon that empowers us to change the world.",
        "Education is the stepping stone to greatness.",
        "Education is not just about acquiring facts; it's about gaining wisdom.",
        "The more you learn, the more confident and capable you become.",
        "Education is the passport to a life of fulfillment and purpose."
    ]

struct CardView: View {
    var quote: String

    var body: some View {
        VStack {
//            Image(systemName: "quote.bubble")
//                .renderingMode(.original)
//                .font(.system(size: 24))
//                .foregroundColor(.blue)
//                .padding([.leading, .bottom], 10)
            TextTypingView(text: quote)
        }
    }
}

struct TextTypingView: View {
    var text: String
    @State private var animatedText = ""
    @State private var animationTrigger = false

    
    var body: some View {

        Text(animatedText)
            .font(.title2)
            .padding(10)
            .cornerRadius(10)
            .shadow(radius: 10)
            .background(Color.black)
            .foregroundColor(.white) // Set the desired text color here

            .onAppear {
                animateText()
            }
        HStack{
            Spacer()
            Button(action: {
                        animationTrigger = false
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                            animatedText = ""
                            animateText()
                        }
                    })
            {
                Label("", systemImage: "arrow.clockwise")
                .font(.system(size: 24))
                .frame(width: 40, height: 40)
                .foregroundColor(.white)
                .background(Color.blue)
                .clipShape(Circle())
            }
            .padding(10)

        }
        
        
    }
    

    func animateText() {
        let randomQuote = getRandomQuote()
        for (index, character) in randomQuote.enumerated() {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(index) * 0.05) {
                animatedText += String(character)
            }
        }
    }
    
    func getRandomQuote() -> String {
        let randomIndex = Int.random(in: 0..<quotes.count)
        return quotes[randomIndex]
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(quote: "Example Quote")
        
        
    }
}


