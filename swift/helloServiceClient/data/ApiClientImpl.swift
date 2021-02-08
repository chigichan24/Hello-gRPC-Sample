import RxSwift

final class ApiClientImpl: ApiClient {
    func sendHelloMessage(message: String) -> Single<String> {
        return Single.just("Hello From ApiClient")
    }
}
