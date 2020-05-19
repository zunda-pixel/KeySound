#include "KSRootListController.h"

@implementation KSRootListController

- (void)openTwitterWithUsername:(NSString*)username
{
	if([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"twitter://"]])
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"twitter://user?screen_name=%@", username]] options:@{} completionHandler:nil];
	}
	else
	{
		[[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"https://twitter.com/%@", username]] options:@{} completionHandler:nil];
	}
}

- (void)openTwiterZunda{
	[self openTwitterWithUsername:@"zundapixel"];
}
- (void)openTwiterTr1Fecta{
	[self openTwitterWithUsername:@"Tr1Fecta"];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void)respring {
	UIAlertController *respring = [UIAlertController alertControllerWithTitle:@"Tick"
													 message:@"Do you really want to ReSpring?"
													 preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Confirm" style:UIAlertActionStyleDestructive handler:^(UIAlertAction * action) {
			[self respringUtil];
	}];

	UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
	[respring addAction:confirmAction];
	[respring addAction:cancelAction];
	[self presentViewController:respring animated:YES completion:nil];

}

-(void)respringUtil {
	NSTask *t = [[NSTask alloc] init];
    [t setLaunchPath:@"/usr/bin/killall"];
    [t setArguments:[NSArray arrayWithObjects:@"backboardd", nil]];
    [t launch];
}
@end


