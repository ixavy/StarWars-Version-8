//
//  IXWikiViewController.m
//  StarWars
//
//  Created by Javier García Gallego on 19/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import "IXWikiViewController.h"

@interface IXWikiViewController ()

@end

@implementation IXWikiViewController

- (id) initWithModel:(IXStarWarsCharacter *) aModel
{
    if (self = [super initWithNibName:nil
                               bundle:nil]) {
        _model = aModel;
        self.title = @"Wiki";

    }
    
    return self;
}
                
-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
 // Alta en notificación
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center addObserver:self selector:@selector(onCharacterChange:) name:NOTIFICATION_NAME object:nil];
    
    // Configurar vistas
    self.browser.delegate = self;
    
    // Sincronizar la vista con el modelo
    
    [self.browser loadRequest:[NSURLRequest requestWithURL:self.model.wikiPage]];
    
    //
}

-(void)onCharacterChange:(NSNotification *) note {
    // Sacamos el diccionario de la notification
    
    NSDictionary *dict = note.userInfo;
    
    
    // Sacamos el personaje del diccionario
    
    IXStarWarsCharacter *character = [dict objectForKey:CHARACTER_KEY];
    
    // Actualizamos el modelo
    self.model = character;
    
    // Actualizamos la página web
    [self.browser loadRequest:[NSURLRequest requestWithURL:self.model.wikiPage]];
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    
    // Baja en notificaciones
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    
    [center removeObserver:self];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIWebViewDelegate

-(void)webViewDidFinishLoad:(UIWebView *)webView {
    
    // Parale los pies al activity
    [self.activityView stopAnimating];
}

-(BOOL)webView:(UIWebView *)webView
        shouldStartLoadWithRequest:(NSURLRequest *)request
        navigationType:(UIWebViewNavigationType)navigationType {
    
    if ((navigationType == UIWebViewNavigationTypeLinkClicked) ||
        (navigationType == UIWebViewNavigationTypeFormSubmitted)) {
        
        return NO;
    } else {
        return YES;
    }
}

@end
