//
//  IXCharacterViewController.m
//  StarWars
//
//  Created by Javier García Gallego on 19/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import "IXCharacterViewController.h"
#import "IXWikiViewController.h"

@interface IXCharacterViewController ()

@end

@implementation IXCharacterViewController

- (id)initWithModel:(IXStarWarsCharacter *) aModel
{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = aModel;
        self.title = self.model.alias;
    }
    
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    //Sincronizar modelo y vista
    self.photoView.image = self.model.photo;
    
    // cambiamos el color de la barra de navegación
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0
                                                                        green:0
                                                                         blue:0.12
                                                                        alpha:1];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Actions

- (IBAction)playSound:(id)sender {
    self.player = [CafPlayer cafPlayer];
    [self.player playSoundData:self.model.soundData];
}

- (IBAction)displayWiki:(id)sender {
    // Creamos un wikiVC
    
    IXWikiViewController *wikiVC = [[IXWikiViewController alloc] initWithModel:self.model];
    
    // se lo encasquetamos al navigation que haya
    // si no hay nadie en el self.navigationController, no pasa nada
    
    [self.navigationController pushViewController:wikiVC animated:YES];
    
}

#pragma mark - UISplitViewControllerDelegate

-(void) splitViewController:(UISplitViewController *)svc
     willHideViewController:(UIViewController *)aViewController
          withBarButtonItem:(UIBarButtonItem *)barButtonItem
       forPopoverController:(UIPopoverController *)pc
{
    // ponemos el botón en la barra
    
    self.navigationItem.rightBarButtonItem = barButtonItem;
}

-(void) splitViewController:(UISplitViewController *)svc
     willShowViewController:(UIViewController *)aViewController
  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem
{
    self.navigationItem.rightBarButtonItem = nil;
}

#pragma mark - IXTableCharacterViewControllerDelegate

-(void) tableCharacterViewController:(IXTableCharactersViewController *)sender
                  didSelectCharacter:(IXStarWarsCharacter *)character{
    
    // Cambiamos nuestro modelo
    self.model = character;
    
    // Actualizamos imagen y title
    self.photoView.image = self.model.photo;
    self.title = self.model.alias;
}

@end
