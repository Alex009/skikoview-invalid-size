import UIKit
import SwiftUI
import shared

struct ComposeView: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> UIViewController {
        let tabs = UITabBarController()
        
        let tab1 = UINavigationController(
            rootViewController: NativeUI()
        )
        tab1.tabBarItem = UITabBarItem(
            title: "tab1",
            image: UIImage(systemName: "pencil.and.outline"),
            tag: 1
        )
        
        let tab2 = UINavigationController()
        tab2.viewControllers = [
            Main_iosKt.MainViewController(),
            Main_iosKt.MainViewController(),
            Main_iosKt.MainViewController()
        ]
        tab2.tabBarItem = UITabBarItem(
            title: "tab2",
            image: UIImage(systemName: "pencil.and.outline"),
            tag: 2
        )
        
        tabs.viewControllers = [tab1, tab2]
        
        return tabs
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

struct ContentView: View {
    var body: some View {
        ComposeView()
                .ignoresSafeArea(.all, edges: .bottom) // Compose has own keyboard handler
    }
}


class NativeUI: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let label = UILabel()
        label.text = "Hello"
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        view.addConstraints([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
