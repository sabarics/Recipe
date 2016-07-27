//
//  ViewController.m
//  Indian-Recipe
//
//  Created by Sabari on 27/7/16.
//  Copyright © 2016 aktrea. All rights reserved.
//

#import "ViewController.h"
#import "RecipeDetailViewController.h"

@interface ViewController ()
{
    NSDictionary *data;
    NSArray  *recipedata,*getrecipe;
}
@property (weak, nonatomic) IBOutlet UITableView *recipe_table;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self getdocuments];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)getdocuments
{
    NSError *error;
    NSString *filepath=[[NSBundle mainBundle]pathForResource:@"Recipe" ofType:@"json"];
    NSString *filecontent=[NSString stringWithContentsOfFile:filepath encoding:NSUTF8StringEncoding error:&error];
    
    if(error)
    {
        NSLog(@"%@",[error localizedDescription]);
    }
    recipedata=[NSJSONSerialization JSONObjectWithData:[filecontent dataUsingEncoding:NSUTF8StringEncoding] options:0 error:NULL];
  
    NSArray *arr=[[recipedata valueForKey:@"Ingredidents"]objectAtIndex:0];
    NSLog(@"%lu",(unsigned long)arr.count);
 
    
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
//- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
//    return [[recipedata objectAtIndex:section] valueForKey:@"Recipe Name"] ;
//}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return [recipedata count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellidentifier=@"cell";
   UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:cellidentifier];
    if(cell ==nil)
    {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellidentifier];
        
    }
    UILabel *recname=(UILabel *)[cell viewWithTag:1];
    UIImageView *img=(UIImageView *)[cell viewWithTag:2];
   
    recname.text=[[recipedata valueForKey:@"Recipe Name"]objectAtIndex:indexPath.row];
    img.image=[UIImage imageNamed:[[recipedata valueForKey:@"Recipe Image"]objectAtIndex:indexPath.row]];
    return cell;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self performSegueWithIdentifier:@"sss" sender:[recipedata objectAtIndex:indexPath.row]];
    NSLog(@"%@",[[recipedata valueForKey:@"Ingredidents"]objectAtIndex:indexPath.row]);
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    RecipeDetailViewController *rec=[segue destinationViewController];
    rec.data=[sender copy];
}
@end
