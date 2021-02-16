import UIKit

final class FadeTransition: NSObject, UIViewControllerTransitioningDelegate {

    let transitionDuration: TimeInterval

    init(transitionDuration: TimeInterval) {
        self.transitionDuration = transitionDuration
    }

    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let presentationController = UIPresentationController(presentedViewController: presented, presenting: presenting)

        return presentationController
    }

    // MARK: - Animation
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeAnimation(isPresentation: true, transitionDuration: transitionDuration)
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return FadeAnimation(isPresentation: false, transitionDuration: transitionDuration)
    }
}

