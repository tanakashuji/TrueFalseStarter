import Foundation

class Question {
  let text: String
  let numberOfAnswers: Int
  let correctAnswer: Int
  let answerOne: String
  let answerTwo: String
  let answerThree: String
  let answerFour: String
  
  init(text: String, numberOfAnswers:Int, correctAnswer: Int, answerOne: String, answerTwo: String, answerThree:String, answerFour: String) {
    self.text = text
    self.numberOfAnswers = numberOfAnswers
    self.correctAnswer = correctAnswer
    self.answerOne = answerOne
    self.answerTwo = answerTwo
    self.answerThree = answerThree
    self.answerFour = answerFour
  }
  
  static let questionOne = Question(
    text: "This was the only US President to serve more than two consecutive terms.",
    numberOfAnswers: 4,
    correctAnswer: 2,
    answerOne: "George Washington",
    answerTwo: "Franklin D. Roosevelt",
    answerThree: "Woodrow Wilson",
    answerFour: "Andrew Jackson")
  
  static let questionTwo = Question(
    text: "Which of the following countries has the most residents?",
    numberOfAnswers: 4,
    correctAnswer: 1,
    answerOne: "Nigeria",
    answerTwo: "Russia",
    answerThree: "Iran",
    answerFour: "Vietnam")
  
  static let questionThree = Question(
    text: "In what year was the United Nations founded?",
    numberOfAnswers: 4,
    correctAnswer: 3,
    answerOne: "1918",
    answerTwo: "1919",
    answerThree: "1945",
    answerFour: "1954")
  
  static let questionFour = Question(
    text: "The Titanic departed from the United Kingdom, where was it supposed to arrive?",
    numberOfAnswers: 4,
    correctAnswer: 3,
    answerOne: "Paris",
    answerTwo: "Washington D.C.",
    answerThree: "New York City",
    answerFour: "Boston")
  
  static let questionFive = Question(
    text: "Which nation produces the most oil?",
    numberOfAnswers: 4,
    correctAnswer: 4,
    answerOne: "Iran",
    answerTwo: "Iraq",
    answerThree: "Brazil",
    answerFour: "Canada")
  
  static let questionSix = Question(
    text: "Which country has most recently won consecutive World Cups in Soccer?",
    numberOfAnswers: 4,
    correctAnswer: 2,
    answerOne: "Italy",
    answerTwo: "Brazil",
    answerThree: "Argetina",
    answerFour: "Spain")
  
  static let questionSeven = Question(
    text: "Which of the following rivers is longest?",
    numberOfAnswers: 4,
    correctAnswer: 2,
    answerOne: "Yangtze",
    answerTwo: "Mississippi",
    answerThree: "Congo",
    answerFour: "Mekong")
  
  static let questionEight = Question(
    text: "Which city is the oldest?",
    numberOfAnswers: 4,
    correctAnswer: 1,
    answerOne: "Mexico City",
    answerTwo: "Cape Town",
    answerThree: "San Juan",
    answerFour: "Sydney")
  
  static let questionNine = Question(
    text: "Which country was the first to allow women to vote in national elections?",
    numberOfAnswers: 4,
    correctAnswer: 1,
    answerOne: "Poland",
    answerTwo: "United States",
    answerThree: "Sweden",
    answerFour: "Senegal")
  
  static let questionTen = Question(
    text: "Which of these countries won the most medals in the 2012 Summer Games?",
    numberOfAnswers: 4,
    correctAnswer: 4,
    answerOne: "France",
    answerTwo: "Germany",
    answerThree: "Japan",
    answerFour: "Great Britian")
  
  static let questionEleven = Question(
    text: "Only female koalas can whistle",
    numberOfAnswers: 2,
    correctAnswer: 2,
    answerOne: "True",
    answerTwo: "False",
    answerThree: "",
    answerFour: "")
  
  static let questionTwelve = Question(
    text: "Blue whales are technically whales",
    numberOfAnswers: 2,
    correctAnswer: 1,
    answerOne: "True",
    answerTwo: "False",
    answerThree: "",
    answerFour: "")
  
  static let questionThirteen = Question(
    text: "Camels are cannibalistic",
    numberOfAnswers: 2,
    correctAnswer: 2,
    answerOne: "True",
    answerTwo: "False",
    answerThree: "",
    answerFour: "")
  
  static let questionFourteen = Question(
    text: "All ducks are birds",
    numberOfAnswers: 2,
    correctAnswer: 1,
    answerOne: "True",
    answerTwo: "False",
    answerThree: "",
    answerFour: "")
  
  static let questionFifteen = Question(
    text: "Which of the following Presidents was assassinated?",
    numberOfAnswers: 3,
    correctAnswer: 1,
    answerOne: "Abraham Lincoln",
    answerTwo: "Franklin D. Roosvelt",
    answerThree: "Harry S. Truman",
    answerFour: "")
  
