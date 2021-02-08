import Foundation
import UIKit
import RxSwift
import RxCocoa

protocol WorkspaceViewModelInputs {
    var screenName: PublishRelay<String> { get }
}

protocol WorkspaceViewModelOutputs {
    var message: Driver<String> { get }
}

protocol WorkspaceViewModelTypes {
    var inputs: WorkspaceViewModelInputs { get }
    var outputs: WorkspaceViewModelOutputs { get }
}

final class WorkspaceViewModel: WorkspaceViewModelTypes, WorkspaceViewModelInputs, WorkspaceViewModelOutputs {

    private let bag = DisposeBag()

    // inputs properties
    var inputs: WorkspaceViewModelInputs { return self }
    var screenName = PublishRelay<String>()
    private var screenNameDriver:  Driver<String>

    // outputs properties
    var outputs: WorkspaceViewModelOutputs { return self }
    var message: Driver<String> {
        get {
            messageRelay.asDriver(onErrorJustReturn: "error")
        }
    }
    private let messageRelay = BehaviorRelay<String>(value: "")

    private let repository: AppRepository

    init(
        repository: AppRepository
    ) {
        self.repository = repository
        screenNameDriver = screenName.asDriver(onErrorJustReturn: "error")
        self.initOutputs()
    }

    func initOutputs() {
        self.screenNameDriver.asObservable()
            .subscribe(onNext: {[unowned self] name in
                repository.composeHello(name: name)
                    .subscribe(onSuccess: { [unowned self] replay in
                        self.messageRelay.accept(replay)
                    }).disposed(by: self.bag)
            }).disposed(by: self.bag)
    }
}
