//
//  NewsViewController.swift
//  conse
//
//  Created by Felipe Zamudio on 7/02/18.
//  Copyright © 2018 NRC. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, NewsProtocol {
    
    // MARK: - Outlets
    @IBOutlet weak var button_collection: UICollectionView!
    @IBOutlet weak var lbl_message: UILabel!
    @IBOutlet weak var table_news: UITableView!
    
    // MARK: - Properties
    var mainDelegate = AplicationRuntime.sharedManager.mainDelegate
    var currentTab: Int = 0
    var cityList: Array<City> = []
    var newsList: Array<NewsCategory> = []
    var newsResponse: Array<NewsCategory> = []
    var expandedSections : NSMutableSet = []

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()

        downloadNews()
        lbl_message.text = nullString
        
        button_collection.delegate = self
        button_collection.dataSource = self
        
        table_news.delegate = self
        table_news.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private Functions
    //Determina la sección de la tabla que fue seleccionada para mostrar el contenido
    @objc func sectionTapped(_ sender: UIButton) {
        let section = sender.tag
        let shouldExpand = !expandedSections.contains(section)
        if (shouldExpand) {
            expandedSections.removeAllObjects()
            expandedSections.add(section)
            
        } else {
            expandedSections.removeAllObjects()
        }
        self.table_news.reloadData()
        viewDidLayoutSubviews()
    }
    
    private func fillView() {
        lbl_message.text = Strings.news_message
    }
    
    /** Get all cities in NewCategory */
    private func getCities() {
        
        var cities: Array<City> = []
        for news_cat in newsResponse {
            for news in news_cat.news_category {
                cities.append(news.city)
            }
        }
        
        cityList = cities.unique{$0.id}
        button_collection.reloadData()
        
        changeCitySelected(inPosition: currentTab)
    }

    /** Filter news by City*/
    private func getNewsByCity(whitID id: Int) {
        
        var newsByCity: Array<NewsCategory> = []
        printDebugMessage(tag: "City id: \(id)")
        
        for news_cat in newsResponse {
            
            var news_aux: Array<News> = []
            for news in news_cat.news_category {
                if news.city.id == id {
                    news_aux.append(news)
                }
            }
            
            let cat = NewsCategory()
            cat.abreviature = news_cat.abreviature
            cat.description = news_cat.description
            cat.icon = news_cat.icon
            cat.id = news_cat.id
            cat.name = news_cat.name
            cat.news_category = news_aux
            
            newsByCity.append(cat)
        }
        
        newsList = newsByCity
        fillView()
        table_news.reloadData()
    }
    
    // MARK: News Protocol functions
    func changeCitySelected(inPosition position: Int) {
        currentTab = position
        button_collection.reloadData()
        printDebugMessage(tag: "City from position \(position)")
        getNewsByCity(whitID: cityList[position].id)
    }
    
    // MARK: - REQUEST
    func downloadNews() {
        
        let json = nullString
        let url = NetworkGET.NEWS
        let headers:[[String:String]] = []
        
        Network.buildRequest(urlApi: url, json: json, extraHeaders: headers, method: .methodGET, completion: { (response) in
            
            switch response {
                
            case .succeeded(let succeed, let message):
                if !succeed, !message.isEmpty {
                    print(message)
                }
                break
                
            case .error(let error):
                print(error.debugDescription)
                break
                
            case .succeededObject(let result):
                
                //Transform object receiver to expected model
                self.newsResponse = arrayTransform(from: result as! Array<Any>)
                self.getCities()
                
                break
                
            default:
                break
            }
        })
    }
    
    // MARK: - Collection view DataSource and FlowLayout Dategate
    // Set number of section in the colection
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //number of the items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    //fill collection
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellsId.newsButtons, for: indexPath) as! NewsButtonsCollectionViewCell
        
        cell.newsDelegate = self
        cell.tab_button.tag = indexPath.row
        cell.tab_button.isSelected = indexPath.row == currentTab
        cell.setButtonTitle(title: cityList[indexPath.row].name)
        
        return cell
    }
    
    //MARK: - TableView DataSource and Delegate
    
    // Número de secciones
    func numberOfSections(in tableView: UITableView) -> Int {
        return newsList.count
    }
    
    // Encabezado de las secciones
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.newsHeader) as! NewsHeaderTableViewCell
        
        cell.lbl_title.text = newsList[section].name
        cell.btn_openClose.addTarget(self, action: #selector(sectionTapped), for: .touchUpInside)
        cell.btn_openClose.tag = section
        cell.btn_openClose.isSelected = expandedSections.contains(section)
        
        return cell
    }
    
    // Auto ajust header height
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Tamaño estimado del header
    func tableView(_ tableView: UITableView, estimatedHeightForHeaderInSection section: Int) -> CGFloat {
        return 64
    }
    
    // Número de filas por sección
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(expandedSections.contains(section)) {
            return newsList[section].news_category.count
        } else {
            return 0
        }
    }
    
    // Auto ajust Row height
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    // Tamaño estimado de las celdas
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    // pintado de la tabla
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CellsId.newsBody) as! NewsBodyTableViewCell
        cell.lbl_title.text = newsList[indexPath.section].news_category[indexPath.row].tittle
        
        return cell
    }
    
    // Action to selected row
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let stringURl = newsList[indexPath.section].news_category[indexPath.row].more_info_link ?? nullString
        let fileURL = stringURl.contains(Strings.hasHTTPProtocol) ? stringURl : Strings.httpProtocol + stringURl
        
        if UIApplication.shared.canOpenURL(URL(string: fileURL)!) {
            
            if #available(iOS 10, *) {
                UIApplication.shared.open(URL(string: fileURL)!)
            }
            else {
                UIApplication.shared.openURL(URL(string: fileURL)!)
            }
            
        }
        else {
            mainDelegate?.showMessageInMain(withMessage: NetworkErrorMessage.notFoundError)
        }
    }
}
