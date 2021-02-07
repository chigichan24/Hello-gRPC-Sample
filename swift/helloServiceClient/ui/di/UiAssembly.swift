import Swinject

final class UiAssembly: Assembly {
    func assemble(container: Container) {
        container.register(TopViewController.self) { _ in
            TopViewController()
        }

        container.register(WorkspaceViewModelTypes.self) { _ in
            WorkspaceViewModel()
        }

        container.register(WorkspaceViewController.self) { _ in
            WorkspaceViewController(
                viewModel: container.resolve(WorkspaceViewModelTypes.self)!
            )
        }
    }
}
