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
    UInt8 *webp = WebPDecodeRGBA( data.bytes, data.length, &width, &height );
    if (webp) {
      UInt32 *fixup = (UInt32*)webp;
      // If the alpha channel is 0, webP seems to take the view that it doesn't matter what's in it.
      // Setting this to 0 for consistency with (e.g) loading from PNG.
      for (int i = 0; i < width * height; i++ ) {
        if (!(fixup[i] & 0xFF000000)) {
          fixup[i] = 0x00000000;
        }
      }

      NSBitmapImageRep *rep = [[NSBitmapImageRep alloc] initWithBitmapDataPlanes:&webp pixelsWide:width pixelsHigh:height bitsPerSample:8 samplesPerPixel:4 hasAlpha:YES isPlanar:NO colorSpaceName:NSDeviceRGBColorSpace bitmapFormat:NS32BitLittleEndianBitmapFormat bytesPerRow:4 * width bitsPerPixel:32];
      result = [[NSImage alloc] initWithSize:NSMakeSize(width, height)];
      [result addRepresentation:rep];

      WebPFree( webp );
    }
  }
  
  return result;
}



@end
