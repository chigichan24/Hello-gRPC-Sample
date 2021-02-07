import Foundation
import UIKit
import Lottie
import LineSDK

final class TopViewController: UIViewController {

    private let animationView = AnimationView()
    private let buttonView = LoginButton()

    override func viewDidLoad() {
        let baseView = UIView()
        baseView.backgroundColor = UIColor(named: "Background")
        baseView.frame = view.frame
        baseView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(baseView)
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        setupAnimationView()
        setupButtonView()
    }

    private func setupAnimationView() {
        guard let animation = Animation.named("hello") else {
            return
        }
        animationView.animation = animation
        animationView.frame = CGRect(origin: .zero, size: view.bounds.size)
        view.addSubview(animationView)
        animationView.loopMode = .loop
        animationView.play()

        animationView.backgroundBehavior = .pauseAndRestore
        animationView.translatesAutoresizingMaskIntoConstraints = false
        [
            animationView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            animationView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            animationView.rightAnchor.constraint(equalTo: view.rightAnchor),
            animationView.topAnchor.constraint(equalTo: view.topAnchor),
        ].forEach { $0.isActive = true }
    }

    private func setupButtonView() {
        buttonView.delegate = self
        buttonView.permissions = [.profile]
        buttonView.presentingViewController = self
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonView)
        [
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            buttonView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
        ].forEach { $0.isActive = true }
    }
}

extension TopViewController: LoginButtonDelegate {
    func loginButton(_ button: LoginButton, didSucceedLogin loginResult: LoginResult) {
        print("Login Succeeded.")
    }

    func loginButton(_ button: LoginButton, didFailLogin error: LineSDKError) {
        let dialog = UIAlertController(title: "ログイン失敗", message: "認証に失敗しました", preferredStyle: .alert)
        dialog.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(dialog, animated: true, completion: nil)
    }

    func loginButtonDidStartLogin(_ button: LoginButton) {
    }
}
