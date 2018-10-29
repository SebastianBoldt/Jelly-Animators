//
//  JellyAnimatorSpec.swift
//  Jelly
//
//  Created by Sebastian Boldt on 05.12.16.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Quick
import Nimble
@testable import Jelly

class JellyAnimatorSpec: QuickSpec {
    let presentedViewController = UIViewController()
    let presentingViewController = UIViewController()
    let defaultSlideIn = Jelly.SlideInPresentation()
    let defaultFadeIn = Jelly.FadeInPresentation()
    
    override func spec() {
        describe("After Configuring a JellyAnimator") {
            context("with slide in presentation") {
                it("UIViewControllerTransitioningDelegate should return right animationController for presenting") {
                    let animator = Jelly.Animator(presentation: self.defaultSlideIn)
                    let animationController = animator.animationController(forPresented: self.presentedViewController, presenting: self.presentingViewController, source: self.presentedViewController)
                    expect(animationController is Jelly.SlideInPresentationAnimator).to(equal(true))
                }
            }
            
            context("with fade in presentation") {
                it("UIViewControllerTransitioningDelegate should return right animationController for presenting") {
                    let animator = Jelly.Animator(presentation: self.defaultFadeIn)
                    let animationController = animator.animationController(forPresented: self.presentedViewController, presenting: self.presentingViewController, source: self.presentedViewController)
                    expect(animationController is Jelly.FadeInPresentationAnimator).to(equal(true))
                }
            }
        }
    }
}
