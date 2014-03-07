//
//  SoundModel.m
//  Soundboard Demo
//
//  Created by Jorge Casariego on 07/03/14.
//  Copyright (c) 2014 Jorge Casariego. All rights reserved.
//

#import "SoundModel.h"

@implementation SoundModel

-(NSArray*)getSoundFileNames
{
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Sounds" ofType:@"plist"];
    NSMutableDictionary *plistDictionary = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    NSArray *soundsFileNameArray = plistDictionary[@"Sounds"];
    
    return soundsFileNameArray;
}

@end
