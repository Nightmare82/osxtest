//
//  AppDelegate.m
//  GameEditor
//
//  Created by Martin Mais on 05.04.14.
//  Copyright (c) 2014 Apportable. All rights reserved.
//

#import "cocos2d.h"
#import "AppDelegate.h"
#import "CCBuilderReader.h"
#import "cocos2d-ui.h"
#import "CCBuilderReader.h"


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Configure Cocos2d with the options set in SpriteBuilder
    NSString* configPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Published-iOS"]; // TODO: add support for Published-Android support
    configPath = [configPath stringByAppendingPathComponent:@"configCocos2d.plist"];
    
    NSMutableDictionary* cocos2dSetup = [NSMutableDictionary dictionaryWithContentsOfFile:configPath];
    
    // Note: this needs to happen before configureCCFileUtils is called, because we need apportable to correctly setup the screen scale factor.
#ifdef APPORTABLE
    if([cocos2dSetup[CCSetupScreenMode] isEqual:CCScreenModeFixed])
        [UIScreen mainScreen].currentMode = [UIScreenMode emulatedMode:UIScreenAspectFitEmulationMode];
    else
        [UIScreen mainScreen].currentMode = [UIScreenMode emulatedMode:UIScreenScaledAspectFitEmulationMode];
#endif
    
    
    // Configure CCFileUtils to work with SpriteBuilder
    CCFileUtils *sharedFileUtils = [CCFileUtils sharedFileUtils];
    
    // Setup file utils for use with SpriteBuilder
    [sharedFileUtils setEnableiPhoneResourcesOniPad:NO];
    
    sharedFileUtils.directoriesDict =
    [[NSMutableDictionary alloc] initWithObjectsAndKeys:
     @"resources-tablet", CCFileUtilsSuffixiPad,
     @"resources-tablethd", CCFileUtilsSuffixiPadHD,
     @"resources-phone", CCFileUtilsSuffixiPhone,
     @"resources-phonehd", CCFileUtilsSuffixiPhoneHD,
     @"resources-phone", CCFileUtilsSuffixiPhone5,
     @"resources-phonehd", CCFileUtilsSuffixiPhone5HD,
     @"resources-tablet", CCFileUtilsSuffixMac,
     @"resources-tablethd", CCFileUtilsSuffixMacHD,
     @"", CCFileUtilsSuffixDefault,
     nil];
    
    sharedFileUtils.searchPath =
    [NSArray arrayWithObjects:
     [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"Published-iOS"],
     [[NSBundle mainBundle] resourcePath],
     nil];
    
	sharedFileUtils.enableiPhoneResourcesOniPad = YES;
    sharedFileUtils.searchMode = CCFileUtilsSearchModeDirectory;
    [sharedFileUtils buildSearchResolutionsOrder];
    
    [sharedFileUtils loadFilenameLookupDictionaryFromFile:@"fileLookup.plist"];
    [[CCSpriteFrameCache sharedSpriteFrameCache] loadSpriteFrameLookupDictionaryFromFile:@"spriteFrameFileList.plist"];
    
    
    

    
    // Do any extra configuration of Cocos2d here (the example line changes the pixel format for faster rendering, but with less colors)
    //[cocos2dSetup setObject:kEAGLColorFormatRGB565 forKey:CCConfigPixelFormat];
    
    [self setupCocos2dWithOptions:cocos2dSetup];
    
    //[CCBReader configureCCFileUtils];

}

- (void) setupCocos2dWithOptions:(NSDictionary*)config
{
	CCDirectorMac *director = (CCDirectorMac*) [CCDirector sharedDirector];
    
	// enable FPS and SPF
	[director setDisplayStats:YES];
	
	// connect the OpenGL view with the director
	[director setView:self.view];
    
	// EXPERIMENTAL stuff.
	// 'Effects' don't work correctly when autoscale is turned on.
	// Use kCCDirectorResize_NoScale if you don't want auto-scaling.
	[director setResizeMode:kCCDirectorResize_AutoScale];
	
	// Enable "moving" mouse event. Default no.
	[_window setAcceptsMouseMovedEvents:NO];
	
	// Center main window
	[_window center];
	
	[director runWithScene:[self startScene]];
}

- (CCScene*) startScene
{
    return [CCBReader loadAsScene:@"MainScene"];
    //return [CCBReader loadAsScene:@"UI/Menues/Game"];
}

- (IBAction)toggleFullScreen: (id)sender
{
	CCDirectorMac *director = (CCDirectorMac*) [CCDirector sharedDirector];
	[director setFullScreen: ! [director isFullScreen] ];
}

- (BOOL) applicationShouldTerminateAfterLastWindowClosed: (NSApplication *) theApplication
{
	return YES;
}


@end
