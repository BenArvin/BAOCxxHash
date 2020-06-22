#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "BAOCxxHash.h"
#import "NSData+BAOCxxHash.h"
#import "NSString+BAOCxxHash.h"
#import "xxh3.h"
#import "xxhash.h"

FOUNDATION_EXPORT double BAOCxxHashVersionNumber;
FOUNDATION_EXPORT const unsigned char BAOCxxHashVersionString[];

