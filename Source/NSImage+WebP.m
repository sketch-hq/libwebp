//
//  Created by Gavin on 05/09/2016.
//  Copyright © 2016 Bohemian Coding. All rights reserved.
//
@import Cocoa;

#import "NSImage+WebP.h"
#include "decode.h"

@implementation NSImage (WebP)

+ (NSImage*)imageWithWebPURL:(NSURL*)url {
//  char* rgba = (char*)malloc(width*height*4);
//  for(int i=0; i < width*height; ++i) {
//    rgba[4*i] = myBuffer[3*i];
//    rgba[4*i+1] = myBuffer[3*i+1];
//    rgba[4*i+2] = myBuffer[3*i+2];
//    rgba[4*i+3] = 0;
//  }
//  CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
//  CGContextRef bitmapContext = CGBitmapContextCreate(
//                                                     rgba,
//                                                     width,
//                                                     height,
//                                                     8, // bitsPerComponent
//                                                     4*width, // bytesPerRow
//                                                     colorSpace,
//                                                     kCGImageAlphaNoneSkipLast);
//  
//  CFRelease(colorSpace);
//  
//  CGImageRef cgImage = CGBitmapContextCreateImage(bitmapContext);
//  CFURLRef url = CFURLCreateWithFileSystemPath(kCFAllocatorDefault, CFSTR("image.png"), kCFURLPOSIXPathStyle, false);
//  
//  CFStringRef type = kUTTypePNG; // or kUTTypeBMP if you like
//  CGImageDestinationRef dest = CGImageDestinationCreateWithURL(url, type, 1, 0);
//  
//  CGImageDestinationAddImage(dest, cgImage, 0);
//  
//  CFRelease(cgImage);
//  CFRelease(bitmapContext);
//  CGImageDestinationFinalize(dest);
//  free(rgba);
  
  return nil;
}

@end
