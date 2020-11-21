//
//  FadeAnimation.swift
//  QuranAcademy
//
//  Created by Ayub on 21.11.2020.
//  Copyright © 2020 Quran Academy. All rights reserved.
//

import UIKit

final class FadeAnimation: NSObject {

    // MARK: - Properties
    let isPresentation: Bool
    let transitionDuration: TimeInterval

    // MARK: - Initializers
    init(isPresentation: Bool,
         transitionDuration: TimeInterval) {
        self.isPresentation = isPresentation
        self.transitionDuration = transitionDuration
        super.init()
    }
}

// MARK: - UIViewControllerAnimatedTransitioning
extension FadeAnimation: UIViewControllerAnimatedTransitioning {
    func transitionDuration(
        using transitionContext: UIViewControllerContextTransitioning?
    ) -> TimeInterval {
        return transitionDuration
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let key: UITransitionContextViewControllerKey = isPresentation ? .to : .from
        guard let controller = transitionContext.viewController(forKey: key)
        else { return }

        if isPresentation {
            transitionContext.containerView.addSubview(controller.view)
        }

        let initialAlpha: CGFloat = isPresentation ? 0 : 1
        let finalAlpha: CGFloat = isPresentation ? 1 : 0
        controller.view.alpha = initialAlpha

        let animationDuration = transitionDuration(using: transitionContext)

        UIView.animate(
            withDuration: animationDuration,
            animations: {
                controller.view.alpha = finalAlpha
            }, completion: { finished in
                if !self.isPresentation {
                    controller.view.removeFromSuperview()
                }
                transitionContext.completeTransition(finished)
            })
    }
}
