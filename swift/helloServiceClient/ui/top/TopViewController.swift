import Foundation
import UIKit
import Lottie

final class TopViewController: UIViewController {

    private let animationView = AnimationView()
    private let buttonView = UIButton()

    override func viewDidLoad() {
        let baseView = UIView()
        baseView.backgroundColor = UIColor(named: "Background")
        baseView.frame = view.frame
        baseView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(baseView)
        self.navigationController?.setNavigationBarHidden(true, animated: true)

        setupAnimationView()
        setupNameFormView()
        setupHelloText()
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

    private func setupNameFormView() {
        buttonView.backgroundColor = .black
        buttonView.layer.cornerRadius = 30
        buttonView.setTitle("はじめる", for: UIControl.State.normal)
        buttonView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(buttonView)
        [
            buttonView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            buttonView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            buttonView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            buttonView.heightAnchor.constraint(equalToConstant: 60),
        ].forEach { $0.isActive = true }
    }

    private func setupHelloText() {
        let textView = UITextView()
        textView.text = "Loading..."
        textView.textAlignment = .center
        textView.backgroundColor = UIColor(named: "Background")
        textView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(textView)
        [
            textView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            textView.bottomAnchor.constraint(equalTo: buttonView.topAnchor, constant: -10),
            textView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60),
            textView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -60),
            textView.heightAnchor.constraint(equalToConstant: 30),
        ].forEach { $0.isActive = true }
    }
}
