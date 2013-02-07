//
//  IXStarWarsCharacter.h
//  StarWars
//
//  Created by Javier García Gallego on 19/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IXStarWarsCharacter : NSObject

@property (strong, nonatomic) NSString *firstName;
@property (strong, nonatomic) NSString *lastName;
@property (strong, nonatomic) NSString *alias;
@property (strong, nonatomic) NSURL *wikiPage;
@property (strong, nonatomic) NSData *soundData;
@property (strong, nonatomic) UIImage *photo;

//Designated Initializer
- (id) initWithFistName:(NSString *) aFirstName
               lastName:(NSString *) aLastName
                  alias:(NSString *) anAlias
               wikiPage:(NSURL *) aURL
              soundData:(NSData *) aSoundData
                  photo:(UIImage *) aPhoto; 

- (id) initWithAlias:(NSString *) anAlias
            wikiPage:(NSURL *) aURL
           soundData:(NSData *) aSoundData
               photo:(UIImage *) aPhoto;

@end
