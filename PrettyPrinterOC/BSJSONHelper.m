//
//  BSJSONHelper.m
//  PrettyPrinterOC
//
//  Created by Steve Baker on 5/5/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

#import "BSJSONHelper.h"

@implementation BSJSONHelper

+ (NSArray *)arrayFromJSONData:(NSData *)JSONData {
    // https://www.raywenderlich.com/150322/swift-json-tutorial-2
    NSArray *jsonArray = [NSJSONSerialization JSONObjectWithData: JSONData
                                                         options: kNilOptions
                                                           error: nil];
    return jsonArray;
}

@end
