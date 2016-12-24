import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
  
  //MARK: - Constants
  
  struct Colors {
    static let background = UIColor(red: 10/255, green: 43/255, blue: 61/255, alpha: 1)
    static let correct = UIColor(red: 21/255, green: 147/255, blue: 135/255, alpha: 1)
    static let incorrect = UIColor(red: 255/255, green: 162/255, blue: 105/255, alpha: 1)
    static let buttonNormal = UIColor(red: 22/255, green: 114/255, blue: 141/255, alpha: 1)
    static let buttonNormalSelected = UIColor(red: 22/255, green: 180/255, blue: 141/255, alpha: 1)
    static let buttonNext = UIColor(red: 21/255, green: 146/255, blue: 135/255, alpha: 1)
    static let red = UIColor(red: 237/255, green: 69/255, blue: 69/255, alpha: 1)
    static let yellow = UIColor(red: 234/255, green: 199/255, blue: 52/255, alpha: 1)
  }
  
  struct Constants {
    static let height = UIScreen.main.bounds.height
    static let width = UIScreen.main.bounds.width
    static let leftMargin = CGFloat(10)
    static let rightMargin = CGFloat(-10)
    static let topMargin = UIScreen.main.bounds.height*0.1
    static let bottomMargin = CGFloat(-15)
    static let buttonHeight = UIScreen.main.bounds.height*0.1
    static let buttonWidth = UIScreen.main.bounds.width - 40
    static let spaceBetweenButtons = -(UIScreen.main.bounds.height*0.035)
    static let spaceBetweenLabels = UIScreen.main.bounds.height*0.05
    static let cornerRadius = CGFloat(8)
    static let countdownTime = 20
    static let winningScore = 0.7
  }
  
  //MARK: - UIObjects
  
  lazy var gameNameField: UILabel = {
    let label = UILabel()
    label.text = "QuizStarter"
    label.font = UIFont(name: "ArialRoundedMTBold", size: 45)
    label.textColor = UIColor.white
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  lazy var questionField: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Monaco", size: 16) /*HelveticaNeue-Bold*/
    label.textColor = UIColor.white
    label.textAlignment = .center
    label.lineBreakMode = .byWordWrapping
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  lazy var correctionField: UILabel = {
    let label = UILabel()
    label.font = UIFont(name: "Monaco", size: 22) /*HelveticaNeue-Bold*/
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  lazy var buttonOne: UIButton = {
    let button = UIButton()
    button.backgroundColor = Colors.buttonNormal
    button.layer.cornerRadius = Constants.cornerRadius
    button.setTitle("Button One", for: UIControlState())
    button.titleLabel!.font = UIFont(name: "Monaco", size: 16) /*HelveticaNeue-Regular*/
    button.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  lazy var buttonTwo: UIButton = {
    let button = UIButton()
    button.backgroundColor = Colors.buttonNormal
    button.layer.cornerRadius = Constants.cornerRadius
    button.setTitle("Button Two", for: UIControlState())
    button.titleLabel!.font = UIFont(name: "Monaco", size: 16) /*HelveticaNeue-Regular*/
    button.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  lazy var buttonThree: UIButton = {
    let button = UIButton()
    button.backgroundColor = Colors.buttonNormal
    button.layer.cornerRadius = Constants.cornerRadius
    button.setTitle("Button Three", for: UIControlState())
    button.titleLabel!.font = UIFont(name: "Monaco", size: 16) /*HelveticaNeue-Regular*/
    button.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  lazy var buttonFour: UIButton = {
    let button = UIButton()
    button.backgroundColor = Colors.buttonNormal
    button.layer.cornerRadius = Constants.cornerRadius
    button.setTitle("Button Four", for: UIControlState())
    button.titleLabel!.font = UIFont(name: "Monaco", size: 16)/*HelveticaNeue-Regular*/
    button.addTarget(self, action: #selector(checkAnswer), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  lazy var playAgainButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = Colors.buttonNext
    button.layer.cornerRadius = Constants.cornerRadius
    button.setTitle("Play Again!", for: UIControlState())
    button.titleLabel!.font = UIFont(name: "Monaco", size: 16) /*HelveticaNeue-Bold*/
    button.titleLabel!.textColor = UIColor.white
    button.addTarget(self, action: #selector(playAgain), for: .touchUpInside)
    button.isHidden = true
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  lazy var nextQuestionButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = Colors.buttonNext
    button.layer.cornerRadius = Constants.cornerRadius
    button.setTitle("Next Question", for: UIControlState())
    button.titleLabel!.font = UIFont(name: "Monaco", size: 16) /*HelveticaNeue-Bold*/
    button.titleLabel!.textColor = UIColor.white
    button.addTarget(self, action: #selector(nextQuestionButtonAction), for: .touchUpInside)
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  lazy var normalModeButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = Colors.yellow
    button.layer.cornerRadius = Constants.cornerRadius
    button.setTitle("Normal Mode", for: UIControlState())
    button.titleLabel!.font = UIFont(name: "Monaco", size: 18) /*HelveticaNeue-Bold*/
    button.titleLabel!.textColor = UIColor.white
    button.addTarget(self, action: #selector(startWithNormalMode), for: .touchUpInside)
    button.setImage(UIImage(named: "turtle.png"), for: UIControlState())
    button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    button.contentHorizontalAlignment = .left
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  lazy var lightningModeButton: UIButton = {
    let button = UIButton()
    button.backgroundColor = Colors.red
    button.layer.cornerRadius = Constants.cornerRadius
    button.setTitle("Lightning Mode", for: UIControlState())
    button.titleLabel!.font = UIFont(name: "Monaco", size: 18) /*HelveticaNeue-Bold*/
    button.titleLabel!.textColor = UIColor.white
    button.addTarget(self, action: #selector(startWithLightningMode), for: .touchUpInside)
    button.setImage(UIImage(named: "runningRabbit.png"), for: UIControlState())
    button.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    button.imageEdgeInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    button.contentHorizontalAlignment = .left
    button.translatesAutoresizingMaskIntoConstraints = false
    
    return button
  }()
  
  lazy var finalBadge: UIImageView = {
    let image = UIImageView()
    image.isHidden = true
    image.translatesAutoresizingMaskIntoConstraints = false
    
    return image
  }()
  
  lazy var finalBadgeLabel: UILabel = {
    let label = UILabel()
    label.textColor = UIColor.white
    label.font = UIFont(name: "ArialRoundedMTBold", size: 30)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  lazy var countdownLabel: UILabel = {
    let label = UILabel()
    label.textColor = UIColor.white
    label.font = UIFont(name: "ArialRoundedMTBold", size: 40)
    label.textAlignment = .center
    label.isHidden = true
    label.translatesAutoresizingMaskIntoConstraints = false
    
    return label
  }()
  
  //MARK: - Vars
  
  var count = Constants.countdownTime
  let questionsPerRound = 10
  var questionsAsked = 0
  var correctQuestions = 0
  var indexOfSelectedQuestion: Int = 0
  var gameSound: SystemSoundID = 0
  var failureSound: SystemSoundID = 0
  var successSound: SystemSoundID = 0
  var questionsAppeared = [Int]()
  var normalMode = false
  var timer = Timer()
  
  //MARK: - ViewDidLoad
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    loadGameStartSound()
    loadSuccessSound()
    loadFailureSound()
    
    startGame()
  }
  
  //MARK: - Functions. Setup the view
  
  // Description: Adds the subviews to the main view and sets the background color
    func setupView() {
    view.backgroundColor =  Colors.background
    [questionField,correctionField,buttonOne,buttonTwo,buttonThree,buttonFour,playAgainButton,nextQuestionButton,finalBadge,finalBadgeLabel,
      countdownLabel,lightningModeButton,normalModeButton,gameNameField].forEach{view.addSubview($0)}
    setupConstraints()
  }
  
  // Description: Sets the constrints for each UIObject declared before
  func setupConstraints() {
    NSLayoutConstraint.activate([
      gameNameField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.topMargin),
      gameNameField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      questionField.topAnchor.constraint(equalTo: view.topAnchor, constant: Constants.topMargin),
      questionField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      questionField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.rightMargin),
      questionField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.leftMargin),
      
      correctionField.topAnchor.constraint(equalTo: questionField.bottomAnchor, constant: Constants.spaceBetweenLabels),
      correctionField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      correctionField.rightAnchor.constraint(equalTo: view.rightAnchor, constant: Constants.rightMargin),
      correctionField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: Constants.leftMargin),
      
      playAgainButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.bottomMargin),
      playAgainButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      playAgainButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
      playAgainButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
      
      nextQuestionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.bottomMargin),
      nextQuestionButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      nextQuestionButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
      nextQuestionButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
      
      buttonFour.bottomAnchor.constraint(equalTo: playAgainButton.topAnchor, constant: Constants.spaceBetweenButtons),
      buttonFour.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttonFour.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
      buttonFour.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
      
      buttonThree.bottomAnchor.constraint(equalTo: buttonFour.topAnchor, constant: Constants.spaceBetweenButtons),
      buttonThree.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttonThree.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
      buttonThree.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
      
      buttonTwo.bottomAnchor.constraint(equalTo: buttonThree.topAnchor, constant: Constants.spaceBetweenButtons),
      buttonTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttonTwo.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
      buttonTwo.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
      
      buttonOne.bottomAnchor.constraint(equalTo: buttonTwo.topAnchor, constant: Constants.spaceBetweenButtons),
      buttonOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      buttonOne.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
      buttonOne.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
      
      finalBadge.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      finalBadge.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -20),
      finalBadge.heightAnchor.constraint(equalToConstant: 170),
      finalBadge.widthAnchor.constraint(equalToConstant: 150),
      
      finalBadgeLabel.centerXAnchor.constraint(equalTo: finalBadge.centerXAnchor),
      finalBadgeLabel.topAnchor.constraint(equalTo: finalBadge.bottomAnchor, constant: 8),
      
      countdownLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      countdownLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.bottomMargin),
      
      lightningModeButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: Constants.bottomMargin),
      lightningModeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      lightningModeButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
      lightningModeButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
      
      normalModeButton.bottomAnchor.constraint(equalTo: lightningModeButton.topAnchor, constant: Constants.spaceBetweenButtons),
      normalModeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      normalModeButton.heightAnchor.constraint(equalToConstant: Constants.buttonHeight),
      normalModeButton.widthAnchor.constraint(equalToConstant: Constants.buttonWidth),
      
      ])
    
  }
  
  //MARK: - Functions. Game flow
  
  // Description: Hide/Display the objects needed to start the game and play the init song
  func startGame() {
    playGameStartSound()
    
    hideStartObjects(false)
    hideQuestionObjects(true, questions: 0)
    hideResultsObjects(true)
  }
  
  // Description: When the Lightning Button is pressed, sets the countdown to assigned value and display/hides some objects
  func startWithLightningMode() {
    normalMode = false
    
    // Restart the countdown value
    count = Constants.countdownTime
    
    hideStartObjects(true)
    displayQuestion()
  }
  
  // Description: When the Lightning Button is pressed display/hides some objects
  func startWithNormalMode() {
    normalMode = true
    
    hideStartObjects(true)
    displayQuestion()
  }
  
  // Description: Prepare the view for display a question
  func displayQuestion(){
    // Hide the next Question button
    nextQuestionButton.isHidden = true
    
    // Generate a random number and append this number in the questionsApperared in order to no repeat questions
    indexOfSelectedQuestion = generateRandomNumber()
    questionsAppeared.append(indexOfSelectedQuestion)
    
    // Get a random question from the ones available in the Questions.swift thanks to the random number generated before
    let questionSelected = Question.questions[indexOfSelectedQuestion]
    hideQuestionObjects(false, questions: questionSelected.numberOfAnswers)
    
    // Enable the user interaction of the button
    disableOptionButtons(false)
    
    // Prepare/Disable the countdown depending the selected mode
    if normalMode {
      countdownLabel.isHidden = true
      timer.invalidate()
    } else {
      countdownLabel.isHidden = false
      count = Constants.countdownTime
      countdownLabel.text = "\(count)"
      timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.update), userInfo: nil, repeats: true)
    }
    
    // Set the answer button's text for each question
    questionField.text = questionSelected.text
    buttonOne.setTitle(questionSelected.answerOne, for: UIControlState())
    buttonTwo.setTitle(questionSelected.answerTwo, for: UIControlState())
    buttonThree.setTitle(questionSelected.answerThree, for: UIControlState())
    buttonFour.setTitle(questionSelected.answerFour, for: UIControlState())
    playAgainButton.isHidden = true
    
    // Set the color to white for each button text
    buttonOne.setTitleColor(UIColor.white, for: UIControlState())
    buttonTwo.setTitleColor(UIColor.white, for: UIControlState())
    buttonThree.setTitleColor(UIColor.white, for: UIControlState())
    buttonFour.setTitleColor(UIColor.white, for: UIControlState())
  }
  
  // Description: Check if the user answered the question properly
  func checkAnswer(_ sender: UIButton) {
    // Disable the user interaction of the button
    disableOptionButtons(true)
    
    // Increment the questions asked counter
    timer.invalidate()
    questionsAsked += 1
    
    // Read which button contain the correct answer
    let selectedQuestion = Question.questions[indexOfSelectedQuestion]
    let correctAnswer = selectedQuestion.correctAnswer
    
    // Check if the pressed button conatins the correct answer
    if (sender === buttonOne &&  correctAnswer == 1) ||
       (sender === buttonTwo && correctAnswer == 2) ||
       (sender === buttonThree && correctAnswer == 3) ||
       (sender === buttonFour && correctAnswer == 4)
    {
      correctQuestions += 1
      playSucessSound()
      correctionField.text = "Correct!"
      correctionField.textColor = Colors.correct
    } else {
      playFailureSound()
      correctionField.text = "Sorry, wrong answer!"
      correctionField.textColor = Colors.incorrect
    }
    
    // Show the correction field
    correctionField.isHidden = false
    
    // Set the incorrect button's text color to gray
    if correctAnswer != 1 { buttonOne.setTitleColor(UIColor.gray, for: UIControlState()) }
    if correctAnswer != 2 { buttonTwo.setTitleColor(UIColor.gray, for: UIControlState()) }
    if correctAnswer != 3 { buttonThree.setTitleColor(UIColor.gray, for: UIControlState()) }
    if correctAnswer != 4 { buttonFour.setTitleColor(UIColor.gray, for: UIControlState()) }
    
    // Show the next question button
    nextQuestionButton.isHidden = false
    
    //Hide the countdown label
    countdownLabel.isHidden = true
  }
  
  // Description: When the nextQuestionButton is pressed, call the function nextRound
  func nextQuestionButtonAction() {
    self.nextRound()
  }
  
  // Description: If the questions per round are finished show the results and empty the array questionsAppered
  //              otherwise show another question
  func nextRound() {
    if questionsAsked == questionsPerRound {
      // Game is over
      timer.invalidate()
      questionsAppeared = [Int]()
      displayScore()
    } else {
      // Continue game
      correctionField.isHidden = true
      displayQuestion()
    }
  }
  
  // Descrition: Display the score that the user got from the questions round
  func displayScore() {
    // Hide the answer buttons
    hideQuestionObjects(true, questions: 0)
    
    // Display play again button
    hideResultsObjects(false)
    
    // If the user answer succefully at least 70% of the questions, show the winner badge and label otherwise show the bummer objects
    if Double(correctQuestions)/Double(questionsPerRound) > Constants.winningScore {
      finalBadgeLabel.text = "You rock!"
      finalBadge.image = UIImage(named: "Winner")
    } else {
      finalBadgeLabel.text = "Bummer!"
      finalBadge.image = UIImage(named: "Bummer")
    }
    
    // Show how many questions the user answered succesfully
    questionField.text = "Way to go!\nYou got \(correctQuestions) out of \(questionsPerRound) correct!"
  }
  
  // Description: Restart some vars and show the modes button
  func playAgain() {
    // Restart some vars
    questionsAsked = 0
    correctQuestions = 0
    
    // Show the modes button
    startGame()
  }
  
  
  //MARK: - Functions. Hide/Display Objects
  
  // Description: Disable/Enable the interaction of the questions buttons
  // Inputs: (Bool) hide: true for hidding and false for showing
  func disableOptionButtons(_ disable: Bool) {
    
    if disable {
      buttonOne.isUserInteractionEnabled = false
      buttonTwo.isUserInteractionEnabled = false
      buttonThree.isUserInteractionEnabled = false
      buttonFour.isUserInteractionEnabled = false
    } else {
      buttonOne.isUserInteractionEnabled = true
      buttonTwo.isUserInteractionEnabled = true
      buttonThree.isUserInteractionEnabled = true
      buttonFour.isUserInteractionEnabled = true
    }
    
  }
  
  // Description: Hide/Show the buttons and the questionField. When showing, the input questions determine how many buttons are shown
  // Inputs: (Bool) hide: true for hidding and false for showing, (Int) questions: Number of buttons to display
  func hideQuestionObjects(_ hide: Bool, questions: Int) {
    var i = 1
    
    if hide {
      buttonOne.isHidden = true
      buttonTwo.isHidden = true
      buttonThree.isHidden = true
      buttonFour.isHidden = true
      questionField.isHidden = true
    } else {
      let buttons = [buttonOne,buttonTwo,buttonThree,buttonFour]
      
      hideQuestionObjects(true, questions: 0)
      for button in buttons where i <= questions {
        button.isHidden = false
        i += 1
      }
      questionField.isHidden = false
    }
  }
  
  // Description: Hide/Show the objects displayed when the user finished the round
  // Inputs: (Bool) hide: true for hidding and false for showing
  func hideResultsObjects(_ hide: Bool) {
    if hide {
      finalBadgeLabel.isHidden = true
      finalBadge.isHidden = true
      playAgainButton.isHidden = true
      questionField.isHidden = true
    } else {
      finalBadgeLabel.isHidden = false
      finalBadge.isHidden = false
      playAgainButton.isHidden = false
      questionField.isHidden = false
      countdownLabel.isHidden = true
      correctionField.isHidden = true
      nextQuestionButton.isHidden = true
    }
  }
  
  // Description: Hide/Show the objects displayed to select the game mode
  // Inputs: (Bool) hide: true for hidding and false for showing
  func hideStartObjects(_ hide: Bool) {
    if hide {
      lightningModeButton.isHidden = true
      normalModeButton.isHidden = true
      gameNameField.isHidden = true
    } else {
      lightningModeButton.isHidden = false
      normalModeButton.isHidden = false
      gameNameField.isHidden = false
    }
  }

  
  // MARK: - Helper Methods
  
  // Description: Pause the execution the introduced seconds
  // Inputs: (Int) The number of seconds you want to pause the execution
  func loadNextRoundWithDelay(_ seconds: Int) {
    // Converts a delay in seconds to nanoseconds as signed 64 bit integer
    let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
    // Calculates a time value to execute the method given current time and delay
    let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
    
    // Executes the nextRound method at the dispatch time on the main queue
    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
      self.nextRound()
    }
  }
  
  // Description: Loads a sound into the var gameSound
  func loadGameStartSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
  }
  
  // Description: Plays the sound loaded into the var gameSound
  func playGameStartSound() {
    AudioServicesPlaySystemSound(gameSound)
  }
  
  // Description: Loads a sound into the var failureSong
  func loadFailureSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "FailureSound", ofType: "wav")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &failureSound)
  }
  
  // Description:  Plays the sound loaded into the var failureSong
  func playFailureSound() {
    AudioServicesPlaySystemSound(failureSound)
  }
  
  // Description:  Loads a sound into the var successSound
  func loadSuccessSound() {
    let pathToSoundFile = Bundle.main.path(forResource: "SuccessSound", ofType: "wav")
    let soundURL = URL(fileURLWithPath: pathToSoundFile!)
    AudioServicesCreateSystemSoundID(soundURL as CFURL, &successSound)
  }
  
  // Description:  Plays the sound loaded into the var successSound
  func playSucessSound() {
    AudioServicesPlaySystemSound(successSound)
  }
  
  // Description: Generates a random number that does not exist in the array questionsAppeared
  // Output: (Int) A random generated integer
  func generateRandomNumber() -> Int {
    var randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: Question.questions.count)
    
    // If it is found that the randomnumber is contained into the questionsApperared call again and again the function until
    // a not contained number is generated and return it
    if questionsAppeared.contains(randomNumber) {
      randomNumber = generateRandomNumber()
    }
    
    return randomNumber
  }
  
  // Description: Updates the countdown label whan it's called
  func update() {
    count -= 1
    if count > 0 {
      countdownLabel.text = "\(count)"
    } else if count == 0 {
      timer.invalidate()
      checkAnswer(playAgainButton)
    }
  }
}

