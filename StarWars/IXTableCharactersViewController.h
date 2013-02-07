//
//  IXTableCharactersViewController.h
//  StarWars
//
//  Created by Javier García Gallego on 20/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXStarWarsCharacters.h"

#define IMPERIAL_SECTION 0
#define REBEL_SECTION 1
#define NUMBER_OF_SECTIONS 2
#define NOTIFICATION_NAME @"characterHasChanged"
#define CHARACTER_KEY @"character"


@class IXTableCharactersViewController;

@protocol IXTableCharacterViewControllerDelegate <NSObject>
@optional
-(void)tableCharacterViewController:(IXTableCharactersViewController *) sender
                 didSelectCharacter:(IXStarWarsCharacter *) character;

@end

@interface IXTableCharactersViewController : UITableViewController <IXTableCharacterViewControllerDelegate>

@property (nonatomic, strong) IXStarWarsCharacters *model;
@property (nonatomic, weak) id<IXTableCharacterViewControllerDelegate> delegate;

-(id) initWithModel: (IXStarWarsCharacters *) aModel tableStyle:(UITableViewStyle) aStyle;

@end

