// sourcery: baseUrl = "https://puc-dam-todolist.herokuapp.com"
// sourcery: token = "VJx3SaJSQXbeL3Q7ymGy4QKu3XzesHDzoaTNJwXqhLQ="
protocol ApiClientProtocol: AutoRequestable {
    // sourcery: path = "/todo1"
    // sourcery: method = .get
    // sourcery: contentType = "application/json"
    // sourcery: response = [Todo]
    func fetchAll(completion: @escaping ((Result<[Todo], Error>) -> Void))

    // sourcery: path = "/todo/\(id)"
    // sourcery: method = .post
    // sourcery: contentType = "application/json"
    // sourcery: response = Todo
    func get(byId id: Int, completion: @escaping ((Result<Todo, Error>) -> Void))
}
