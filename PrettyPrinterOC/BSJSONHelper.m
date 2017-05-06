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

+ (NSDictionary *)dictionaryFromJSONData:(NSData *)JSONData {
    // https://www.raywenderlich.com/150322/swift-json-tutorial-2
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData: JSONData
                                                         options: kNilOptions
                                                           error: nil];
    return jsonDictionary;
}

+ (NSString *)pretty:(id)jsonObject {

    if (![NSJSONSerialization isValidJSONObject: jsonObject]) {
        return @"";
    }

    NSError *error = nil;
    NSData *data = [NSJSONSerialization dataWithJSONObject: jsonObject
                                                   options: NSJSONWritingPrettyPrinted
                                                     error: &error];
    if (error) {
        NSLog(@"\(error)");
        return @"";
    }
    NSString *string = [[NSString alloc] initWithData: data
                                             encoding: NSUTF8StringEncoding];
    return string;
}

@end
