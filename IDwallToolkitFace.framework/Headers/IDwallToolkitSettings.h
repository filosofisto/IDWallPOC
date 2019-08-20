//
//  IDwallToolkitSettings.h
//  IDwallToolkit
//
//  Created by IDwall on 03/08/2018.
//  Copyright © 2018 IDwall. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<IDwallToolkit/IDwallToolkit.h>)
    #import <IDwallToolkit/IDwallColorScheme.h>
#elif __has_include(<IDwallToolkitDocument/IDwallToolkitDocument.h>)
    #import <IDwallToolkitDocument/IDwallColorScheme.h>
#else
    #import <IDwallToolkitFace/IDwallColorScheme.h>
#endif

@interface IDwallToolkitSettings : NSObject

+ (instancetype _Nonnull)sharedInstance;

- (BOOL)initWithAuthKey:(NSString * _Nonnull)authKey;
- (void)setColorScheme: (id<IDwallColorScheme> _Nonnull) colorScheme;
- (id<IDwallColorScheme>_Nonnull)getColorScheme;

@end
