//
//  NetworkingViewController.swift
//  Perfection
//
//  Created by Владимир Рузавин on 11/22/21.
//

import Foundation
import Alamofire

class NetworkingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //sendGetRequest()
        
        //sendGetRequestURLComponents()
        sendGetRequestAlamofire()
    }
    func sendGetRequestAlamofire() {
   
        let paramters: Parameters = [
                   "q": "München,DE",
                   "appid": "b1b15e88fa797225412429c1c50c122a1"
               ]
               
               SessionManager.custom.request("http://samples.openweathermap.org/data/2.5/forecast", parameters: paramters).responseJSON { response in
                   print(response.value)
                   
               }
    }
    
    
        func sendPostRequestURLComponents() {
            // Конфигурация по умолчанию
                   let configuration = URLSessionConfiguration.default

                   // собственная сессия
                   let session =  URLSession(configuration: configuration)
                   
                   // создаем конструктор для url
                   var urlConstructor = URLComponents()
                   // устанавливаем схему
                   urlConstructor.scheme = "http"
                   // устанавливаем хост
                   urlConstructor.host = "jsonplaceholder.typicode.com"
                   // путь
                   urlConstructor.path = "/posts"
                   // параметры для запроса
                   urlConstructor.queryItems = [
                       URLQueryItem(name: "title", value: "foo"),
                       URLQueryItem(name: "body", value: "bar"),
                       URLQueryItem(name: "userId", value: "1")
                   ]
                   
            guard let url = urlComps.url else { return }
            
                   // создаем запрос
                   var request = URLRequest(url: urlConstructor.url!)
                   // указываем метод
                   request.httpMethod = "POST"
            
                   // задача для запуска
                   let task = session.dataTask(with: request) { (data, response, error) in
                   // в замыкании данные, полученные от сервера, мы преобразуем в json
                       
                       guard let data = data else { return }
                       
                       let json = try? JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments)
                   // выводим в консоль
                       print(json)
                   }
                   // запускаем задачу
                   task.resume()
        }
    }
    
    func sendGetRequestURLComponents() {
        // Конфигурация по умолчанию
                let configuration = URLSessionConfiguration.default
        // собственная сессия
                let session =  URLSession(configuration: configuration)
                var urlComps = URLComponents()
        urlComps.scheme = "http"
        // устанавливаем хост
                urlComps.host = "samples.openweathermap.org"
        // путь
        urlComps.path = "/data/2.5/forecast"
      // параметры для запроса
              urlComps.queryItems = [
                  URLQueryItem(name: "q", value: "München,DE"),
                  URLQueryItem(name: "appid", value: "b1b15e88fa797225412429c1c50c122a1")
              ]
              
      // задача для запуска
              let task = session.dataTask(with: urlComps.url!) { (data, response, error) in
      // в замыкании данные, полученные от сервера, мы преобразуем в json
                  let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
      // выводим в консоль
                  print(json)
              }
      // запускаем задачу
              task.resume()

        // создаем url из строки
                let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1")
                
        // задача для запуска
                let task = session.dataTask(with: url!) { (data, response, error) in
        // в замыкании данные, полученные от сервера, мы преобразуем в json
                    let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
        // выводим в консоль
                    print(json)
                }
        // запускаем задачу
                task.resume()

        
        guard let url = URL(string: "http://samples.openweathermap.org/data/2.5/forecast?q=Moscow,DE&appid=b1b15e88fa797225412429c1c50c122a1") else { return }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { data, response, error in
            
            let json = try? JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.allowFragments)
                        print(json as Any)
                    }
                    task.resume()
    }
