//
//  NSString+BAOCxxHash.m
//  BAOCxxHash
//
//  Created by benarvin on 2020/6/22.
//  Copyright © 2020 benarvin. All rights reserved.
//

#import "NSString+BAOCxxHash.h"
#import "NSData+BAOCxxHash.h"

@implementation NSString (BAOCxxHash)

- (uint32_t)BAXH_hash32 {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] BAXH_hash32];
}

- (uint64_t)BAXH_hash64 {
    return [[self dataUsingEncoding:NSUTF8StringEncoding] BAXH_hash64];
}

@end
