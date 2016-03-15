#import "TFPAppDelegate.h"

@interface TFPAppDelegate ()
@end

@implementation TFPAppDelegate

@synthesize window = window_;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleBlackOpaque animated:NO];
  return YES;
}


//- (void)applicationWillTerminate:(UIApplication *)application {
//}


@end
