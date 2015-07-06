# mojio-ios-example-OAuth2

UNDER ACTIVE DEVELOPMENT
These instructions assume the usage of xcode 6.0+ and Podfile package manager

This project shows how to use the Mojio SDK to perform simple OAuth2 authentication to gain access to the Mojio Platform's core data.

If you wish to download the full SDK source, please see [Visit our GitHub repo](https://github.com/mojio/mojio-ios-sdk).

###Mojio iOS SDK dependency###
1. AFNetworking, version > 2.5
2. JSONModel, "1.0.2"

###Running this project###
1. Fork / clone this repo
2. Open up AppDelegate.m and add your application's MOJIO_APP_ID and REDIRECT_URL.
3. Build the project and run on a device!

###How OAuth2 is done in this application ###
1. Your application need to include MojioClient.h where you need access Mojio SDK

2. In AppDelegate.m, add below code in "- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions" to initialize Mojio iOS SDK.

    MojioClient *mojioClient = [MojioClient client];
    [mojioClient initWithAppId:MOJIO_APP_ID andSecretKey:nil andRedirectUrlScheme:REDIRECT_URL];

3. In AppDelegate.m add below code in "-(BOOL) application:(UIApplication *)application handleOpenURL:(NSURL *)url", this is to handle post-OAuth2 authentication callback.

    [[MojioClient client] handleOpenURL:url];

4. In your UIViewController, add a UIButton assume it would execute the login upon click, and add below code in response of the event:

    [[MojioClient client] loginWithCompletionBlock:^{
        //Post-OAuth2 authentication callback, etc. refresh login status.
    }];
    