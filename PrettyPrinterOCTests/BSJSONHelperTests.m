//
//  BSJSONHelperTests.m
//  BSJSONHelperTests
//
//  Created by Steve Baker on 5/5/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "BSJSONHelper.h"

@interface BSJSONHelperTests : XCTestCase

@end

@implementation BSJSONHelperTests

- (void)testArrayFromJSONDataFile {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"sample_array"
                                                          ofType:@"json"];
    // path to url is a little extra work, in general Apple seems to prefer using url.
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    NSData *data = [NSData dataWithContentsOfURL: fileURL];

    NSArray *sampleArray = [BSJSONHelper arrayFromJSONData: data];

    XCTAssertEqual([sampleArray count], 3);
}


@end
