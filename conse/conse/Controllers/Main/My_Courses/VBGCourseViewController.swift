//
//  VBGCourseViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 17/01/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit
import AVFoundation
import ObjectMapper

class VBGCourseViewController: UIViewController, VBGProtocol, UITableViewDelegate, UITableViewDataSource, AVAudioPlayerDelegate {

    // MARK: - Outlets
    @IBOutlet weak var vbg_table: UITableView!
    
    // MARK: - Properties
    var ncrAudio: AVAudioPlayer?
    var mainDelegate: MainProtocol?
    var isPlaying = nullString
    let maxPageIndex: Int = 55
    var currentIndex: Int = 0
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        currentIndex = AplicationRuntime.sharedManager.getIndex(forCourse: .VBG)
        mainDelegate = AplicationRuntime.sharedManager.mainDelegate
        
        vbg_table.delegate = self
        vbg_table.dataSource = self
        
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
            vbg_table.contentInset = UIEdgeInsetsMake(0, 0, keyboardSize.height, 0)
        }
    }
    
    //Obeserver for move frame to origin when keyboard is hiden
    @objc func keyboardWillHide(notification: NSNotification) {
        vbg_table.contentInset = UIEdgeInsets.zero
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
        nextVC.vbgDelegate = self
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
    
    func audioManager(audioID id: Int, play: Bool) {
        let audioName = get_VBGAudioName(forAudio: id)
        play ? playAudio(audio: audioName) : stopAudio(audio: audioName)
    }
    
    /// Envia al servidor los datos de la actividad completada
    func sendRequest(formModel: Array<RequestCompleted>) {
        
        let loader = LoadingOverlay(text: Strings.loader_recording)
        let json = Mapper().toJSONString(formModel, prettyPrint: true)
        let token = NetworkConfig.token + AplicationRuntime.sharedManager.getUserToken()
        let apiURL = NetworkPOST.USER_PROGRESS_LIST
        let method: NetworkRestMethods = .methodPOST
        
        var headers:[[String:String]] = []
        headers.append([NetworkConfig.headerName: NetworkConfig.headerAuthorization,
                        NetworkConfig.headerValue: token])
        
        loader.showOverlay(view: self.view)
        self.view.isUserInteractionEnabled = false
        
        Network.buildRequest(urlApi: apiURL, json: json, extraHeaders: headers, method: method, completion: { (response) in
            
            loader.hideOverlayView()
            self.view.isUserInteractionEnabled = true
            
            switch response {
                
            case .succeeded(let succeed, let message):
                if !succeed {
                    printDebugMessage(tag: message)
                    self.showErrorMessage(withMessage: message)
                }
                break
                
            case .error(let error):
                print(error.debugDescription)
                break
                
            default:
                break
            }
        })
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
        vbg_table.scrollToRow(at: indexPath, at: .top, animated: true)
        vbg_table.reloadData()
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
        printDebugMessage(tag: "VBG INDEX: \(currentIndex + 1)")
        
        // MODULO 0
        if currentIndex == VBG_INDEX.VBG_01.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_01, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_01()
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_02.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_02, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_02()
            return cell
        }
        // MODULO 1
        else if currentIndex == VBG_INDEX.VBG_03.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_03, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_03()
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_04.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_04, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_04()
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_05.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_05, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_05()
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_06.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_06, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_06()
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_07.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_07, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_07()
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_08.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_08, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_08()
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_09.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_09, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_09()
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_10.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_10, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_10()
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_11.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_11, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_11()
            
            return cell
        }
        else if currentIndex == VBG_INDEX.VBG_12.rawValue {
            cell = tableView.dequeueReusableCell(withIdentifier: CellsId.VBG_12, for: indexPath) as! VBGTableViewCell
            
            cell.vbgDelegate = self
            cell.fill_VBG_12()
            
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
            cell.fill_VBG_16()
            
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
            cell.fill_VBG_35()

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
            cell.fill_VBG_46()

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
            cell.fill_VBG_55()

            return cell
        }
    }
}
