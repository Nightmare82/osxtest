//
//  MainScene.m
//  PROJECTNAME
//
//  Created by Viktor on 10/10/13.
//  Copyright (c) 2013 Apportable. All rights reserved.
//

#import "MainScene.h"


@implementation MainScene


#ifdef __CC_PLATFORM_IOS

- (void)touchBegan:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

/**
 *  Called whan a touch moves.
 *
 *  @param touch    Contains the touch.
 *  @param event    Current event information.
 */
- (void)touchMoved:(UITouch *)touch withEvent:(UIEvent *)event
{
    
}

/**
 *  Called when a touch ends.
 *
 *  @param touch    Contains the touch.
 *  @param event    Current event information.
 */
- (void)touchEnded:(UITouch *)touch withEvent:(UIEvent *)event
{

    
}

#else // iOS touch handling

- (void)mouseDown:(NSEvent *)theEvent
{
    
}


- (void)mouseUp:(NSEvent *)theEvent
{
}

#endif // OS X touch handling

-(void)update:(CCTime)delta
{
}

@end
