//
//  Video.m
//  QuicklookVideo
//
//  Created by BestPig
//  Copyright 2014 PigBox. All rights reserved.
//

#include "libffmpegthumbnailer/videothumbnailerc.h"
#import "Video.h"

@implementation Video

+ (NSData *)dataFromVideoFile:(NSURL *)videoFile {
  video_thumbnailer *vt = video_thumbnailer_create();

  vt->thumbnail_size = 1024;
  vt->thumbnail_image_type = Jpeg;

  image_data *generated_thumbnail = video_thumbnailer_create_image_data();

  video_thumbnailer_generate_thumbnail_to_buffer(
      vt, [[videoFile path] cStringUsingEncoding:NSASCIIStringEncoding],
      generated_thumbnail);
  NSLog(@"Log: %s",
        [[videoFile path] cStringUsingEncoding:NSASCIIStringEncoding]);
  NSData *data = [NSData dataWithBytes:generated_thumbnail->image_data_ptr
                                length:generated_thumbnail->image_data_size];
  video_thumbnailer_destroy(vt);
  return data;
}

@end
