//
//  RecipeDetailViewController.m
//  Indian-Recipe
//
//  Created by Sabari on 27/7/16.
//  Copyright © 2016 aktrea. All rights reserved.
//

#import "RecipeDetailViewController.h"

@interface RecipeDetailViewController ()

@end

@implementation RecipeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",_data);
    
    UILabel *lblTitle = [[UILabel alloc] initWithFrame:CGRectMake(70, 0, 180, 40)];
    lblTitle.text =[_data valueForKey:@"Recipe Name"] ;
    lblTitle.textAlignment = NSTextAlignmentCenter;
    lblTitle.numberOfLines = 1;
    lblTitle.font = [UIFont systemFontOfSize:20.0f];
    lblTitle.textColor = [UIColor blackColor];
    lblTitle.backgroundColor = [UIColor clearColor];
    self.navigationItem.titleView = lblTitle;
    
    NSArray *sss=[_data valueForKey:@"Ingredidents"];
    NSArray *sss1=[_data valueForKey:@"Descriptipn"];
    NSMutableString *textViewText = [NSMutableString string];
     NSMutableString *textViewText1 = [NSMutableString string];
    
    for (NSString *str in sss)
        [textViewText appendFormat:@"%@\n\n", str];
    _ingrediantText.text= textViewText;
    
    
    for (NSString *str in sss1)
        [textViewText1 appendFormat:@"%@\n\n", str];
    _descriptionText.text= textViewText1;
    NSString *img=[_data valueForKey:@"Recipe Image"];
    _recipeimg.image=[UIImage imageNamed:img];


    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
