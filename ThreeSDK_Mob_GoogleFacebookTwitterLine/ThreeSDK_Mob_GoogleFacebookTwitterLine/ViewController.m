//
//  ViewController.m
//  ThreeSDK_Mob_GoogleFacebookTwitterLine
//
//  Created by 1 on 2021/11/19.
//

#import "ViewController.h"
//#import <ShareSDK/ShareSDK.h>
#import "MobManager.h"
#import "CommonHeader.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self loginFacebook];
}

- (void)loginGooglePlus{
    NSDictionary *settings = @{};
    [[MobManager mobManager]mobShare_authorize:SSDKPlatformTypeGooglePlus
                                      settings:settings
                                onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
        switch (state) {
                       case SSDKResponseStateSuccess:
            {
                YHLog(@"google 授权 %@",[user.credential rawData]);

            }
                       break;
                       case SSDKResponseStateFail:
                             {
                                 YHLog(@"--%@",error.description);
                                //失败
                                break;
                              }
                       case SSDKResponseStateCancel:
                                //用户取消授权
                                break;
                       default:
                       break;
           }
    }];
}
- (void)loginFacebook {
    NSDictionary *settings = @{};
    [[MobManager mobManager]mobShare_authorize:SSDKPlatformTypeFacebook
                                      settings:settings
                                onStateChanged:^(SSDKResponseState state, SSDKUser *user, NSError *error)
     {
        switch (state) {
                       case SSDKResponseStateSuccess:
            {
                YHLog(@"Facebook 授权 %@",[user.credential rawData]);

            }
                       break;
                       case SSDKResponseStateFail:
                             {
                                 YHLog(@"--%@",error.description);
                                //失败
                                break;
                              }
                       case SSDKResponseStateCancel:
                                //用户取消授权
                                break;
                       default:
                       break;
           }
    }];

}
/**
 {
     "access_token" = "ya29.a0ARrdaM8mbh692ANknqM70ghs4a0pd5o_dRUjg-nrUKjoW0yMtYLYdl2FAtgQwpr3MQdhinA5OHcuSt_0rrKkbP0yiH2GsKg3bqahGuudNqH8sXlCwt-Y4EdYaEm0qflcZZBb59o2vvB4bcwK5FPCKInOd9hn";
     "expires_in" = 3599;
     "id_token" = "eyJhbGciOiJSUzI1NiIsImtpZCI6IjAzMmIyZWYzZDJjMjgwNjE1N2Y4YTliOWY0ZWY3Nzk4MzRmODVhZGEiLCJ0eXAiOiJKV1QifQ.eyJpc3MiOiJodHRwczovL2FjY291bnRzLmdvb2dsZS5jb20iLCJhenAiOiI5Njk1OTg0NjcxOTktMzM2cTUyZjJoZXZsNWxsZDJhY3RkYzhnYXBzM2dtNm4uYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJhdWQiOiI5Njk1OTg0NjcxOTktMzM2cTUyZjJoZXZsNWxsZDJhY3RkYzhnYXBzM2dtNm4uYXBwcy5nb29nbGV1c2VyY29udGVudC5jb20iLCJzdWIiOiIxMTMyNjM3MjE2MTA0MDY5MDQ3MjYiLCJlbWFpbCI6IndvcmtfbGl5dWhvbmcxNjVAMTYzLmNvbSIsImVtYWlsX3ZlcmlmaWVkIjp0cnVlLCJhdF9oYXNoIjoiTkM3cVJVX0gyU2F2WmpaYzAtbnZjUSIsIm5hbWUiOiJZdWhvbmcgTGkiLCJwaWN0dXJlIjoiaHR0cHM6Ly9saDMuZ29vZ2xldXNlcmNvbnRlbnQuY29tL2EvQUFUWEFKeGtqSGlGR0FJU0ZLcGo3a1NTbHdmd1ZrbmF6d0d0Y2dGQmY4eTA9czk2LWMiLCJnaXZlbl9uYW1lIjoiWXVob25nIiwiZmFtaWx5X25hbWUiOiJMaSIsImxvY2FsZSI6InpoLUNOIiwiaWF0IjoxNjM3MzAzNzA2LCJleHAiOjE2MzczMDczMDZ9.ZREZQnVsczTs0csZepqiqZ6Dc3XohHAvquunnfrI7FKZSof7qfBX5ICbh_EmIKdIOcE5IMyf-qVk_imiU15ejqF_wJDnL_Y3AKKf1d7MHJ8QefwRMCHsknNW_I1Wiy2B-hoKiuzFsuN0ZPdctJiNW26YF8VUSxEEkWRU4OI9tb6Mt7siYIOUK3-huOVJBISa1HJnm3A6PCYlzQHgfACJYs5fP7Td_rmQE-glCH_1RQvwvKgRoJBYNkoCb2JPiDtgt8Y2ffeQL8qWlFqpBqEnaDo2HQPlbXUjv-OC0EF0euv4sFJA8FGq681r7-wKa7pFo1v6Emu9T-OVO19NSxovvQ";
     "refresh_token" = "1//0eLI9re5pbYeDCgYIARAAGA4SNwF-L9IrVE0c_WiTTs913mj9F8hLPoPkReHWgFVQC0LpbtA97Nl_kOFRYtKL7p5Lsz4iQJuniAQ";
     scope = "https://www.googleapis.com/auth/userinfo.profile https://www.googleapis.com/auth/userinfo.email openid";
     "token_type" = Bearer;
     tokeninfo =     {
         alg = RS256;
         "at_hash" = "NC7qRU_H2SavZjZc0-nvcQ";
         aud = "969598467199-336q52f2hevl5lld2actdc8gaps3gm6n.apps.googleusercontent.com";
         azp = "969598467199-336q52f2hevl5lld2actdc8gaps3gm6n.apps.googleusercontent.com";
         email = "work_liyuhong165@163.com";
         "email_verified" = true;
         exp = 1637307306;
         "family_name" = Li;
         "given_name" = Yuhong;
         iat = 1637303706;
         iss = "https://accounts.google.com";
         kid = 032b2ef3d2c2806157f8a9b9f4ef779834f85ada;
         locale = "zh-CN";
         name = "Yuhong Li";
         picture = "https://lh3.googleusercontent.com/a/AATXAJxkjHiFGAISFKpj7kSSlwfwVknazwGtcgFBf8y0=s96-c";
         sub = 113263721610406904726;
         typ = JWT;
     };
     uid = 113263721610406904726;
 }
 */



// fb

/**
 Facebook 授权 {
     "access_token" = EAAWckjlmchQBALyNmIAJDIPaEaAmD07pihNAR5DoZCUlXtg2yYfTNb6BYVese2ZA4GA9fXxOyjSgfYm4o3POZA6is2q0uhW2YO6T7Y0ZCWhTQTIe5QUyvzIG0Cgp5R1Hq5tMTw8ZCaZBrt1zC1NYnFVHc7dJ2mZC5RhCWSk3VsYZAxJP6Q5CmDcrG55X8Bz1ZBcyO1ow1f5PMw0umzBEYgxaFK5tMxXemneUVFM9whMlM6gkGh28pIO12ZBgUZBpyXAV5kZD;
     "data_access_expiration_time" = 1645082746;
     "expires_in" = "5183999.989079952";
     "granted_scopes" =     (
         "public_profile",
         email
     );
     uid = 109343258238888;
 }
 */
@end
