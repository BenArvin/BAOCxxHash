//
//  NSData+BAOCxxHash.m
//  BAOCxxHash
//
//  Created by benarvin on 2020/6/22.
//  Copyright © 2020 benarvin. All rights reserved.
//

#import "NSData+BAOCxxHash.h"
#import "BAOCxxHash.h"

@implementation NSData (BAOCxxHash)

- (uint32_t)BAXH_hash32 {
    return [BAOCxxHash hashData32:self];
}

- (uint64_t)BAXH_hash64 {
    return [BAOCxxHash hashData64:self];
}

@end
