//
//  BAOCxxHash.h
//  BAOCxxHash
//
//  Created by benarvin on 2020/6/22.
//

#import <Foundation/Foundation.h>
#import "NSString+BAOCxxHash.h"
#import "NSData+BAOCxxHash.h"

@interface BAOCxxHash : NSObject

+ (uint32_t)hashData32:(NSData *)data;
+ (uint64_t)hashData64:(NSData *)data;
+ (uint32_t)hashFile32:(NSString *)path;
+ (uint64_t)hashFile64:(NSString *)path;

@end
