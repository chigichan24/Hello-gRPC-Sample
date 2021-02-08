import GRPC
import NIO
import Swinject

final class DataAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Pb_HelloServiceClientProtocol.self) { _ in
            let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
            #if MOCK
                let testClient = Pb_HelloServiceTestClient()
                testClient.enqueueHelloResponse(Pb_HelloResponse.with {
                    $0.hello = "mock message"
                })
                return testClient
            #else
                let channel = ClientConnection
                    .insecure(group: group)
                    .connect(host: "REQUEST_HOST_NAME", port: 5300)
                return Pb_HelloServiceClient(
                    channel: channel
                )
            #endif
        }.inObjectScope(.container)

        container.register(ApiClient.self) { _ in
            ApiClientImpl(
                client: container.resolve(Pb_HelloServiceClientProtocol.self)!
            )
        }.inObjectScope(.container)
    }
}
