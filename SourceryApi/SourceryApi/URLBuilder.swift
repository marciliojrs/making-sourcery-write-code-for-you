import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
}

typealias HttpHeader = (key: String, value: String)

class URLBuilder {
    enum Error: Swift.Error {
        case invalidBaseUrl
    }

    private var urlComponents: URLComponents
    private var request: URLRequest

    init(baseUrl: String) throws {
        guard let components = URLComponents(string: baseUrl) else { throw Error.invalidBaseUrl }

        urlComponents = components
        request = URLRequest(url: URL(string: baseUrl)!)
    }

    func set(httpMethod: HttpMethod) -> URLBuilder {
        request.httpMethod = httpMethod.rawValue
        return self
    }

    func set(httpHeader: HttpHeader) -> URLBuilder {
        request.addValue(httpHeader.value, forHTTPHeaderField: httpHeader.key)
        return self
    }

    func set(path: String) -> URLBuilder {
        urlComponents.path = path
        return self
    }

    func set(queryItem: URLQueryItem) -> URLBuilder {
        var queryItems = urlComponents.queryItems ?? []
        queryItems.append(queryItem)
        urlComponents.queryItems = queryItems

        return self
    }

    func set(body: Data) -> URLBuilder {
        if request.httpMethod == "POST" {
            request.httpBody = body
        }

        return self
    }

    func build() -> URLRequest {
        request.url = urlComponents.url
        return request
    }
}
