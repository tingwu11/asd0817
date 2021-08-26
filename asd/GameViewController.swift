//
//  GameViewController.swift
//  asd
//
//  Created by apple on 2021/8/15.
//

import UIKit

class GameViewController: UIViewController {

    @IBOutlet weak var questionLable: UILabel!
    @IBOutlet weak var scoreLable: UILabel!
    @IBOutlet weak var resultLable: UILabel!
    @IBOutlet weak var highGradeLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var againButton: UIButton!
    @IBOutlet var choiceButton: [UIButton]!
    
    
    let choiceQueses = [ChoiceQues(question: "現在疫情流行，正確的洗手方式可以為我們多一道保障，請問正確洗手口訣為？", choice: ["內外夾弓大立完", "濕搓沖捧擦", "沖脫泡蓋送"], answer: "內外夾弓大立完"),
                           ChoiceQues(question: "最容易辨別流感跟普通感冒差別是下列哪項?", choice: ["喉嚨痛", "肌肉酸痛", "流鼻水"], answer: "流鼻水"),
                           ChoiceQues(question: "腸胃不舒服可以看什麼科?", choice: ["一般內科", "骨科", "外科"], answer: "一般內科"),
                           ChoiceQues(question: "腳踝扭傷的急性處理，第一步為立即休息，下一步則需要進行？", choice: ["推拿", " 熱敷", "冰敷"], answer: "冰敷"),
                           ChoiceQues(question: "呼吸心跳停止處理的口訣為「叫、叫、C、D」，其中C指的是？", choice: ["CPR", " CDR", "CBR"], answer: "CPR"),
                           ChoiceQues(question: "下列是依據頭痛的發作類型所作的分類，何者正確？", choice: ["原發性頭痛", "次發性頭痛", "以上皆是"], answer: "以上皆是"),
                           ChoiceQues(question: "感到頭暈的時候，須先判斷是暈還是眩，如果感覺到的是「暈」或年長者，或者疑似有心血管障礙，可先掛什麼科？", choice: ["神經內科", "耳鼻喉科", "心臟內科"], answer: "神經內科"),
                           ChoiceQues(question: "感到頭暈的時候，須先判斷是暈還是眩，如果感覺到的是「眩」或是年輕患者，可先掛什麼科？", choice: ["神經內科", "耳鼻喉科", "心臟內科"], answer: "耳鼻喉科"),
                           ChoiceQues(question: "遭到化學灼傷時，有4步驟，請問是哪四步驟？", choice: ["脫泡蓋送", "脫沖蓋送", "沖脫蓋送"], answer: "脫沖蓋送"),
                           ChoiceQues(question: "請問燙傷部位的緊急處理，可以做什麼減緩狀況？", choice: ["用冰塊冰敷", "擦涼藥膏", "以上皆是"], answer: "以上皆是"),
                           ChoiceQues(question: "下列三組號碼，何者是緊急救難號碼，可在收訊不佳，其他兩組號碼無法通時使用?", choice: ["110", "112", "119"], answer: "112"),
                           ChoiceQues(question: "器官捐贈者多半是意外腦傷的病人，經腦死判定醫師判定「腦死」且經檢察官同意後才能進行器官摘取手術，請問根據法律，腦死判定醫師須判斷幾次？", choice: ["一次", "兩次", "三次"], answer: "兩次"),
                           ChoiceQues(question: "下列為AIDS(愛滋病）的傳染途徑，何者正確？", choice: ["血液傳播", "母嬰傳播", "以上皆是"], answer: "以上皆是"),
                           ChoiceQues(question: "在酷熱潮濕的狀況下可能會造成一些疾病，下列何者為非？", choice: ["中暑","長熱痱","誘發過敏"], answer: "誘發過敏"),
                           ChoiceQues(question: "以下為改善鼻涕倒流的方法，何者為非？", choice: ["多喝水", "將睡姿調低", "保持室內濕度"], answer: "將睡姿調低"),
                           ChoiceQues(question: "請問想要打電話諮詢免費防疫專線是哪個專線?", choice: ["1993", "1922", "1988"], answer: "1922"),
                           ChoiceQues(question: "戴口罩的防疫步驟請問是下列何者?", choice: ["開戴壓密", "戴開壓密", "密壓戴開"], answer: "開戴壓密"),
                           ChoiceQues(question: "哪個網站可以看國內最新疫情變化及防疫建議?", choice: ["台北政府", "疾病管制署", "衛生局"], answer: "疾病管制署"),
                           ChoiceQues(question: "喝酒後容易出現臉紅、心跳加快、頭痛、頭暈、嘔吐、宿醉等症狀，稱為？", choice: ["酒精不耐症", "酒精中毒", "正常現象"], answer: "酒精不耐症"),
                           ChoiceQues(question: "頭暈的時候，如果感覺到的是「眩」（感覺在轉）或是是年輕患者，可先掛什麼科？", choice: ["神經內科", "耳鼻喉科", "心臟內科"], answer: "耳鼻喉科"),
                           ChoiceQues(question: "糖尿病患者看診的科別是？", choice: ["新陳代謝科", "內分泌科", "以上皆可"], answer: "以上皆可"),
                           ChoiceQues(question: "頭暈的時候，如果感覺到的是「暈」（暈暈的感覺）或是年長者，或者疑似有心血管障礙，可先掛什麼科？", choice: ["神經內科", "耳鼻喉科", "心臟內科"], answer: "神經內科"),
                           ChoiceQues(question: "下列何者為可能導致高血壓的原因？", choice: ["運動過多", "鹽分攝取過少", "遺傳"], answer: "遺傳"),
                           ChoiceQues(question: "「媽媽手」的治療中，如有出現紅腫熱痛的情形，可進行什麼原則？", choice: ["PRICE", "PEOPLE", "PLEASE"], answer: "PRICE"),
                           ChoiceQues(question: "可能導致扁平足的後天性原因，下列何者錯誤？", choice: ["走路姿勢不正確", "老化肌力喪失", "運動量過多"], answer: "運動量過多")]

