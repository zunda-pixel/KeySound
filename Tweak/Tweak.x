// Import the framework which has the AVAudioPlayer class
#import <AVFoundation/AVFoundation.h> 

@interface UIKeyboardLayoutStar : UIView
// Create new property for AVAudioPlayer and retain it. 
@property (nonatomic, retain) AVAudioPlayer* KSPlayer;
@end

// hook the UIKeyboardLayoutStar view
%hook UIKeyboardLayoutStar
// Add the property to the UIKeyboardLayoutStar class because it doesn't exist :DD
%property (nonatomic, retain) AVAudioPlayer* KSPlayer;

-(instancetype)initWithFrame:(CGRect)frame {
    if ((self = %orig)) {
		// Add a UITapGestureRecognizer to the keyboard layout and do not let it block touches in the view
		UITapGestureRecognizer* gestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onKeyboardTouch:)];
        gestureRecognizer.cancelsTouchesInView = NO;
        [self addGestureRecognizer:gestureRecognizer];

		// Make a string with the file path of the mp3 bruh sound file and create a NSURL of it

		NSArray *soundFileName = [NSArray arrayWithObjects:@"bruhSound.mp3", @"bruhSound.mp3", @"bruhSound.mp3",nil];

		//設定ファイルから選択した音を検出
		int selectedSoundNumber	 		= [selectedSound intValue];

		NSString* defaultFilePath 		= @"/Library/Application Support/KeySound/"
		NSString* selectedSoundFile		= [soundFileName objectAtIndex:selectedSoundNumber];
		NSString* generatedSoundFilePath	= [NSString stringWithFormat:@"%@%@",defaultFilePath, selectedSoundFile]
		NSURL* generatedFileURL		 	= [NSURL fileURLWithPath:generatedSoundFilePath];

		// Init the KSPlayer, set its volume
		self.KSPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:bruhFileURL error:nil];
		self.KSPlayer.volume = 1;
     }
     return self;

}

// %new because the method doesn't exist in the class 
%new
-(void)onKeyboardTouch:(UITapGestureRecognizer *)gestureRecognizer {
	// Rewind the current time of the KSPlayer back to 0, if the old sound was still playing :D
	self.KSPlayer.currentTime = 0;
	// In the next 2 methods we prepare the KSPlayer to play and actually play it, the prepare one is needed for less lag between playing and clicking a key on the keyboard
	[self.KSPlayer prepareToPlay];
	[self.KSPlayer play];
    
}

// end of the hook
%end

%ctor {
    pfs = [[HBPreferences alloc] initWithIdentifier:@"com.zunda.keysoundprefs"];

    //[pfs registerBool:&enabled default:YES forKey:@"Enabled"];
    [pfs registerObject:&selectedSound default:@"0" forKey:@"Sound"];
}
