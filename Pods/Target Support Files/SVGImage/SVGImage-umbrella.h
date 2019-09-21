#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "SIImage.h"
#import "SIImage.m"
#import "SVGImage.h"

FOUNDATION_EXPORT double SVGImageVersionNumber;
FOUNDATION_EXPORT const unsigned char SVGImageVersionString[];

