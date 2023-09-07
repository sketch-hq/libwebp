//
//  Created by Gavin on 05/09/2016.
//  Copyright © 2016 Bohemian Coding. All rights reserved.
//
@import XCTest;
@import SketchModelTestKit;
@import WebP;
@import Chocolat;

@interface NSImageWebPTester : XCTestCase

@end

@implementation NSImageWebPTester

- (void)testImageLoaded {
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSURL *url = [bundle URLForResource:@"Strawberry" withExtension:@"webp" subdirectory:@"Documents"];
  XCTAssertNotNil( url );

  NSImage *image = [NSImage imageWithWebPURL:url];
  XCTAssertNotNil( image );

  url = [bundle URLForResource:@"Strawberry" withExtension:@"png" subdirectory:@"Reference"];
  XCTAssertNotNil( url );
  NSImage* expectedImage = [[NSImage alloc] initWithContentsOfURL:url];
  XCTAssertNotNil( expectedImage );
  NSBitmapImageRep *expectedBitmap = [expectedImage firstBitmapImageRepOrCreateIfNecessary];

  NSBitmapImageRep *rep = [image firstBitmapImageRepOrCreateIfNecessary];

  [self compareImage:rep toReferenceImage:expectedBitmap testName:@"testImageLoaded"];
}

- (void)testBadURL {
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSURL *url = [bundle URLForResource:@"Strawberry" withExtension:@"png" subdirectory:@"Reference"];
  XCTAssertNotNil( url );
  NSImage *image = [NSImage imageWithWebPURL:url];
  XCTAssertNil( image );
}

- (void)testNilURL {
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSURL *url = [bundle URLForResource:@"Doesn't exist" withExtension:@"png" subdirectory:@"Reference"];
  XCTAssertNil( url );
  NSImage *image = [NSImage imageWithWebPURL:url];
  XCTAssertNil( image );
}

- (void)testPremultipliedAlpha {
  NSBundle *bundle = [NSBundle bundleForClass:self.class];
  NSURL *url = [bundle URLForResource:@"AlphaTest" withExtension:@"webp" subdirectory:@"Documents"];
  XCTAssertNotNil( url );
  
  NSImage *image = [NSImage imageWithWebPURL:url];
  XCTAssertNotNil( image );
  
  url = [bundle URLForResource:@"AlphaTest" withExtension:@"png" subdirectory:@"Reference"];
  XCTAssertNotNil( url );
  NSImage* expectedImage = [[NSImage alloc] initWithContentsOfURL:url];
  XCTAssertNotNil( expectedImage );
  NSBitmapImageRep *expectedBitmap = [expectedImage firstBitmapImageRepOrCreateIfNecessary];
  NSBitmapImageRep *rep = [image firstBitmapImageRepOrCreateIfNecessary];
  
  [self compareImage:rep toReferenceImage:expectedBitmap testName:@"testPremultipliedAlpha"];
}


@end
