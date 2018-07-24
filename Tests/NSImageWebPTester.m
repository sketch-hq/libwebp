//
//  Created by Gavin on 05/09/2016.
//  Copyright © 2016 Bohemian Coding. All rights reserved.
//

@import WebP;

@interface NSImageWebPTester : BCTestCase

@end

@implementation NSImageWebPTester

- (void)testImageLoaded {
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSURL *url = [bundle URLForResource:@"Strawberry" withExtension:@"webp" subdirectory:@"Documents"];
  BCTestAssertNotNil( url );

  NSImage *image = [NSImage imageWithWebPURL:url];
  BCTestAssertNotNil( image );

  url = [bundle URLForResource:@"Strawberry" withExtension:@"png" subdirectory:@"Reference"];
  BCTestAssertNotNil( url );
  NSImage* expectedImage = [[NSImage alloc] initWithContentsOfURL:url];
  BCTestAssertNotNil( expectedImage );
  NSBitmapImageRep *expectedBitmap = [expectedImage firstBitmapImageRepOrCreateIfNecessary];

  NSBitmapImageRep *rep = [image firstBitmapImageRepOrCreateIfNecessary];
  
  BOOL imagesMatch = [self image:rep matchesReferenceImage:expectedBitmap properties:@{}];
  BCTestAssertTrue( imagesMatch );
}

- (void)testBadURL {
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSURL *url = [bundle URLForResource:@"Strawberry" withExtension:@"png" subdirectory:@"Reference"];
  BCTestAssertNotNil( url );
  NSImage *image = [NSImage imageWithWebPURL:url];
  BCTestAssertNil( image );
}

- (void)testNilURL {
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSURL *url = [bundle URLForResource:@"Doesn't exist" withExtension:@"png" subdirectory:@"Reference"];
  BCTestAssertNil( url );
  NSImage *image = [NSImage imageWithWebPURL:url];
  BCTestAssertNil( image );
}

@end