    var actionChoiceQueses: [ChoiceQues] = []
    var choiceQues = ChoiceQues(question: "", choice: [], answer: "")
    var index = 0
    var score = 0
    var count = 0
    var highGrade = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        resultLable.isHidden = true
        scoreLable.text = String(score)
        actionChoiceQueses = choiceQueses
        nextButton.isHidden = true
        againButton.isHidden = true
        setQues()
        
        questionLable.lineBreakMode = NSLineBreakMode.byWordWrapping
        questionLable.numberOfLines = 0
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func choose(_ sender: UIButton) {
        if let choice = sender.title(for: .normal), choice == choiceQues.answer {
            score += 10
            scoreLable.text = String(score)
            sender.setTitleColor(UIColor.green, for: .normal)
        } else {
            sender.setTitleColor(UIColor.red, for: .normal)
            score -= 5
            scoreLable.text = String(score)
        }
        if count >= 10 {
            final()
        } else {
            nextButton.isHidden = false
        }
    }
    
    
    @IBAction func next(_ sender: Any) {
        choiceButton.forEach { bt in
             bt.setTitleColor(UIColor.yellow, for: .normal)
         }
         setQues()
         nextButton.isHidden = true
    }
    @IBAction func playAgain(_ sender: Any) {
        resultLable.isHidden = true
         againButton.setTitle("重新", for: .normal)
         count = 0
         score = 0
         scoreLable.text = String(score)
         actionChoiceQueses = choiceQueses
         choiceButton.forEach { bt in
             bt.setTitleColor(UIColor.yellow, for: .normal)
             
             bt.isEnabled = true
         }
         setQues()
    }
    
    
        func setQues() {
            index = Int.random(in: 0..<actionChoiceQueses.count)
            choiceQues = actionChoiceQueses.remove(at: index)
            questionLable.text = choiceQues.question
            for (i, choice) in choiceQues.choice.shuffled().enumerated() {
                choiceButton[i].setTitle(choice, for: .normal)
            }
            count += 1
        }
 
        func final() {
            choiceButton.forEach { bt in
                bt.isEnabled = false
                bt.setTitle("", for: .disabled)
            }
            questionLable.text = ""
            scoreLable.text = ""
            let resultMsg = "你得了\(score)分"
            resultLable.text = resultMsg
            saveGrade()
            resultLable.isHidden = false
            againButton.setTitle("再玩一次", for: .normal)
        }
    
        let defaults = UserDefaults.standard
        struct Keys{
            static let historyGrade = "historyGrade"
        }
    
        func saveGrade(){
            if score>highGrade{
                defaults.set(score, forKey: Keys.historyGrade)
                highGrade = defaults.value(forKey: Keys.historyGrade) as? Int ?? 0
            
                highGradeLabel.text = "\(highGrade)"
        }
    }
}
