//
//  ViewController.m
//  Soundboard Demo
//
//  Created by Jorge Casariego on 07/03/14.
//  Copyright (c) 2014 Jorge Casariego. All rights reserved.
//

#import "ViewController.h"
#import "SoundModel.h"

@interface ViewController ()
{
    NSArray *_soundFilenamesArray;
    AVAudioPlayer *_audioPlayer;
}

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    _soundFilenamesArray = [[[SoundModel alloc] init] getSoundFileNames];
    [self setupButtons];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setupButtons
{
    for(int i=0; i < _soundFilenamesArray.count; i++)
    {
        NSString *soundFilename = _soundFilenamesArray[i];
        
        UIButton *soundButton = [UIButton buttonWithType:UIButtonTypeSystem];
        [soundButton setTitle:soundFilename forState:UIControlStateNormal];
        [soundButton setFrame:CGRectMake(self.view.frame.size.width/2 - 60, (i * 70) + 60, 120, 60)];
        [soundButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:soundButton];
    }
    
}

-(void)buttonClicked:(id)sender
{
    UIButton *clickedButton = sender;
    NSString *soundFilename = clickedButton.titleLabel.text;
    NSString *fullPath = [NSString stringWithFormat:@"%@/%@.mp3", [[NSBundle mainBundle] resourcePath], soundFilename];
    
    NSURL *soundFileUrl = [NSURL fileURLWithPath:fullPath];
    
    _audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundFileUrl error:nil];
    _audioPlayer.numberOfLoops = 1;
    [_audioPlayer play];
    

}

@end
