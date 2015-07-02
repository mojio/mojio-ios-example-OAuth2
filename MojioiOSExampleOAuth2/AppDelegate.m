//
//  AppDelegate.m
//  MojioiOSExampleOAuth2
//
//  Created by Ye Ma on 2015-06-30.
//  Copyright (c) 2015 Ye Ma. All rights reserved.
//

#import "AppDelegate.h"
#import "MojioClient.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

    // initialize MojioClient with app id and secretkey
    MojioClient *mojioClient = [MojioClient client];
    [mojioClient initWithAppId:@"cd804855-6d5c-4c4c-a308-d71e0a32417b" andSecretKey:@"9ae98c27-b4c1-4add-9de0-b78bc6ff1d48" andRedirectUrlScheme:@"mojioiosexampleoauth2://"]; //sandbox key
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    [[MojioClient client] handleOpenURL:url];
    return YES;
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
