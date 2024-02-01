import Foundation

extension URLRequest {
    public func fetch() async throws -> (Data, HTTPURLResponse)? {
        do {
            let (data, response) = try await URLSession.shared.data(for: self)
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
                throw NetworkError.error
            }
            return (data, httpResponse)
        } catch {
            throw NetworkError.unknownError
        }
    }
}

extension URL {
    public func fetch() async throws -> (Data, HTTPURLResponse)? {
        try await URLRequest(url: self).fetch()
    }
}

extension String {
    public var url: URL? { URL(string: self) }
}

public enum NetworkError: String, Error {
    case error = "Error"
    case jsonEncodingError = "Json Encoding Error"
    case jsonDecodingError = "Json Decoding Error"
    case invalidUrl = "Invalid Url"
    case unknownError = "Unknown Error"
}

public enum HTTPMethods: String {
    case post = "POST"
    case delete = "DELETE"
    /// DO NOT USE only use if no data is sent
    case get = "GET"
    case put = "PUT"
}

public final class ResponseStatus {
    public static let ok = 200
    public static let internalServerError = 500
    public static let badRequest = 400
    public static let unauthorized = 401
    
    private init() {}
}
