//
//  BSJSONHelper.h
//  PrettyPrinterOC
//
//  Created by Steve Baker on 5/5/17.
//  Copyright © 2017 Beepscore LLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BSJSONHelper : NSObject

+ (NSArray *)arrayFromJSONData:(NSData *)JSONData;

+ (NSDictionary *)dictionaryFromJSONData:(NSData *)JSONData;

/// pretty converts jsonObject back into Data in order to use options NSJSONWritingPrettyPrinted
/// https://pastebin.com/xaBjM0Pg
/// http://stackoverflow.com/questions/29625133/convert-dictionary-to-json-in-swift
/// http://stackoverflow.com/questions/24023253/how-to-initialise-a-string-from-nsdata-in-swift
/// - parameter jsonObject: object to convert to pretty string
/// - returns: pretty json string
+ (NSString *)pretty:(id)jsonObject;

@end
