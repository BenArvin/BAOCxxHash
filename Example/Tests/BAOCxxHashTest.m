//
//  BAOCxxHashTests.m
//  BAOCxxHashTests
//
//  Created by benarvin on 06/20/2020.
//  Copyright (c) 2020 benarvin. All rights reserved.
//

#import <BAOCxxHash/BAOCxxHash.h>

@import XCTest;

@interface Tests : XCTestCase

@end

@implementation Tests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testStringAndDataHash {
    NSString *testStr = @"abssdfiiughyADFHUIDFHUIF ！@#¥%……&*（）「」：“》？锟斤拷烫烫烫屯屯屯锘锘锘";
    uint32_t hash32 = [testStr BAXH_hash32];
    uint64_t hash64 = [testStr BAXH_hash64];
    XCTAssert(hash32 == 0x56725b2a);
    XCTAssert(hash64 == 0x888cc4972a657d8a);
}

- (void)testFileHash {
    NSString *path = [[NSBundle bundleForClass:[self class]] pathForResource:@"doge" ofType:@"png"];
    uint32_t hash32 = [BAOCxxHash hashFile32:path];
    uint64_t hash64 = [BAOCxxHash hashFile64:path];
    XCTAssert(hash32 == 0xe238a3e4);
    XCTAssert(hash64 == 0x52229db06949a95e);
}

@end

