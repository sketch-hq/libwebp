//
//  Created by Gavin on 05/09/2016.
//  Copyright © 2016 Bohemian Coding. All rights reserved.
//
@import ECUnitTests;
@import WebP;
@import Chocolat;

@interface NSImageWebPTester : ECTestCase

@end

@implementation NSImageWebPTester

- (void)testImageLoaded {
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSURL *url = [bundle URLForResource:@"Strawberry" withExtension:@"webp" subdirectory:@"Documents"];
  ECTestAssertNotNil( url );

  NSImage *image = [NSImage imageWithWebPURL:url];
  ECTestAssertNotNil( image );

  url = [bundle URLForResource:@"Strawberry" withExtension:@"png" subdirectory:@"Reference"];
  ECTestAssertNotNil( url );
  NSImage* expectedImage = [[NSImage alloc] initWithContentsOfURL:url];
  ECTestAssertNotNil( expectedImage );
  NSBitmapImageRep *expectedBitmap = [expectedImage firstBitmapImageRepOrCreateIfNecessary];

  NSBitmapImageRep *rep = [image firstBitmapImageRepOrCreateIfNecessary];
  
  BOOL imagesMatch = [self image:rep matchesReferenceImage:expectedBitmap properties:@{}];
  ECTestAssertTrue( imagesMatch );
}

- (void)testBadURL {
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSURL *url = [bundle URLForResource:@"Strawberry" withExtension:@"png" subdirectory:@"Reference"];
  ECTestAssertNotNil( url );
  NSImage *image = [NSImage imageWithWebPURL:url];
  ECTestAssertNil( image );
}

- (void)testNilURL {
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSURL *url = [bundle URLForResource:@"Doesn't exist" withExtension:@"png" subdirectory:@"Reference"];
  ECTestAssertNil( url );
  NSImage *image = [NSImage imageWithWebPURL:url];
  ECTestAssertNil( image );
}

@end
