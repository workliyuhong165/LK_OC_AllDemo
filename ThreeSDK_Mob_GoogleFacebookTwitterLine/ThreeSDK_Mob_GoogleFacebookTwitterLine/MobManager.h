//
//  MobManager.h
//  ThreeSDK_Mob_GoogleFacebookTwitterLine
//
//  Created by 1 on 2021/11/19.
//

#import <Foundation/Foundation.h>
#import <MOBFoundation/MobSDK+Privacy.h>
#import <ShareSDK/ShareSDK.h>

#define Mob_AppKey @"34c0640175a74"
#define Mob_AppSecret @"8a2917955732451cae04b1ae52325d82"

#define Mob_Google_ClientID @"969598467199-336q52f2hevl5lld2actdc8gaps3gm6n.apps.googleusercontent.com"
#define Mob_Google_ClientSecret @""
#define Mob_Google_RedirectUrl @"http://localhost"

// 应用编号 1579526725726740 秘钥 3bc58a4868a024fd82b363bb1a8f7e3f 空间名称 pumpkineve
// 客户端口令 cf7ef2ec63039fb6e3049fa34a103feb
#define Mob_Facebook_Appkey @"1579526725726740"
#define Mob_Facebook_AppSecret @"3bc58a4868a024fd82b363bb1a8f7e3f"
#define Mob_Facebook_DisplayName @"pumpkineve"

NS_ASSUME_NONNULL_BEGIN

@interface MobManager : NSObject
+ (instancetype)mobManager;
// 单例两种写法 、1是覆盖初始化方法返回同一个对象、2是禁用初始化方法。只允许用单例创建
// 参考来源于 https://segmentfault.com/a/1190000023133202
+(instancetype) alloc __attribute__((unavailable("replace with 'mobManager'")));
+(instancetype) new __attribute__((unavailable("replace with 'mobManager'")));
-(instancetype) copy __attribute__((unavailable("replace with 'mobManager'")));
-(instancetype) mutableCopy __attribute__((unavailable("replace with 'mobManager'")));

#pragma mark - MobSDK+Privacy
/**
 上传隐私协议授权状态
 @param isAgree 是否同意（用户授权后的结果）
 */
- (void)mobPrivacy_uploadPrivacyPermissionStatus:(BOOL)isAgree
                                 onResult:(void (^_Nullable)(BOOL success))handler;

#pragma mark - ShareSDK
/// ShareSDK平台注册方法 项目配置 比如已知要集成Google跟Facebook 在内部写死。和下面的方法 二选一
- (void)mobShare_registPlatforms;

/**
 ShareSDK 平台注册方法
 @param importHandler 用于设置各平台注册信息，也可在mob管理后台进行注册
 */
- (void)mobShare_registPlatforms:(void(^)(SSDKRegister *platformsRegister))importHandler;

/**
 授权
 
 @param platformType 平台类型
 @param settings 授权设置,接受scopes属性设置，如新浪微博关注官方微博：@{@"scopes" : @[@"follow_app_official_microblog"]}，类似“follow_app_official_microblog”这些字段是各个社交平台提供的。QQ平台如设置二维码授权,添加字段为QQAuthType：@{@"QQAuthType":@1}, 0为网页账号密码登录授权
 @param stateChangedHandler 授权状态变更回调处理
 @return 会话id
 */
- (SSDKSession *)mobShare_authorize:(SSDKPlatformType)platformType
                  settings:(NSDictionary *)settings
                     onStateChanged:(SSDKAuthorizeStateChangedHandler)stateChangedHandler;
@end

NS_ASSUME_NONNULL_END
