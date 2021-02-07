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

    var screenName = PublishRelay<String>()
    private let screenNameDriver:  Driver<String>

    let message: Driver<String> = Single.just("").asDriver(onErrorJustReturn: "error")

    var inputs: WorkspaceViewModelInputs { return self }
    var outputs: WorkspaceViewModelOutputs { return self }

    init() {
        screenNameDriver = screenName.asDriver(onErrorJustReturn: "error")
        screenNameDriver.asObservable()
            .subscribe(onNext: {name in
                print("[debug] \(name)")
            }).disposed(by: self.bag)

    }

}
