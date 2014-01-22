//
//  AppDelegate.m
//  ccc
//
//  Created by 张玺 on 14-1-18.
//  Copyright (c) 2014年 张玺. All rights reserved.
//

#import "AppDelegate.h"
#import <ScriptingBridge/ScriptingBridge.h>
#import "finder.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    self.content.string = @"OK\n\n\n";
    self.content.string = [self.content.string stringByAppendingString:[self getPathToFrontFinderWindow]];
    
}

-(NSString*)getPathToFrontFinderWindow{
	
	FinderApplication* finder = [SBApplication applicationWithBundleIdentifier:@"com.apple.Finder"];
    
	FinderItem *target = [(NSArray*)[[finder selection]get] firstObject];
    if (target == nil){
        target = [[[[finder FinderWindows] firstObject] target] get];
    }
	
	NSURL* url =[NSURL URLWithString:target.URL];
	NSError* error;
	NSData* bookmark = [NSURL bookmarkDataWithContentsOfURL:url error:nil];
    NSURL* fullUrl = [NSURL URLByResolvingBookmarkData:bookmark
                                               options:NSURLBookmarkResolutionWithoutUI
                                         relativeToURL:nil
                                   bookmarkDataIsStale:nil
                                                 error:&error];
    if(fullUrl != nil){
        url = fullUrl;
    }
    
    
	NSString* path = [[url path] stringByExpandingTildeInPath];
    
    BOOL isDir = NO;
    [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    
    
    
	if(!isDir){
		path = [path stringByDeletingLastPathComponent];
	}
    
	return path;
}
@end
