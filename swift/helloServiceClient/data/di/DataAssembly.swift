import GRPC
import NIO
import Swinject

final class DataAssembly: Assembly {
    func assemble(container: Container) {
        container.register(Pb_HelloServiceClientProtocol.self) { _ in
            let group = MultiThreadedEventLoopGroup(numberOfThreads: 1)
            let channel = ClientConnection
                .insecure(group: group)
                .connect(host: "REQUEST_HOST_NAME", port: 5300)
            return Pb_HelloServiceClient(
                channel: channel
            )
        }.inObjectScope(.container)

        container.register(ApiClient.self) { _ in
            ApiClientImpl(
                client: container.resolve(Pb_HelloServiceClientProtocol.self)!
            )
        }.inObjectScope(.container)
    }
}
