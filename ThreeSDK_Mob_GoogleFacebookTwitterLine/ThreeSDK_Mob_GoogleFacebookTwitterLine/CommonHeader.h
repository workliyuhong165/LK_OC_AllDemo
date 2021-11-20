//
//  CommonHeader.h
//  ThreeSDK_Mob_GoogleFacebookTwitterLine
//
//  Created by 1 on 2021/11/19.
//

#ifndef CommonHeader_h
#define CommonHeader_h

#ifdef DEBUG
#define YHLog(format, ...) printf("\n时间: %s %s \n类名: < %p %s:(%d) > \n方法名: %s \n打印内容是:\n%s\n",__DATE__,__TIME__, self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(format), ##__VA_ARGS__] UTF8String] )
#else
#define YHLog(format, ...)
#endif



#define XPWeakSelf __weak typeof(self) weakSelf = self;
#define RGBA(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:a]

#define TYSCREENWIDTH      [UIScreen mainScreen].bounds.size.width
#define TYSCREENHEIGHT     [UIScreen mainScreen].bounds.size.height

// IPhone分辨率
#define UI_IS_IPAD (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
#define UI_IS_IPHONE (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPhone)
#define UI_IS_RETINA ([[UIScreen mainScreen] scale] >= 2.0)
#define SCREENSIZE_IS_35  (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height < 568.0)
#define SCREENSIZE_IS_40  (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 568.0)
#define SCREENSIZE_IS_47  (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 667.0)
#define SCREENSIZE_IS_55  (UI_IS_IPHONE && [[UIScreen mainScreen] bounds].size.height == 736.0 || [[UIScreen mainScreen] bounds].size.width == 736.0)
#define SCREENSIZE_IS_XR ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(828, 1792), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)
#define SCREENSIZE_IS_X ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)
#define SCREENSIZE_IS_XS ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)
#define SCREENSIZE_IS_XS_MAX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1242, 2688), [[UIScreen mainScreen] currentMode].size) && !UI_IS_IPAD : NO)
#define IS_IPhoneX_All ([UIScreen mainScreen].bounds.size.height == 812 || [UIScreen mainScreen].bounds.size.height == 896)


// 状态栏、导航栏、标签栏
#define Height_StatusBar [[UIApplication sharedApplication] statusBarFrame].size.height
#define Height_NavBar 44.0f
#define Height_TopBar (Height_StatusBar + Height_NavBar)
#define Height_TabBar (IS_IPhoneX_All ? 83.0f:49.0f)
#define Height_BottomSafe (IS_IPhoneX_All? 34.0f:0.0f)


#endif /* CommonHeader_h */
