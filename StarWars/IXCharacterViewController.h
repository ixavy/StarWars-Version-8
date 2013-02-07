//
//  IXCharacterViewController.h
//  StarWars
//
//  Created by Javier García Gallego on 19/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXStarWarsCharacter.h"
#import "CafPlayer.h"
#import "IXTableCharactersViewController.h"

@interface IXCharacterViewController : UIViewController <UISplitViewControllerDelegate, IXTableCharacterViewControllerDelegate>

@property (strong, nonatomic) IXStarWarsCharacter *model;
@property (weak, nonatomic) IBOutlet UIImageView *photoView;
@property (strong, nonatomic) CafPlayer *player;

- (IBAction)playSound:(id)sender;
- (IBAction)displayWiki:(id)sender;

- (id) initWithModel: (IXStarWarsCharacter *) aModel;

@end
