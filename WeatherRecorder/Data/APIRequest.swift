//
//  APIRequest.swift
//  WeatherRecorder
//
//  Created by sw on 2023/03/02.
//

import Foundation


class APIRequest<DataType> where DataType: ResponseEntityProtocol {

    
    static func requestGet(url: String) async -> DataType? {
           
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        do{
            let (data, _) = try await URLSession.shared.data(for: request)
            
            if data.isEmpty {
                print("Error: Did not receive data")
                return nil
            }
            
//            let str = String(decoding: data, as: UTF8.self)
//            print(str)
            
            guard let output = try? JSONDecoder().decode(DataType.self, from: data) else {
                print("Error: JSON Data Parsing failed")
                return nil
            }
            
            return output
            
        } catch {
            print("some err..")
            return nil
        }
    }
    
    static func requestPost(url: String, method: String, param: [String: Any]) async -> DataType? {
           
        let sendData = try! JSONSerialization.data(withJSONObject: param, options: [])
            
        guard let url = URL(string: url) else {
            print("Error: cannot create URL")
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = sendData
        
        do{
            let (data, response) = try await URLSession.shared.data(for: request)
            
            let _ = response as? HTTPURLResponse
            
            
            
            if data.isEmpty {
                print("Error: Did not receive data")
                return nil
            }
            
            guard let output = try? JSONDecoder().decode(DataType.self, from: data) else {
                print("Error: JSON Data Parsing failed")
                return nil
            }
            
            return output
            
        } catch {
            print("some err..")
            return nil
        }

    }
    
    
    
    static func request(_ url: String, _ method: String, _ param: [String: Any]? = nil) async -> DataType? {
        
        var response: DataType?
        
        if method == "GET" {
            response = await requestGet(url: url)
        }
        else {
            response = await requestPost(url: url, method: method, param: param!)
        }
        
        return response
    }
}
