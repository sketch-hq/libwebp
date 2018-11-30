//
//  Created by Gavin on 05/09/2016.
//  Copyright © 2016 Bohemian Coding. All rights reserved.
//
@import Cocoa;

#import "NSImage+WebP.h"
#include "decode.h"

NSString * const NSImageUTTypeWebP = @"public.webp";

@implementation NSImage (WebP)

+ (NSImage*)imageWithWebPData:(NSData*)data {
  NSImage *result = nil;
  int width = 0;
  int height = 0;
  UInt8 *webp = WebPDecodeRGBA( data.bytes, data.length, &width, &height );
  if (webp) {
    NSBitmapImageRep *rep = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:NULL pixelsWide:width pixelsHigh:height bitsPerSample:8 samplesPerPixel:4 hasAlpha:YES isPlanar:NO colorSpaceName:NSDeviceRGBColorSpace bitmapFormat:NS32BitLittleEndianBitmapFormat | NSAlphaNonpremultipliedBitmapFormat bytesPerRow:4 * width bitsPerPixel:32];
    memcpy( rep.bitmapData, webp, width * height * 4 );
    WebPFree( webp );
    result = [[NSImage alloc] initWithSize:NSMakeSize(width, height)];
    [result addRepresentation:rep];
  }
  return result;
}

+ (NSImage*)imageWithWebPURL:(NSURL*)url {
  NSImage *result = nil;
  NSData *data = [NSData dataWithContentsOfURL:url];
  if (data) {
    result = [self imageWithWebPData:data];
  }
  return result;
}



@end
