import Swinject

final class DataAssembly: Assembly {
    func assemble(container: Container) {
        container.register(ApiClient.self) { _ in
            ApiClientImpl()
        }.inObjectScope(.container)
    }
}
