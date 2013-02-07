//
//  IXStarWarsCharacter.m
//  StarWars
//
//  Created by Javier García Gallego on 19/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import "IXStarWarsCharacter.h"

@implementation IXStarWarsCharacter

//Designated Initializer
- (id) initWithFistName:(NSString *) aFirstName
               lastName:(NSString *) aLastName
                  alias:(NSString *) anAlias
               wikiPage:(NSURL *) aURL
              soundData:(NSData *) aSoundData
                  photo:(UIImage *) aPhoto
{
    if (self = [super init]) {
        _firstName = aFirstName;
        _lastName = aLastName;
        _alias = anAlias;
        _wikiPage = aURL;
        _soundData = aSoundData;
        _photo = aPhoto;
    }
    return self;
}

- (id) initWithAlias:(NSString *) anAlias
            wikiPage:(NSURL *) aURL
           soundData:(NSData *) aSoundData
               photo:(UIImage *) aPhoto
{
    return [self initWithFistName:@""
                         lastName:@""
                            alias:anAlias
                         wikiPage:aURL
                        soundData:aSoundData
                            photo:aPhoto];
}


@end
