//
//  UIImageViewModeScaleAspect.m
//
// http://www.viviencormier.fr/
//
//  Created by Vivien Cormier on 02/05/13.
//  Copyright (c) 2013 Vivien Cormier. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageViewModeScaleAspect : UIView

@property(nonatomic, strong) UIImage *image;

#pragma mark - Automatic Animate


- (void)animateToScaleAspectFitToFrame:(CGRect)frame
                          WithDuration:(float)duration
                            afterDelay:(float)delay;


- (void)animateToScaleAspectFillToFrame:(CGRect)frame
                           WithDuration:(float)duration
                             afterDelay:(float)delay;


- (void)animateToScaleAspectFitToFrame:(CGRect)frame
                          WithDuration:(float)duration
                            afterDelay:(float)delay
                            completion:(void (^)(BOOL finished))completion;

- (void)animateToScaleAspectFillToFrame:(CGRect)frame
                           WithDuration:(float)duration
                             afterDelay:(float)delay
                             completion:(void (^)(BOOL finished))completion;

#pragma mark - Manual Animate

#pragma mark - - Init Function


- (void)initToScaleAspectFitToFrame:(CGRect)newFrame;


- (void)initToScaleAspectFillToFrame:(CGRect)newFrame;

#pragma mark - - Animatic Function

/**
 *  Animatic Fucntion Fit
 */
- (void)animaticToScaleAspectFit;

/**
 *  Animatic Function Fill
 */
- (void)animaticToScaleAspectFill;

#pragma mark - - Last Function

/**
 *  Last Function Fit
 */
- (void)animateFinishToScaleAspectFit;

/**
 *  Last Function Fill
 */
- (void)animateFinishToScaleAspectFill;

@end
