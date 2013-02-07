//
//  IXWikiViewController.h
//  StarWars
//
//  Created by Javier García Gallego on 19/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IXStarWarsCharacter.h"

#define NOTIFICATION_NAME @"characterHasChanged"
#define CHARACTER_KEY @"character"


@interface IXWikiViewController : UIViewController <UIWebViewDelegate>

@property (strong, nonatomic) IXStarWarsCharacter *model;
@property (weak, nonatomic) IBOutlet UIWebView *browser;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activityView;


- (id) initWithModel:(IXStarWarsCharacter *) aModel;

@end
