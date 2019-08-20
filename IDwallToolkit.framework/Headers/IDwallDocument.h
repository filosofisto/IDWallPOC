//
//  IDwallDocumentDetect.h
//  IDwallToolkit
//
//  Created by IDwall on 03/08/2018.
//  Copyright © 2018 IDwall. All rights reserved.
//

#import <Foundation/Foundation.h>

#if __has_include(<IDwallToolkit/IDwallToolkit.h>)
    #import <IDwallToolkit/IDwallDocumentType.h>
    #import <IDwallToolkit/IDWallDocumentSide.h>
#else
    #import <IDwallToolkitDocument/IDwallDocumentType.h>
    #import <IDwallToolkitDocument/IDWallDocumentSide.h>
#endif



typedef void (^IDwallToolkitImageResult) (bool success,  NSError* _Nullable  error);
typedef void (^IDwallToolkitSendResult) ( NSDictionary* _Nullable  jsonData,  NSError* _Nullable error);

@interface IDwallDocument : NSObject

+ (instancetype _Nonnull)sharedInstance;

- (void)requestDocumentType:(IDwallDocumentType) documentType andDocSide:(IDwallDocumentSide) documentSide andCallback:(IDwallToolkitImageResult _Nullable) callback;

- (void)presentTutorial:(BOOL) presentTutorial;

- (void)sendDocumentDataWithCallback:(IDwallToolkitSendResult _Nullable) callback;

@end

