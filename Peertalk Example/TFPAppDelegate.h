#import "PTChannel.h"

static const NSTimeInterval PTAppReconnectDelay = 1.0;

@interface TFPAppDelegate : NSObject <NSApplicationDelegate, PTChannelDelegate>

@property (assign) IBOutlet NSWindow *window;

- (IBAction)sendMessage:(id)sender;

@end
