//
//  NSImageWebPTester.m
//  WebP
//
//  Created by Gavin on 05/09/2016.
//  Copyright © 2016 Bohemian Coding. All rights reserved.
//

#import "NSImage+WebP.h"

@interface NSImageWebPTester : ECTestCase

@end

@implementation NSImageWebPTester

- (void)testImageLoaded {
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSURL *url = [bundle URLForResource:@"RedBox" withExtension:@"webp" subdirectory:@"Documents"];
  ECTestAssertNotNil( url );
}

@end
