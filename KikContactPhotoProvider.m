#import "KikContactPhotoProvider.h"
#import <Foundation/Foundation.h>

@implementation KikContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
	NSString *profileID = [notification.applicationUserInfo valueForKeyPath:@"binId"];
    if (!profileID) return nil;
	NSArray *parsedProfile = [profileID componentsSeparatedByString:@"_"];
	NSString *username = [parsedProfile firstObject];
    NSString *profileURLStr = [NSString stringWithFormat: @"http://cdn.kik.com/user/pic/%@", username];
	NSLog(@"FIRED FIRED FIRED FIRED FIRED FIRED FIRED FIRED FIRED FIRED FIRED FIRED FIRED: %@.", profileURLStr);
    NSURL *profileURL = [NSURL URLWithString:profileURLStr];
    if (!profileURL) return nil;
    return [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:profileURLStr fromURL:profileURL];
}

@end