//
//  IXTableCharactersViewController.m
//  StarWars
//
//  Created by Javier García Gallego on 20/01/13.
//  Copyright (c) 2013 ixavy. All rights reserved.
//

#import "IXTableCharactersViewController.h"
#import "IXStarWarsCharacter.h"
#import "IXCharacterViewController.h"

@interface IXTableCharactersViewController ()

@end

@implementation IXTableCharactersViewController

-(id) initWithModel: (IXStarWarsCharacters *) aModel tableStyle:(UITableViewStyle) aStyle{
    if (self = [super initWithStyle:aStyle]) {
        _model = aModel;
        self.title = @"StarWars Encyclopaedia";
    }
    return self;
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0 green:0 blue:0.12 alpha:0];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (section == IMPERIAL_SECTION) {
        return @"Imperials";
    } else {
        return @"Rebels";
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (section == IMPERIAL_SECTION) {
        return self.model.imperialCount;
    } else {
        return self.model.rebelCount;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    // Averiguar de qué personaje me está hablando
    
    IXStarWarsCharacter *character = nil;
    if (indexPath.section == IMPERIAL_SECTION) {
        // Imperial
        character = [self.model imperialCharacterAtIndex:indexPath.row];
    } else {
        // Rebeldes
        character = [self.model rebelCharacterAtIndex:indexPath.row];
    }
    
    // Pedirle a la tabla una celda (si la tiene)
  
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    // Si me han devuelto nil, la creo a pelo
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier];
    }
    // Sincronizo celda con personaje

    cell.imageView.image = character.photo;
    cell.textLabel.text = character.alias;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ %@", character.firstName, character.lastName];
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Averiguar de que personaje se trata
    IXStarWarsCharacter *character = nil;
    if (indexPath.section == IMPERIAL_SECTION) {
        // Imperial
        character = [self.model imperialCharacterAtIndex:indexPath.row];
    } else {
        // Rebeldes
        character = [self.model rebelCharacterAtIndex:indexPath.row];
    }
    
    // Comprobamos que el delegado implementa el método
    
    if ([self.delegate respondsToSelector:@selector(tableCharacterViewController:didSelectCharacter:)]) {
    
        // Enviamos mensaje a nuestro delegado
    
        [self.delegate tableCharacterViewController:self
                                 didSelectCharacter:character];
        
        // Además enviamos una notificación
        
        NSNotification *note = [NSNotification notificationWithName:NOTIFICATION_NAME
                                                             object:self
                                                           userInfo:@{CHARACTER_KEY : character}];
        NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
        [center postNotification:note];

    }
}

#pragma mark - IXTableCharacterViewControllerDelegate

-(void)tableCharacterViewController:(IXTableCharactersViewController *)sender didSelectCharacter:(IXStarWarsCharacter *)character{
    
    // Crear un controlador para el personaje
    
    IXCharacterViewController *charVC = [[IXCharacterViewController alloc] initWithModel:character];
    
    // Hacer un push al navigation controller dentro del cual estamos
    
    [self.navigationController pushViewController:charVC animated:YES];
}

@end
