//
//  IDwallFace.h
//  IDwallToolkit
//
//  Created by IDwall on 15/08/18.
//  Copyright © 2018 IDwall. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^IDwallToolkitImageResult) (bool success, NSError* _Nullable error);
typedef void (^IDwallToolkitSendResult) (NSDictionary* _Nullable jsonData, NSError* _Nullable error);

@interface IDwallFace : NSObject

+ (instancetype _Nonnull) sharedInstance;

- (void) requestFace:(IDwallToolkitImageResult _Nullable) callback;

- (void) presentTutorial:(BOOL) presentTutorial;

- (void) sendFaceDataWithCallback:(IDwallToolkitSendResult _Nullable) callback;

@end
