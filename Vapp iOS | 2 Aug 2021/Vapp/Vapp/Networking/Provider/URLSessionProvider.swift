//
//  URLSessionProvider.swift
//

import Foundation

final class URLSessionProvider: ProviderProtocol {
    
    // MARK: Dependency
    
    private var session: URLSessionProtocol
    
    // MARK: Properties
    
    private var request: URLRequest?
    private var task: URLSessionDataTask?
    private var dataTaskCompletion: ((Data?, URLResponse?, Error?) -> Void)?
    
    // MARK: Initialization
    
    init(session: URLSessionProtocol = URLSession.shared) {
        self.session = session
    }
    
    // MARK: Methods
    
    @discardableResult
    func request<Response>(from apiService: APIServiceProtocol,
                           responseType: Response.Type,
                           completion: @escaping Server<Response>) -> URLSessionDataTask where Response: Decodable {
        
        request = URLRequest(apiService: apiService)
        
        dataTaskCompletion = { data, response, error in
            let httpResponse = response as? HTTPURLResponse
            
            DispatchQueue.main.async {
                self.handleResponse(data: data, response: httpResponse, error: error, completion: completion)
            }
        }
        
        task = session.dataTask(request: request!, completionHandler: dataTaskCompletion!)
        task!.resume()
        
        return task!
    }
    
    private func handleResponse<Response: Decodable>(data: Data?, response: HTTPURLResponse?, error: Error?, completion: @escaping Server<Response>) {
        
        guard error == nil else { return completion(.failure(.unknown)) }
        guard let response = response else { return completion(.failure(.noJSONData)) }
        guard let data = data else { return completion(.failure(.unknown)) }
        
        switch response.statusCode {
        case 200...299:
                                
            do {
                let model = try JSONDecoder().decode(Response.self, from: data)
                completion(.success(model))
            } catch let error {
                print(error)
                completion(.failure(.decodingError))
            }
            
        case 401:       return completion(.failure(.authenticationError))
        case 400...499: return completion(.failure(.badRequest))
        case 500...599: return completion(.failure(.serverSideError))
            
        default:
            completion(.failure(.unknown))
        }
    }
    
}