  static let questionSixteen = Question(
    text: "Who painted the famous piece 'Mona Lisa'?",
    numberOfAnswers: 3,
    correctAnswer: 1,
    answerOne: "Leonardo Da Vinci",
    answerTwo: "Rembrandt van Rijn",
    answerThree: "Vincent Van Gogh",
    answerFour: "")
  
  static let questionSeventeen = Question(
    text: "According to the legend, which of the following was a knight of the round table?",
    numberOfAnswers: 3,
    correctAnswer: 2,
    answerOne: "Sir Comstance",
    answerTwo: "Sir Lancelot",
    answerThree: "Sir Tanely",
    answerFour: "")
  
  static let questionEighteen = Question(
    text: "How many dragons does Daenerys own?",
    numberOfAnswers: 4,
    correctAnswer: 2,
    answerOne: "6",
    answerTwo: "3",
    answerThree: "4",
    answerFour: "2")
  
  static let questionNineteen = Question(
    text: "What is the name of the Maester at Castle Black?",
    numberOfAnswers: 3,
    correctAnswer: 1,
    answerOne: "Maester Aemon",
    answerTwo: "Maester Pycelle",
    answerThree: "Maester Luwin",
    answerFour: "")
  
  static let questionTwenty = Question(
    text: "What was the name of the girl Ted waited for every Halloween?",
    numberOfAnswers: 4,
    correctAnswer: 4,
    answerOne: "Slutty Tootsie Roll",
    answerTwo: "Classy Tootsie Roll",
    answerThree: "Slutty Pumpkin",
    answerFour: "Classy Pumpkin")
  
  static let questionTwentyOne = Question(
    text: "What last name did Marshall and Lily come up with as their new last name?",
    numberOfAnswers: 3,
    correctAnswer: 3,
    answerOne: "Lily and Marshall Erikson",
    answerTwo: "Lily and Marshall Funtimes",
    answerThree: "Lily and Marshall Awesome",
    answerFour: "")
  
  static let questionTwentyTwo = Question(
    text: "What was Robin's celebrity name in Canada?",
    numberOfAnswers: 4,
    correctAnswer: 2,
    answerOne: "Robin Sunshine",
    answerTwo: "Robin Sparkles",
    answerThree: "Robin Sprinkles",
    answerFour: "Robin Tinkles")
  
  static let questionTwentyThree = Question(
    text: "Who won football's Super Bowl XLIV in February 2010?",
    numberOfAnswers: 4,
    correctAnswer: 1,
    answerOne: "New Orleans Saints",
    answerTwo: "Chicago Bears",
    answerThree: "Philadelphia Delphins",
    answerFour: "Denver Broncos")
  
  static let questionTwentyFour = Question(
    text: "Who did Richard Nixon defeat in the 1972 election?",
    numberOfAnswers: 2,
    correctAnswer: 2,
    answerOne: "George McGovern",
    answerTwo: "John Kennedy",
    answerThree: "",
    answerFour: "")
  
  static let questionTwentyFive = Question(
    text: "Which instrument did King Camp Gillette invent?",
    numberOfAnswers: 3,
    correctAnswer: 1,
    answerOne: "Safety razor",
    answerTwo: "Trampoline",
    answerThree: "Tooth Brush",
    answerFour: "")
  
  static let questionTwentySix = Question(
    text: "At launch in 2008, how many apps were available to download from the iTunes App Store?",
    numberOfAnswers: 4,
    correctAnswer: 3,
    answerOne: "100,000",
    answerTwo: "0",
    answerThree: "500",
    answerFour: "10,000")
  
  static let questionTwentySeven = Question(
    text: "Aloha State” has appeared on the license plate for which U.S. state?",
    numberOfAnswers: 4,
    correctAnswer: 4,
    answerOne: "Iowa",
    answerTwo: "Texas",
    answerThree: "California",
    answerFour: "Hawaii")
  
  static let questionTwentyEight = Question(
    text: "Which ancient civilization created the Rosetta Stone?",
    numberOfAnswers: 4,
    correctAnswer: 2,
    answerOne: "Incan",
    answerTwo: "Egyptian",
    answerThree: "Aztec",
    answerFour: "Greek")

  
  static let questions = [questionOne,questionTwo,questionThree,questionFour,questionFive,questionSix,questionSeven,questionEight,
  questionNine,questionTen,questionEleven,questionTwelve,questionThirteen,questionFourteen,questionFifteen,questionSixteen,questionSeventeen,questionEighteen,questionNineteen,questionTwenty,questionTwentyOne,questionTwentyTwo,questionTwentyThree,questionTwentyFour,questionTwentyFive,questionTwentySix,questionTwentySeven,questionTwentyEight]
  
}
