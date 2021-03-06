#include <CoreFoundation/CoreFoundation.h>
#include <CoreServices/CoreServices.h>
#include <QuickLook/QuickLook.h>
#include <Foundation/Foundation.h>
#include <AppKit/AppKit.h>
#include "Video.h"

/* -----------------------------------------------------------------------------
   Generate a preview for file

   This function's job is to create preview for designated file
   -----------------------------------------------------------------------------
   */

OSStatus GeneratePreviewForURL(void *thisInterface, QLPreviewRequestRef preview,
                               CFURLRef url, CFStringRef contentTypeUTI,
                               CFDictionaryRef options) {

  NSData *imageData = [Video dataFromVideoFile:(__bridge NSURL *)url];
  NSImage *imageForSize = [[NSImage alloc] initWithData:imageData];

  CGSize canvasSize =
      CGSizeMake(imageForSize.size.width, imageForSize.size.height);

  // Preview will be drawn in a vectorized context
  CGContextRef cgContext = QLPreviewRequestCreateContext(
      preview, *(CGSize *)&canvasSize, true, NULL);
  if (cgContext) {

    CGDataProviderRef imgDataProvider =
        CGDataProviderCreateWithCFData((__bridge CFDataRef)imageData);
    CGImageRef image = CGImageCreateWithJPEGDataProvider(
        imgDataProvider, NULL, true, kCGRenderingIntentDefault);

    CGContextDrawImage(cgContext, CGRectMake(0, 0, imageForSize.size.width,
                                             imageForSize.size.height),
                       image);

    QLPreviewRequestFlushContext(preview, cgContext);

    CFRelease(cgContext);
    CFRelease(image);
  }

  return noErr;
}

void CancelPreviewGeneration(void *thisInterface, QLPreviewRequestRef preview) {
  // implement only if supported
}
