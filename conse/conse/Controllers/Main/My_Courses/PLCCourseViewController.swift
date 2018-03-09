//
//  PLCCourseViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 17/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import AVFoundation

class PLCCourseViewController: UIViewController, LeadersProtocol, UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate {
    
    // MARK: - Outlets
    @IBOutlet weak var leaders_table: UITableView!
    
    // MARK: - Properties
    var ncrAudio: AVAudioPlayer?
    var mainDelegate: MainProtocol?
    var isPlaying = nullString
    let maxPageIndex: Int = 58
    var currentIndex: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        currentIndex = AplicationRuntime.sharedManager.getIndex(forCourse: .PLC)
        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        
        leaders_table.delegate = self
        leaders_table.dataSource = self
        
        //Se agrega observable para desplazar vista cuando se muestra/oculta el teclado
        NotificationCenter.default.removeObserver(Any.self)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - Métodos para el control de eventos del teclado
    //Observer for increment contentSize of the scroll
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            leaders_table.contentInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        }
    }
    
    //Obeserver for move frame to origin when keyboard is hiden
    @objc func keyboardWillHide(notification: NSNotification) {
        leaders_table.contentInset = UIEdgeInsets.zero
    }
    
    // MARK: - Leaders protocol functions
    func showMessagePopup(message: String, inbold: String?, type: TypeMessage){
        let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.courseMessage) as! CoursesMessagesPopupViewController
        
        nextVC.message = message
        nextVC.inBold = inbold
        nextVC.leadersDelegate = self
        nextVC.typeMessage = type
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }
    
    func previusPage(){
        if ncrAudio != nil && (ncrAudio?.isPlaying)! {
            stopAudio(audio: isPlaying)
        }
        
        guard currentIndex > 0 else { return }
        currentIndex -= 1
        AplicationRuntime.sharedManager.setProgress(forCourse: .PLC, progress: currentIndex)
        
        reloadTable()
    }
    
    func nextPage(){
        if ncrAudio != nil && (ncrAudio?.isPlaying)! {
            stopAudio(audio: isPlaying)
        }
        
        guard currentIndex < maxPageIndex else { return }
        currentIndex += 1
        AplicationRuntime.sharedManager.setProgress(forCourse: .PLC, progress: currentIndex)
        
        reloadTable()
    }
    
    func audioManager(audioID id: Int, play: Bool) {
        let audioName = get_LeadersAudioName(forAudio: id)
        printDebugMessage(tag: audioName)
        play ? playAudio(audio: audioName) : stopAudio(audio: audioName)
    }
    
    // MARK: - Private Functions
    private func playAudio(audio name: String) {
        
        if isPlaying != nullString {
            stopAudio(audio: name)
        }
        
        if let path = Bundle.main.path(forResource: name, ofType:"mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                ncrAudio = try AVAudioPlayer(contentsOf: url)
                ncrAudio?.play()
                ncrAudio?.delegate = self
                isPlaying = name
            } catch {
                mainDelegate?.showMessageInMain(withMessage: Strings.error_play_audio)
            }
        }
        else {
            mainDelegate?.showMessageInMain(withMessage: Strings.error_no_audio)
        }
    }
    
    private func stopAudio(audio name: String) {
        if let path = Bundle.main.path(forResource: name, ofType:"mp3") {
            let url = URL(fileURLWithPath: path)
            
            do {
                ncrAudio = try AVAudioPlayer(contentsOf: url)
                ncrAudio?.stop()
                ncrAudio?.delegate = self
                isPlaying = nullString
            } catch {
                mainDelegate?.showMessageInMain(withMessage: Strings.error_play_audio)
            }
        }
        else {
            mainDelegate?.showMessageInMain(withMessage: Strings.error_no_audio)
        }
    }
    
    private func reloadTable() {
        let indexPath = IndexPath(row: 0, section: 0)
        leaders_table.scrollToRow(at: indexPath, at: .top, animated: true)
        leaders_table.reloadData()
    }
    
    // MARK: - AVAudioPlayer Delegate
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        leaders_table.reloadData()
    }
    
    // MARK: - TableView delegate and datasource
    
    // Número de secciones de la tabla
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Número de filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    // Se agrega la propiedad para ajustar el tamaño de la celda al contenido
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 480
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell: LeaderTableViewCell
        printDebugMessage(tag: "LEADERS INDEX: \(currentIndex + 1)")
        
        if currentIndex == LEADERS_INDEX.LEADERS_01.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_01, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader01()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_02.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_02, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader02()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_03.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_03, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader03()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_04.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_04, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader04()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_05.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_05, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader05()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_06.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_06, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader06()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_07.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_07, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader07()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_08.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_08, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader08()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_09.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_09, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader09()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_10.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_10, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            
            cell.fillLeader10()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_11.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_11, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader11()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_12.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_12, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader12()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_13.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_13, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader13()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_14.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_14, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader14()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_15.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_15, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader15()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_16.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_16, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader16()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_17.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_17, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader17()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_18.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_18, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader18()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_19.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_19, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader19()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_20.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_20, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader20()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_21.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_21, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader21()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_22.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_22, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader22()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_23.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_23, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader23()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_24.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_24, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader24()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_25.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_25, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader25()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_26.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_26, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader26()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_27.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_27, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader27()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_28.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_28, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader28()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_29.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_29, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader29()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_30.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_30, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader30()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_31.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_31, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader31()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_32.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_32, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader32()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_33.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_33, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader33()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_34.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_34, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader34()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_35.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_35, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader35()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_36.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_36, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader36()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_37.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_37, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader37()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_38.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_38, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader38()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_39.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_39, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader39()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_40.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_40, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader40()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_41.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_41, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader41()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_42.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_42, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader42()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_43.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_43, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader43()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_44.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_44, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader44()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_45.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_45, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader45()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_46.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_46, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader46()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_47.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_47, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader47()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_48.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_48, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader48()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_49.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_49, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader49()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_50.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_50, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader50()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_51.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_51, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader51()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_52.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_52, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader52()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_53.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_53, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader53()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_54.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_54, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader54()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_55.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_55, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader55()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_56.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_56, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader56()
            return cell
        }
        else if currentIndex == LEADERS_INDEX.LEADERS_57.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_57, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader57()
            return cell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_58, for: indexPath) as! LeaderTableViewCell

            cell.leadersDelegate = self
            cell.fillLeader58()
            return cell
        }
    }
}
