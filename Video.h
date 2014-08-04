//
//  Video.h
//  QuicklookVideo
//
//  Created by BestPig
//  Copyright 2014 PigBox. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface Video : NSObject {
}

+ (NSData *)dataFromVideoFile:(NSURL *)videoFile;

@end
