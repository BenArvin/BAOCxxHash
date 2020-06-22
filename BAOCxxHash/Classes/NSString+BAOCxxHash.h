//
//  NSString+BAOCxxHash.h
//  BAOCxxHash
//
//  Created by benarvin on 2020/6/22.
//  Copyright © 2020 benarvin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (BAOCxxHash)

- (uint32_t)BAXH_hash32;
- (uint64_t)BAXH_hash64;

@end
