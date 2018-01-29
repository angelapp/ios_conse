//
//  VBGCourseViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 17/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import AVFoundation

class VBGCourseViewController: UIViewController, VBGProtocol, UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var vbg_table: UITableView!
    
    // MARK: - Properties
    var ncrAudio: AVAudioPlayer?
    
    var isPlaying = nullString
    let maxPageIndex: Int = 55
    var currentIndex: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        currentIndex = AplicationRuntime.sharedManager.getIndex(forCourse: .VBG)
//        if currentIndex == VBG_INDEX.M1COMPLET.rawValue { currentIndex += 1 }
        
        vbg_table.delegate = self
        vbg_table.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Protocol Access
    func showPopupHelp(title: String, text: String){
        let sb = UIStoryboard(name: StoryboardsId.popup, bundle: nil)
        let nextVC = sb.instantiateViewController(withIdentifier: ViewControllersId.crosswordHelpPopup) as! CrosswordHelpViewController
        
        nextVC.titleText = title
        nextVC.helpText = text
        nextVC.modalPresentationStyle = .overCurrentContext
        nextVC.modalTransitionStyle = .crossDissolve
        present(nextVC, animated: true, completion: nil)
    }
    
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
        AplicationRuntime.sharedManager.setProgress(forCourse: .VBG, progress: currentIndex)
        
        reloadTable()
    }
    
    func nextPage(){
        if ncrAudio != nil && (ncrAudio?.isPlaying)! {
            stopAudio(audio: isPlaying)
        }
        
        guard currentIndex < maxPageIndex else { return }
        currentIndex += 1
        AplicationRuntime.sharedManager.setProgress(forCourse: .VBG, progress: currentIndex)
        
        reloadTable()
    }
    
    func audioManager(audioID id: AUDIO_ID, play: Bool) {
        let audioName = getAudioName(forAudio: id)
        play ? playAudio(audio: audioName) : stopAudio(audio: audioName)
    }
    
    // MARK: Private Functions
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
        vbg_table.reloadData()
        vbg_table.setContentOffset(.zero, animated: true)
    }
    
    // MARK: - AVAudioPlayer Delegate
    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully flag: Bool) {
        vbg_table.reloadData()
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
        
        var cell: VBGTableViewCell
        
        // MODULO 0
        if currentIndex == VBG_INDEX.M0P0.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M0P0, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM0P0()
            return cell
        }
        else if currentIndex == VBG_INDEX.M0P1.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M0P1, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM0P1()
            return cell
        }
        // MODULO 1
        else if currentIndex == VBG_INDEX.M1P0.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M1P0, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM1P0()
            return cell
        }
        else if currentIndex == VBG_INDEX.M1P1.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M1P1, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM1P1()
            return cell
        }
        else if currentIndex == VBG_INDEX.M1P2.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M1P2, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM1P2()
            return cell
        }
        else if currentIndex == VBG_INDEX.M1P3.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M1P3, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM1P3()
            return cell
        }
        else if currentIndex == VBG_INDEX.M1P4.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M1P4, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM1P4()
            return cell
        }
        else if currentIndex == VBG_INDEX.M1P5.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M1P5, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM1P5()
            return cell
        }
        else if currentIndex == VBG_INDEX.M1P6.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M1P6, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM1P6()
            return cell
        }
        else if currentIndex == VBG_INDEX.M1P7.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M1P7, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fillM1P7()
            return cell
        }
        else if currentIndex == VBG_INDEX.M1TEST.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M1TEST, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_CROSSWORD()
            
            return cell
        }
        else if currentIndex == VBG_INDEX.M1COMPLET.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M1COMPLETE, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_GLOBE_M1(height: self.vbg_table.bounds.size.height)
            
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_13.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_13, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_13()
            
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_14.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_14, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_14()
            
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_15.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_15, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_15()
            
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_16.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_16, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_16(height: self.vbg_table.bounds.size.height)
            
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_17.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_17, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_17()
            
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_18.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_18, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_18()
            
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_19.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_19, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_19()
            
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_20.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_20, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_20()
            
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_21.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_21, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_21()
            
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_22.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_22, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_22()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_23.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_23, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_23()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_24.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_24, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_24()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_25.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_25, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_25()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_26.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_26, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_26()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_27.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_27, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_27()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_28.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_28, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_28()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_29.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_29, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_29()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_30.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_30, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_30()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_31.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_31, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_31()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_32.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_32, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_32()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_33.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_33, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_33()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_34.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_34, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_34()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_35.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_35, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_35(height: self.vbg_table.bounds.size.height)

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_36.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_36, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_36()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_37.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_37, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_37()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_38.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_38, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_38()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_39.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_39, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_39()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_40.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_40, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_40()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_41.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_41, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_41()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_42.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_42, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_42()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_43.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_43, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_43()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_44.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_44, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_44()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_45.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_45, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_45()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_46.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_46, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_47()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_47.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_47, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_47()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_48.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_48, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_48()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_49.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_49, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_49()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_50.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_50, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_50()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_51.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_51, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_51()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_52.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_52, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_52()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_53.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_53, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_53()

            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_54.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_54, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_54()

            return cell
        }
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_55, for: indexPath) as! VBGTableViewCell

            cell.vbgDelegate = self
            cell.fill_VBG_55(height: self.vbg_table.bounds.size.height)

            return cell
        }
    }
}
