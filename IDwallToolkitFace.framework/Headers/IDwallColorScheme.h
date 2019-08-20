//
//  IDwallColorScheme.h
//  IDwallToolkit
//
//  Created by IDwall on 03/08/2018.
//  Copyright © 2018 IDwall. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "IDwallColorState.h"


@protocol IDwallColorScheme
@required
- (UIColor*) backgroundColor;
- (UIColor*) textColorForState: (IDwallColorState) state;
- (UIColor*) iconColorForState: (IDwallColorState) state;
- (UIColor*) buttonBackgroundColorForState: (IDwallColorState) state;
- (UIColor*) buttonTintColorForState: (IDwallColorState) state;
- (UIColor*) cancelButtonBackgroundColorForState: (IDwallColorState) state;
- (UIColor*) cancelButtonTintColorForState: (IDwallColorState) state;
- (UIColor*) navigationTitleColor;
- (UIColor*) backButtonColor;
- (UIColor*) topSplitBackgroundColor;
- (UIColor*) bottomSplitBackgroundColor;
- (bool) isBackgroundSplited;
- (UIColor*) titleColor;
- (UIColor*) subtitleColor;
- (UIColor*) topSplitIconColor;
- (UIColor*) bottomSplitIconColor;
- (UIColor*) popUpBackgroundColor;
- (UIColor*) popUpTextColor;
- (UIColor*) popUpButtonTintColorForState: (IDwallColorState) state;
- (UIColor*) popUpButtonBackgroundColorForState: (IDwallColorState) state;
- (UIColor*) popUpIconColorForState: (IDwallColorState) state;
- (UIColor*) confirmQuestionTextColor;

@end
