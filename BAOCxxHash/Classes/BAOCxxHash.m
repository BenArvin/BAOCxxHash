//
//  BAOCxxHash.m
//  BAOCxxHash
//
//  Created by benarvin on 2020/6/22.
//

#import "BAOCxxHash.h"
#import "xxHash.h"

static const uint64_t BAXHxxHash64Seed = 0xba101132;
static const uint64_t BAXHxxHash32Seed = 0xba101164;
static const NSUInteger BAXHStreamSliceSize = 1024;

@implementation BAOCxxHash

#pragma mark - public methods
+ (uint32_t)hashData32:(NSData *)data {
    if (!data) {
        return 0x0;
    }
    XXH32_state_t *const state = XXH32_createState();
    if (state == NULL) {
        return 0x0;
    }
    if (XXH32_reset(state, BAXHxxHash32Seed) == XXH_ERROR) {
        XXH32_freeState(state);
        return 0x0;
    }
    if (XXH32_update(state, [data bytes], data.length) == XXH_ERROR) {
        XXH32_freeState(state);
        return 0x0;
    }
    uint32_t result = XXH32_digest(state);
    XXH32_freeState(state);
    return result;
}

+ (uint64_t)hashData64:(NSData *)data {
    if (!data) {
        return 0x0;
    }
    XXH64_state_t *const state = XXH64_createState();
    if (state == NULL) {
        return 0x0;
    }
    if (XXH64_reset(state, BAXHxxHash64Seed) == XXH_ERROR) {
        XXH64_freeState(state);
        return 0x0;
    }
    if (XXH64_update(state, [data bytes], data.length) == XXH_ERROR) {
        XXH64_freeState(state);
        return 0x0;
    }
    uint64_t result = XXH64_digest(state);
    XXH64_freeState(state);
    return result;
}

+ (uint32_t)hashFile32:(NSString *)path {
    if (![self isPathValid:path]) {
        return 0x0;
    }
    XXH32_state_t *const state = XXH32_createState();
    if (state == NULL) {
        return 0x0;
    }
    if (XXH32_reset(state, BAXHxxHash32Seed) == XXH_ERROR) {
        XXH32_freeState(state);
        return 0x0;
    }
    
    NSInputStream *stream = [[NSInputStream alloc] initWithFileAtPath:path];
    [stream open];
    NSStreamStatus status = [stream streamStatus];
    if (status == NSStreamStatusAtEnd || status == NSStreamStatusError) {
        XXH32_freeState(state);
        [stream close];
        return 0x0;
    }
    
    BOOL failed = NO;
    NSInteger lastOffset = 0;
    while (1) {
        uint8_t buffer[BAXHStreamSliceSize];
        [stream setProperty:@(lastOffset) forKey:NSStreamFileCurrentOffsetKey];
        NSInteger count = [stream read:buffer maxLength:BAXHStreamSliceSize];
        NSStreamStatus statusTmp = [stream streamStatus];
        if (statusTmp == NSStreamStatusAtEnd || statusTmp == NSStreamStatusError || count < 0) {
            failed = YES;
            break;
        }
        if (count > 0) {
            NSData *data = [NSData dataWithBytes:buffer length:count];
            if (!data) {
                failed = YES;
                break;
            }
            if (XXH32_update(state, [data bytes], data.length) == XXH_ERROR) {
                failed = YES;
                break;
            }
        }
        if (count < BAXHStreamSliceSize) {
            break;
        }
        lastOffset = lastOffset + count;
    }
    
    [stream close];
    if (failed) {
        XXH32_freeState(state);
        return 0x0;
    } else {
        uint32_t result = XXH32_digest(state);
        XXH32_freeState(state);
        return result;
    }
}

+ (uint64_t)hashFile64:(NSString *)path {
    if (![self isPathValid:path]) {
        return 0x0;
    }
    XXH64_state_t *const state = XXH64_createState();
    if (state == NULL) {
        return 0x0;
    }
    if (XXH64_reset(state, BAXHxxHash64Seed) == XXH_ERROR) {
        XXH64_freeState(state);
        return 0x0;
    }
    
    NSInputStream *stream = [[NSInputStream alloc] initWithFileAtPath:path];
    [stream open];
    NSStreamStatus status = [stream streamStatus];
    if (status == NSStreamStatusAtEnd || status == NSStreamStatusError) {
        XXH64_freeState(state);
        [stream close];
        return 0x0;
    }
    
    BOOL failed = NO;
    NSInteger lastOffset = 0;
    while (1) {
        uint8_t buffer[BAXHStreamSliceSize];
        [stream setProperty:@(lastOffset) forKey:NSStreamFileCurrentOffsetKey];
        NSInteger count = [stream read:buffer maxLength:BAXHStreamSliceSize];
        NSStreamStatus statusTmp = [stream streamStatus];
        if (statusTmp == NSStreamStatusAtEnd || statusTmp == NSStreamStatusError || count < 0) {
            failed = YES;
            break;
        }
        if (count > 0) {
            NSData *data = [NSData dataWithBytes:buffer length:count];
            if (!data) {
                failed = YES;
                break;
            }
            if (XXH64_update(state, [data bytes], data.length) == XXH_ERROR) {
                failed = YES;
                break;
            }
        }
        if (count < BAXHStreamSliceSize) {
            break;
        }
        lastOffset = lastOffset + count;
    }
    
    [stream close];
    if (failed) {
        XXH64_freeState(state);
        return 0x0;
    } else {
        uint64_t result = XXH64_digest(state);
        XXH64_freeState(state);
        return result;
    }
}

#pragma mark - private methods
+ (BOOL)isPathValid:(NSString *)path {
    if (!path) {
        return NO;
    }
    BOOL isDir;
    BOOL exists = [[NSFileManager defaultManager] fileExistsAtPath:path isDirectory:&isDir];
    return (exists && !isDir);
}

@end
