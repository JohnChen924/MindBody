//
//  scene.swift
//  Test
//
//  Created by John Chen on 2/12/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Guard to ensure the scene is of type UIWindowScene
        guard let windowScene = (scene as? UIWindowScene) else { return }

        // Initialize the view controller you want to display first
        let initialViewController = Page2() // Replace Page2 with your initial view controller

        // Embed the initialViewController in a UINavigationController
        let navigationController = UINavigationController(rootViewController: initialViewController)

        // Create a UIWindow using the windowScene and assign the navigationController as its rootViewController
        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = navigationController // Set the UINavigationController as the root

        self.window = window
        window.makeKeyAndVisible() // Make the window key and visible
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
}

