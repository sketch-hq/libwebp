//
//  Created by Gavin on 05/09/2016.
//  Copyright © 2016 Bohemian Coding. All rights reserved.
//

@interface NSImage (WebP)

/// Returns a new NSImage if the contents of the file at \c url can be interpreted as webp
/// or nil otherwise
+ (NSImage*)imageWithWebPURL:(NSURL*)url;

@end
