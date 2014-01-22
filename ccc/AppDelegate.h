//
//  AppDelegate.h
//  ccc
//
//  Created by 张玺 on 14-1-18.
//  Copyright (c) 2014年 张玺. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;

@property (unsafe_unretained) IBOutlet NSTextView *content;

@end
