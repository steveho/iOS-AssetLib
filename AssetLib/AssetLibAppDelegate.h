//
//  AssetLibAppDelegate.h
//  AssetLib
//
//  Created by Steve Ho on 6/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AssetLibViewController;

@interface AssetLibAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet AssetLibViewController *viewController;

@end
