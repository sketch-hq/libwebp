//
//  Created by Gavin on 05/09/2016.
//  Copyright © 2016 Bohemian Coding. All rights reserved.
//
@import Cocoa;

#import "NSImage+WebP.h"
#include "decode.h"

@implementation NSImage (WebP)

+ (NSImage*)imageWithWebPURL:(NSURL*)url {
  NSImage *result = nil;
  NSData *data = [NSData dataWithContentsOfURL:url];
  if (data) {
    int width = 0;
    int height = 0;
    uint8_t *webp = WebPDecodeRGBA( data.bytes, data.length, &width, &height );
    if (webp) {
      CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
      CGContextRef bitmap = CGBitmapContextCreate( webp, width, height, 8, 4 * width, colorSpace, kCGImageAlphaPremultipliedLast );
      CFRelease(colorSpace);
      
      CGImageRef cgImage = CGBitmapContextCreateImage( bitmap );
      result = [[NSImage alloc] initWithCGImage:cgImage size:NSMakeSize(width, height)];
      CFRelease( cgImage );
      CFRelease( bitmap );
      
      WebPFree( webp );
    }
  }
  
  return result;
}



@end
