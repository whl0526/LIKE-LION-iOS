//
//  AppDelegate.m
//  helloworldMacOS
//
//  Created by 이원형 on 2022/10/13.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@property (strong) IBOutlet NSWindow *window;
@property (weak) IBOutlet NSTextFieldCell *helloTextFieldCell;
- (IBAction)preesButton:(id)sender;
@property (weak) IBOutlet NSTextField *myTextField;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


- (BOOL)applicationSupportsSecureRestorableState:(NSApplication *)app {
    return YES;
}


- (IBAction)preesButton:(id)sender {
    
    NSLog(@"%@", _myTextField);
    NSString *string = @"Hello World";
    
    NSLog(@"%@", string);
    
    self.helloTextFieldCell.title = string;
    
    // NSSpeechSynthesizer 음성합성기를 이용해서 Hello World를 읽어보자!
    NSSpeechSynthesizer *synthesizer = [[NSSpeechSynthesizer alloc] init];
    [synthesizer startSpeakingString:string];
    
}
@end