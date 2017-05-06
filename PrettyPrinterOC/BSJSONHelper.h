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

@end
