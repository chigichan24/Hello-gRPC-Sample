import Foundation
import UIKit
import Lottie
import LineSDK
import RxSwift
import RxCocoa

final class WorkspaceViewController: UIViewController {

    private let viewModel: WorkspaceViewModelTypes
    private var screenName: String? = nil
    private var profileUrl: URL? = nil

    private let serverLabel = UITextView()
    private let serverMessage = UITextView()
    private let bag = DisposeBag()

    static func getVC(
        screenName: String,
        profileUrl: URL?
    ) -> UIViewController {
        let nextVC = DefaultContainer.shared.resolve(WorkspaceViewController.self)!
        nextVC.screenName = screenName
        nextVC.profileUrl = profileUrl
        return nextVC
    }

    init(
        viewModel: WorkspaceViewModelTypes
    ) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        let baseView = UIView()
        baseView.backgroundColor = UIColor(named: "WorkspaceBackground")
        baseView.frame = view.frame
        baseView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(baseView)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupFromServerLabel()
        setupFromServerText()
        setupInputOutput()
    }

    private func setupInputOutput() {
        guard let name = self.screenName else {
            return
        }
        Signal<String>.just(name).emit(onNext: {[unowned self] name in
            self.viewModel.inputs.screenName.accept(name)
        }).disposed(by: bag)
        self.viewModel.outputs.message.drive(serverMessage.rx.text).disposed(by: self.bag)
    }

    private func setupFromServerLabel() {
        serverLabel.text = "From Server Message"
        serverLabel.textAlignment = .center
        serverLabel.backgroundColor = UIColor(named: "WorkspaceBackground")
        serverLabel.font = UIFont(name: "Academy Engraved LET", size: 20.0)
        serverLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(serverLabel)

        [
            serverLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            serverLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60),
            serverLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            serverLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            serverLabel.heightAnchor.constraint(equalToConstant: 30)
        ].forEach { $0.isActive = true }
    }

    private func setupFromServerText() {
        serverMessage.text = ""
        serverMessage.textAlignment = .center
        serverMessage.backgroundColor = UIColor(named: "WorkspaceBackground")
        serverMessage.font = UIFont(name: "Times New Roman", size: 16.0)
        serverMessage.layer.borderColor = UIColor.black.cgColor
        serverMessage.layer.borderWidth = 0.5
        serverMessage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(serverMessage)

        [
            serverMessage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            serverMessage.topAnchor.constraint(equalTo: serverLabel.topAnchor, constant: 60),
            serverMessage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            serverMessage.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -30),
            serverMessage.heightAnchor.constraint(equalToConstant: 120)
        ].forEach { $0.isActive = true }
    }
}
