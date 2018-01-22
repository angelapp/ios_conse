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
    let maxPageIndex: Int = 10
    var currentIndex: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        currentIndex = AplicationRuntime.sharedManager.getIndex(forCourse: .VBG)
        
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
    
    func previusPage(){
        if ncrAudio != nil && (ncrAudio?.isPlaying)! {
            stopAudio(audio: isPlaying)
        }
        
        guard currentIndex > 0 else { return }
        currentIndex -= 1
        AplicationRuntime.sharedManager.setProgress(forCourse: .VBG, progress: currentIndex)
        
        vbg_table.reloadData()
    }
    
    func nextPage(){
        if ncrAudio != nil && (ncrAudio?.isPlaying)! {
            stopAudio(audio: isPlaying)
        }
        
        guard currentIndex < maxPageIndex else { return }
        currentIndex += 1
        AplicationRuntime.sharedManager.setProgress(forCourse: .VBG, progress: currentIndex)
        
        vbg_table.reloadData()
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
                // couldn't load file :(
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
        else {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_M1TEST, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_CROSSWORD()
            
            return cell
        }
    }
}
