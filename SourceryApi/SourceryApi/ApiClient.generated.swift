// Generated using Sourcery 0.16.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import Foundation
struct ApiClient: ApiClientProtocol {
    private let builder: URLBuilder

    init() {
        builder = try! URLBuilder(baseUrl: "https://puc-dam-todolist.herokuapp.com")
    }

    func fetchAll(completion: @escaping ((Result<[Todo], Error>) -> Void)) {
        let url = builder
            .set(path: "/todo1")
            .set(httpMethod: .get)
            .set(httpHeader: HttpHeader(key: "Authorization", value: "Bearer VJx3SaJSQXbeL3Q7ymGy4QKu3XzesHDzoaTNJwXqhLQ="))
            .build()

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            let response = try! JSONDecoder().decode([Todo].self, from: data)
            completion(.success(response))
        }.resume()
    }
    func get(byId id: Int, completion: @escaping ((Result<Todo, Error>) -> Void)) {
        let url = builder
            .set(path: "/todo/\(id)")
            .set(httpMethod: .post)
            .set(httpHeader: HttpHeader(key: "Authorization", value: "Bearer VJx3SaJSQXbeL3Q7ymGy4QKu3XzesHDzoaTNJwXqhLQ="))
            .build()

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                completion(.failure(error!))
                return
            }
            let response = try! JSONDecoder().decode(Todo.self, from: data)
            completion(.success(response))
        }.resume()
    }
}
