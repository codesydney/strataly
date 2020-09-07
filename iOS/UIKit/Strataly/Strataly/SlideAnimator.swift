//
//  CustomAnimator.swift
//  Strataly
//
//  Created by Gustavo E M Cabral on 25/4/20.
//  Copyright © 2020 Gustavo Eulalio. All rights reserved.
//

import UIKit

class SlideAnimator : NSObject, UIViewControllerAnimatedTransitioning
{
	var duration: TimeInterval
	var pushing: Bool

	init(duration : TimeInterval, pushing : Bool)
	{
		self.duration = duration
		self.pushing = pushing
	}
	
	func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
	{
		let container = transitionContext.containerView
		
		guard let fromView = transitionContext.view(forKey: UITransitionContextViewKey.from) else { return }
		guard let toView = transitionContext.view(forKey: UITransitionContextViewKey.to) else { return }
		
		if pushing
		{
			container.addSubview(toView)
			
			toView.frame = CGRect(x: 0, y: fromView.frame.height, width: toView.frame.width, height: toView.frame.height)
			
			UIView.animate(withDuration: duration, animations: {
				toView.frame = fromView.frame
				fromView.frame = CGRect(x: 0, y: -fromView.frame.height, width: toView.frame.width, height: toView.frame.height)
			}, completion: { (finished) in
				transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
			})
		} else {
			
			container.insertSubview(toView, belowSubview: fromView)
			
			UIView.animate(withDuration: duration, animations: {
				toView.frame = fromView.frame
				fromView.frame = CGRect(x: 0, y: fromView.frame.height, width: toView.frame.width, height: toView.frame.height)
			}, completion: { (finished) in
				transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
			})
		}
	}
	
	func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval
	{ return duration }
}
