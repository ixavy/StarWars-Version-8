//
//  IXStarWarsCharacters.m
//  StarWars
//
//  Created by Javier García Gallego on 20/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import "IXStarWarsCharacters.h"

@interface IXStarWarsCharacters ()

@property (strong,nonatomic) NSArray *rebelCharacters;
@property (strong,nonatomic) NSArray *imperialCharacters;

@end

@implementation IXStarWarsCharacters

-(id) init{
    if (self = [super init]) {
        // crear los personajes
        
        // Darth Vader
        NSURL *vaderURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/Darth_Vader"];
        NSData *vaderSound = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"vader" withExtension:@"caf"]];
        UIImage *vaderImage = [UIImage imageNamed:@"darthVader.jpg"];
        
        IXStarWarsCharacter *vader = [[IXStarWarsCharacter alloc]
                                      initWithFistName:@"Anakin"
                                      lastName:@"Skywalker"
                                      alias:@"Darth Vader"
                                      wikiPage:vaderURL
                                      soundData:vaderSound
                                      photo:vaderImage];
        // C-3PO
        NSURL *c3poURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/C-3PO"];
        NSData *c3poSound = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"c3po" withExtension:@"caf"]];
        UIImage *c3poImage = [UIImage imageNamed:@"c3po.png"];
        
        IXStarWarsCharacter *c3po = [[IXStarWarsCharacter alloc]
                                     initWithAlias:@"C-3PO"
                                     wikiPage:c3poURL
                                     soundData:c3poSound
                                     photo:c3poImage];
        
        // Chewie
        NSURL *chewieURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/chewie"];
        NSData *chewieSound = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"chewbacca" withExtension:@"caf"]];
        UIImage *chewieImage = [UIImage imageNamed:@"chewbacca.jpg"];
        
        IXStarWarsCharacter *chewie = [[IXStarWarsCharacter alloc]
                                       initWithAlias:@"Chewie"
                                       wikiPage:chewieURL
                                       soundData:chewieSound
                                       photo:chewieImage];
        
        // Yoda
        NSURL *yodaURL = [NSURL URLWithString:@"http://en.wikipedia.org/wiki/yoda"];
        NSData *yodaSound = [NSData dataWithContentsOfURL:[[NSBundle mainBundle] URLForResource:@"yoda" withExtension:@"caf"]];
        UIImage *yodaImage = [UIImage imageNamed:@"yoda.jpg"];
        
        IXStarWarsCharacter *yoda = [[IXStarWarsCharacter alloc]
                                     initWithFistName:@"Master"
                                     lastName:@"Yoda"
                                     alias:@"Yoda"
                                     wikiPage:yodaURL
                                     soundData:yodaSound
                                     photo:yodaImage];

        
        // meterlos en su array correspondiente
        
        self.rebelCharacters = @[c3po, chewie, yoda];
        self.imperialCharacters = @[vader];
    }
    return self;
}

-(int)rebelCount {
    return [self.rebelCharacters count];
}

-(int)imperialCount {
    return [self.imperialCharacters count];
}

-(IXStarWarsCharacter *)rebelCharacterAtIndex:(int) index{
    return ([self.rebelCharacters objectAtIndex:index]);
}

-(IXStarWarsCharacter *)imperialCharacterAtIndex:(int) index{
    return ([self.imperialCharacters objectAtIndex:index]);
}


@end
