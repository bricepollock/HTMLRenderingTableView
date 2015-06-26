#import "DTCoreTextStub.h"
#import "DTCoreText.h"

@implementation DTCoreTextStub

+(NSString *) kDTCoreTextOptionKeyFontName {
    return DTDefaultFontName;
}

+(NSString *) kDTCoreTextOptionKeyFontFamily {
    return DTDefaultFontFamily;
}

+(NSString *) kDTCoreTextOptionKeyFontSize {
    return DTDefaultFontSize;
}

+(NSString *) kDTCoreTextOptionKeyTextColor {
    return DTDefaultTextColor;
}

+(NSString *) kDTCoreTextOptionKeyUseiOS6Attributes {
    return DTUseiOS6Attributes;
}

+(NSAttributedString *) attributedStringWithHtml: (NSString*)htmlString options: (NSDictionary*)options {
    NSData *data = [htmlString dataUsingEncoding:NSUTF8StringEncoding];
    NSAttributedString *attrString = [[NSAttributedString alloc] initWithHTMLData:data
                                                                          options:options
                                                               documentAttributes:NULL];
    return attrString;
}

@end
