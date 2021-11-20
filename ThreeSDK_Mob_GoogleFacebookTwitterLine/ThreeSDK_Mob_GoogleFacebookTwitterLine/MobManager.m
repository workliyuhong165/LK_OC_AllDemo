//
//  MobManager.m
//  ThreeSDK_Mob_GoogleFacebookTwitterLine
//
//  Created by 1 on 2021/11/19.
//

#import "MobManager.h"

@implementation MobManager
+ (instancetype)mobManager {
    static MobManager * mob = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        mob = [[super allocWithZone:nil] init];
    });
    return mob;
}
- (void)mobSDK_Init
{
}
- (void)mobPrivacy_uploadPrivacyPermissionStatus:(BOOL)isAgree
                             onResult:(void (^_Nullable)(BOOL success))handler
{
    [MobSDK uploadPrivacyPermissionStatus:isAgree onResult:handler];
}
- (void)mobShare_registPlatforms
{
    [ShareSDK registPlatforms:^(SSDKRegister *platformsRegister) {
         //google
        [platformsRegister
         setupGooglePlusByClientID:Mob_Google_ClientID
         clientSecret:Mob_Google_ClientSecret
         redirectUrl:Mob_Google_RedirectUrl];
        // facebook
        [platformsRegister setupFacebookWithAppkey:Mob_Facebook_Appkey
                                         appSecret:Mob_Facebook_AppSecret
                                       displayName:Mob_Facebook_DisplayName];
      }];
}
- (void)mobShare_registPlatforms:(void(^)(SSDKRegister *platformsRegister))importHandler
{
    [ShareSDK registPlatforms:importHandler];

}

- (SSDKSession *)mobShare_authorize:(SSDKPlatformType)platformType
                  settings:(NSDictionary *)settings
            onStateChanged:(SSDKAuthorizeStateChangedHandler)stateChangedHandler
{
    return [ShareSDK authorize:platformType settings:settings onStateChanged:stateChangedHandler];
}
@end
