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

#import "CryptoKit.h"
#import "CryptoKitTypes.h"
#import "NSData+CryptoKit.h"
#import "NSInputStream+CryptoKit.h"
#import "NSOutputStream+CryptoKit.h"
#import "NSStream+CryptoKit.h"
#import "NSString+CryptoKit.h"
#import "NSURL+CryptoKit.h"

FOUNDATION_EXPORT double CryptoKitVersionNumber;
FOUNDATION_EXPORT const unsigned char CryptoKitVersionString[];

