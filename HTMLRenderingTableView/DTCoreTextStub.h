//
//  DTCoreTextStub.h
//
//  Created by Brice Pollock on 4/27/15.
//  Copyright (c) 2015 Brice Pollock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface DTCoreTextStub : NSObject
+(NSString *) kDTCoreTextOptionKeyFontName;
+(NSString *) kDTCoreTextOptionKeyFontFamily;
+(NSString *) kDTCoreTextOptionKeyFontSize;
+(NSString *) kDTCoreTextOptionKeyTextColor;
+(NSString *) kDTCoreTextOptionKeyUseiOS6Attributes;
+(NSAttributedString *) attributedStringWithHtml: (NSString *)htmlString options: (NSDictionary *)options;

@end