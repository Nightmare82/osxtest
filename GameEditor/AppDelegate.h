//
//  AppDelegate.h
//  GameEditor
//
//  Created by Martin Mais on 05.04.14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "cocos2d.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (weak) IBOutlet CCGLView *view;

- (IBAction)toggleFullScreen: (id)sender;

@end
