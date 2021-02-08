import RxSwift

final class ApiClientImpl: ApiClient {
    private let client: Pb_HelloServiceClientProtocol

    init(client: Pb_HelloServiceClientProtocol) {
        self.client = client
    }

    func sendHelloMessage(message: String) -> Single<String> {
        return Single.create { evemt in
            let request = Pb_HelloRequest.with {
                $0.name = message
            }
            do {
                let call = self.client.hello(request, callOptions: nil)
                let response = try call.response.wait()
                evemt(.success(response.hello))
            } catch {
                evemt(.error(error))
            }
            return Disposables.create()
        }
    }
}
