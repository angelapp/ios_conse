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
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Leaders protocol functions
    func showMessagePopup(message: String, inbold: String?, type: TypeMessage){
        let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.courseMessage) as! CoursesMessagesPopupViewController
        
        nextVC.message = message
        nextVC.inBold = inbold
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
    
    func audioManager(audioID id: AUDIO_ID, play: Bool) {
        let audioName = getAudioName(forAudio: id)
        play ? playAudio(audio: audioName) : stopAudio(audio: audioName)
    }
    
    // MARK: - Private Functions
    private func playAudio(audio name: String) {
        
        if isPlaying != nullString {
            stopAudio(audio: name)
        }
        
        if let path = Bundle.main.path(forResource: name, ofType:nil) {
            let url = URL(fileURLWithPath: path)
            
            do {
                ncrAudio = try AVAudioPlayer(contentsOf: url)
                ncrAudio?.play()
                ncrAudio?.delegate = self
                isPlaying = name
            } catch {
                print("couldn't load file :(")
            }
            
        }
    }
    
    private func stopAudio(audio name: String) {
        if let path = Bundle.main.path(forResource: name, ofType:nil) {
            let url = URL(fileURLWithPath: path)
            
            do {
                ncrAudio = try AVAudioPlayer(contentsOf: url)
                ncrAudio?.stop()
                ncrAudio?.delegate = self
                isPlaying = nullString
            } catch {
                // couldn't load file :(
            }
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
        
        if currentIndex == PLC_INDEX.LEADERS_1.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_01, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader01()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_2.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_02, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader02()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_3.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_03, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader03()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_4.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_04, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader04()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_5.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_05, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader05()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_6.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_06, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader06()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_7.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_07, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader07()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_8.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_08, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader08()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_9.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_09, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader09()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_10.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_10, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader10(height: leaders_table.bounds.size.height)
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_11.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_11, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader11()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_12.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_12, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader12()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_13.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_13, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader13()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_14.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_14, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader14()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_15.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_15, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader15()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_16.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_16, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader16()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_17.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_17, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader17()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_18.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_18, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader18()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_19.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_19, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader19()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_20.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_20, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader20()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_21.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_21, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader21()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_22.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_22, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader22()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_23.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_23, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader23()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_24.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_24, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader24()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_25.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_25, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader25()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_26.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_26, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader26()
            return cell
        }
        else if currentIndex == PLC_INDEX.LEADERS_27.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_27, for: indexPath) as! LeaderTableViewCell
            
            cell.leadersDelegate = self
            cell.fillLeader27(height: leaders_table.bounds.size.height)
            return cell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.LEADERS_58, for: indexPath) as! LeaderTableViewCell

            cell.leadersDelegate = self
//            cell.fillLeader58(height: leaders_table.bounds.size.height)
            return cell
        }
    }
}
