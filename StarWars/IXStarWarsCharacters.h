//
//  IXStarWarsCharacters.h
//  StarWars
//
//  Created by Javier García Gallego on 20/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IXStarWarsCharacter.h"

@interface IXStarWarsCharacters : NSObject

@property (nonatomic,readonly) int rebelCount;
@property (nonatomic,readonly) int imperialCount;

-(IXStarWarsCharacter *)rebelCharacterAtIndex:(int) index;
-(IXStarWarsCharacter *)imperialCharacterAtIndex:(int) index;

@end
