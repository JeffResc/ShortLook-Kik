#import "KikContactPhotoProvider.h"

@implementation KikContactPhotoProvider

- (DDNotificationContactPhotoPromiseOffer *)contactPhotoPromiseOfferForNotification:(DDUserNotification *)notification {
	NSString *profileID = [notification.applicationUserInfo valueForKeyPath:@"binId"];
    if (!profileID) return nil;
	NSArray *parsedProfile = [profileID componentsSeparatedByString:@"_"];
	NSString *username = [parsedProfile firstObject];
    NSString *profileURLStr = [NSString stringWithFormat: @"http://cdn.kik.com/user/pic/%@", username];
    NSURL *profileURL = [NSURL URLWithString:profileURLStr];
    if (!profileURL) return nil;
	DDNotificationContactPhotoPromiseOffer* promise = [NSClassFromString(@"DDNotificationContactPhotoPromiseOffer") offerDownloadingPromiseWithPhotoIdentifier:profileURLStr fromURL:profileURL];
	promise.titleOverride = username;
	return promise;
}

@end