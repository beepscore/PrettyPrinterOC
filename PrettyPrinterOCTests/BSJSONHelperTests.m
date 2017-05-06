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

    NSString *prettyString = [BSJSONHelper pretty:sampleArray];
    NSLog(@"%@", prettyString);
    NSString *expected = @"[\n  {\n    \"im:name\" : {\n      \"label\" : null\n    }\n  },\n  {\n    \"im:name\" : {\n      \"label\" : \"foo\"\n    }\n  },\n  {\n    \"im:name\" : {\n      \"label\" : \"bar\"\n    }\n  }\n]";
    XCTAssertEqualObjects(prettyString, expected);
}

- (void)testDictionaryFromJSONDataFile {
    NSString* filePath = [[NSBundle mainBundle] pathForResource:@"sample_dict"
                                                         ofType:@"json"];
    // path to url is a little extra work, in general Apple seems to prefer using url.
    NSURL *fileURL = [NSURL fileURLWithPath:filePath];
    NSData *data = [NSData dataWithContentsOfURL: fileURL];

    NSDictionary *sampleDictionary = [BSJSONHelper dictionaryFromJSONData: data];
    XCTAssertEqual([sampleDictionary count], 1);

    NSString *prettyString = [BSJSONHelper pretty:sampleDictionary];
    NSLog(@"%@", prettyString);
    NSString *expected = @"{\n  \"feed\" : {\n    \"entry\" : [\n      {\n        \"im:name\" : {\n          \"label\" : null\n        }\n      }\n    ],\n    \"author\" : {\n      \"name\" : {\n        \"label\" : \"iTunes Store\"\n      },\n      \"uri\" : {\n        \"label\" : \"foo\"\n      }\n    }\n  }\n}";
    XCTAssertEqualObjects(prettyString, expected);

    NSDictionary *feed = sampleDictionary[@"feed"];
    XCTAssertEqual([feed  count], 2);
}

@end
