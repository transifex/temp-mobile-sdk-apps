//
//  AppDelegate.m
//  ObjCSampleApp
//
//  Created by Stelios Petrakis on 30/10/20.
//

#import "AppDelegate.h"

@import TransifexNative;

@interface CustomLocaleProvider : NSObject <TXCurrentLocaleProvider>

@end

@implementation CustomLocaleProvider

- (NSString * _Nonnull)currentLocale {
    return @"fr";
}

@end

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Extract Secrets
    NSString *transifexToken = NSBundle.mainBundle.infoDictionary[@"TRANSIFEX_TOKEN"];
    NSString *transifexSecret = NSBundle.mainBundle.infoDictionary[@"TRANSIFEX_SECRET"];

    // Initialize Transifex Native
    CustomLocaleProvider *customLocale = [CustomLocaleProvider new];
    
    LocaleState *localeState = [[LocaleState alloc] initWithSourceLocale:@"en"
                                                              appLocales:@[
                                                                  @"en",
                                                                  @"fr"
                                                              ]
                                                   currentLocaleProvider:customLocale];
    
    PseudoTranslationPolicy *pseudoTranslationPolicy = [PseudoTranslationPolicy new];
    WrappedStringPolicy *wrappedStringPolicy = [[WrappedStringPolicy alloc] initWithStart:@"["
                                                                                      end:@"]"];
    CompositePolicy *compositePolicy = [[CompositePolicy alloc] init:@[
        pseudoTranslationPolicy,
        wrappedStringPolicy
    ]];
    
    [TxNative initializeWithLocales:localeState
                              token:transifexToken
                             secret:transifexSecret
                            cdsHost:@"https://cds.svc.transifex.net/"
                              cache:[MemoryCache new]
                      missingPolicy:compositePolicy
                        errorPolicy:nil
                  renderingStrategy:RenderingStategyPlatform];

    [TxNative fetchTranslations:nil];
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
