#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>

#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>

#include "Video.h"

/* -----------------------------------------------------------------------------
    Generate a thumbnail for file

   This function's job is to create thumbnail for designated file as fast as
   possible
   -----------------------------------------------------------------------------
   */

OSStatus GenerateThumbnailForURL(void *thisInterface,
                                 QLThumbnailRequestRef thumbnail, CFURLRef url,
                                 CFStringRef contentTypeUTI,
                                 CFDictionaryRef options, CGSize maxSize) {

  NSData *imageData = [Video dataFromVideoFile:(__bridge NSURL *)url];
  NSImage *imageThumbnail = [[NSImage alloc] initWithData:imageData];

  if (QLThumbnailRequestIsCancelled(thumbnail)) {
    return noErr;
  }

  NSSize canvasSize = imageThumbnail.size;
  NSRect renderRect = NSMakeRect(0.0, 0.0, imageThumbnail.size.width,
                                 imageThumbnail.size.height);

  CGContextRef _context =
      QLThumbnailRequestCreateContext(thumbnail, canvasSize, false, NULL);
  if (_context) {
    NSGraphicsContext *_graphicsContext =
        [NSGraphicsContext graphicsContextWithGraphicsPort:(void *)_context
                                                   flipped:NO];

    [NSGraphicsContext setCurrentContext:_graphicsContext];
    [imageThumbnail drawInRect:renderRect];

    QLThumbnailRequestFlushContext(thumbnail, _context);
    CFRelease(_context);
  }

  return noErr;
}

void CancelThumbnailGeneration(void *thisInterface,
                               QLThumbnailRequestRef thumbnail) {
  // implement only if supported
}
