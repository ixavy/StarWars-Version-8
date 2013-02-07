//
//  IXAppDelegate.m
//  StarWars
//
//  Created by Javier García Gallego on 19/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import "IXAppDelegate.h"

#import "IXStarWarsCharacter.h"
#import "IXStarWarsCharacters.h"

#import "IXCharacterViewController.h"
#import "IXWikiViewController.h"
#import "IXTableCharactersViewController.h"

@implementation IXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor orangeColor];
    
    // Creamos el modelo
    
    IXStarWarsCharacters *chars = [[IXStarWarsCharacters alloc] init];
    
    // Creamos los controladores
    
    IXTableCharactersViewController *charsVC = [[IXTableCharactersViewController alloc] initWithModel:chars tableStyle:UITableViewStyleGrouped];
    
    IXCharacterViewController *charVC = [[IXCharacterViewController alloc] initWithModel:[chars imperialCharacterAtIndex:0]];
    
    // Creamos los navigations
    
    UINavigationController *tableNAV = [[UINavigationController alloc]init];
    [tableNAV pushViewController:charsVC animated:NO];
    
    UINavigationController *charNAV = [[UINavigationController alloc] init];
    [charNAV pushViewController:charVC animated:NO];
    
    // Comprobamos el tipo de pantalla
    
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad){
        // Tableta
        // Crear el combinador
        
        UISplitViewController *splitVC = [[UISplitViewController alloc]init];
        [splitVC setViewControllers:@[tableNAV, charNAV]];
        
        // Asignamos delegados
        
        splitVC.delegate = charVC;
        charsVC.delegate = charVC;
        
        // Indicamos el controlador raíz
        self.window.rootViewController = splitVC;

    } else {
        // Teléfono
        
        // Asignamos delegados
        
        charsVC.delegate = charsVC;
        
        // Indicamos el controlador raíz
        self.window.rootViewController = tableNAV;
    }
    
            
    [[self window] makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
