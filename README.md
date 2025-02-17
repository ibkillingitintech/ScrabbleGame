# 🔠 P5ScrabbleGame  

A **fun and interactive Scrabble-inspired word game** built using **UIKit & Swift**. 🎯  
Test your vocabulary by forming words from a random title word.  
Will you find the most words? Let's play!  

![P5ScrabbleGame Preview](#) <!-- Add a screenshot of the app here -->

---

## 📖 About the Project  
**P5ScrabbleGame** is a simple yet **engaging word game** where users form words using letters from a given title word.  
The app **validates words** based on spelling, originality, and feasibility.  

✨ **Features:**  
✅ **Random starting word** from a list or default word  
✅ **Add words dynamically** via a text input prompt  
✅ **Word validation** (spelling, originality, feasibility)  
✅ **Error handling with alerts**  
✅ **Restart the game anytime**  
✅ **UIKit TableView integration**  

---

## 📸 Screenshots  
| Home Screen | Add Word | Invalid Word Alert |  
|------------|---------|------------------|  
| ![Home](#) | ![Add](#) | ![Alert](#) |  

---

## 🚀 Features  
### 🎯 **Gameplay Mechanics**  
- Users start with a **random word as the title**.  
- They enter words using letters from the **title word**.  
- Words must be:  
  ✅ **Real words** (checked via `UITextChecker`)  
  ✅ **Original** (not used before)  
  ✅ **Formed only using letters from the title word**  

### 📜 **Word Validation**  
- **Possible?** – Can the word be made from the given letters?  
- **Original?** – Has this word been used before?  
- **Real?** – Does this word exist in the dictionary?  

### 🎮 **User-Friendly Interface**  
- **TableView-based UI** to list submitted words.  
- **Add words via alert prompt**.  
- **Restart game anytime** with a **refresh button**.  

---

## 📂 Project Structure  
📁 **P5ScrabbleGame/**  
├── 📄 `ViewController.swift` – Handles game logic, validation & UI updates  
├── 📄 `Main.storyboard` – Defines **TableView & NavigationController**  
├── 📄 `start.txt` – Contains a list of **random starting words**  
└── 📄 `Assets.xcassets` – Stores **app icons & visuals**  

---

## 🎮 How to Play  

1️⃣ **Launch the app** – A **random word appears as the title**.  
2️⃣ **Tap '+' to enter a word** – Type a word and submit.  
3️⃣ **Validation happens automatically** ✅.  
4️⃣ **View submitted words in the list** 📜.  
5️⃣ **Restart the game anytime** using the refresh button 🔄.  

---

## 🛠 Installation & Setup  

### 1️⃣ Clone the Repository  
```bash
git clone https://github.com/YourUsername/P5ScrabbleGame.git
cd P5ScrabbleGame
