//
//  ViewController.swift
//  P5ScrabbleGame
//
//  Created by Ibraheem k. Rawlinson on 9/24/24.
//

import UIKit

class ViewController: UITableViewController {
    let tableViewCellID = "word"
    var allWords = [String]()
    var usedWords = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavItems()
        findFile()
        startGame()
    }
    func setupNavItems(){
        navigationController?.navigationBar.isHidden = false
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(pickAword))
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(resetGame))
    }
    func findFile(){
        if let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt"){
            if let startWords = try? String(contentsOf: startWordsURL) {
                allWords = startWords.components(separatedBy: "\n")
            }
        }
        
        if allWords.isEmpty {
            allWords = ["silkworms"]
        }
    }
    
    func startGame(){
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true) // remove any previous guesses the user has
        tableView.reloadData() // reload it rows aand sections from scratch
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return usedWords.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let tableViewCell = tableView.dequeueReusableCell(withIdentifier: tableViewCellID, for: indexPath)
        tableViewCell.textLabel?.text = usedWords[indexPath.row]
        return tableViewCell
    }
    
    @objc func pickAword(){
        let alertController = UIAlertController(title: "Enter Your Word", message: nil, preferredStyle: .alert)
        alertController.addTextField()
        let submitAction = UIAlertAction(title: "Submit", style: .default){
            [weak self, weak alertController] action in
            guard let answer = alertController?.textFields?[0].text?.lowercased() else { return }
            self?.submit(answer)
        }
        alertController.addAction(submitAction)
        present(alertController, animated: true)
    }
    @objc func resetGame(){
        title = allWords.randomElement()
        usedWords.removeAll(keepingCapacity: true)
        tableView.reloadData()
    }
    func submit(_ answer: String){
        let lowerAnswer = answer.lowercased()
        //let errorTitle: String
       // let errorMessage: String
        if isPossible(word: lowerAnswer){
            if isOrignal(word: lowerAnswer){
                if isReal(word: lowerAnswer){
                    usedWords.insert(answer, at: 0)
                    
                    let indextPath = IndexPath(row: 0, section: 0)
                    tableView.insertRows(at: [indextPath], with: .automatic)
                    return
                } else {
                    //errorTitle = "Word Does Not Exist"
                   // errorMessage = "You can't makeup words for this game."
                    callAlert(title: "Word Does Not Exist", message: "You can't makeup words for this game.")
                }
            } else {
                //errorTitle = "Word is Not Original"
                //errorMessage = "Please be more creative and try again."
                callAlert(title: "Word is Not Original", message: "Please be more creative and try again.")
            }
        } else {
            guard let myTitle = title?.lowercased() else {return}
           // errorTitle = "Word is Not Possible"
        //errorMessage = "You can't spell that word from \(myTitle)."
            callAlert(title: "Word is Not Possible", message: "You can't spell that word from \(myTitle).")
        }
        
        //callAlert(title: errorTitle, message: errorMessage)
        
    }
    func callAlert(title: String, message: String){
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .default))
        present(alertController, animated: true)
        
    }
    func isPossible(word: String) -> Bool{
        guard var temporaryWord = title?.lowercased() else { return false }
        
        for letter in word {
            if let position = temporaryWord.firstIndex(of: letter){
                temporaryWord.remove(at: position)
            } else {
                return false
            }
        }
        return true
    }
    func isOrignal(word: String)->Bool{
        return !usedWords.contains(word)
    }
    func isReal(word: String)->Bool{
        if word.count < 3 || word == title {
            callAlert(title: "Too Short & Not New", message: "Word has to be more than 3 characters and cant the the title word")
            return false
        }
        
        let wordChecker = UITextChecker()
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelling = wordChecker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        return misspelling.location == NSNotFound
    }

    
}

