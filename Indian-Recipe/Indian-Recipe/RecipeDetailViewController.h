//
//  RecipeDetailViewController.h
//  Indian-Recipe
//
//  Created by Sabari on 27/7/16.
//  Copyright © 2016 aktrea. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RecipeDetailViewController : UIViewController
@property(nonatomic,strong)NSArray *data;
@property (weak, nonatomic) IBOutlet UITextView *ingrediantText;
@property (weak, nonatomic) IBOutlet UIImageView *recipeimg;
@property (weak, nonatomic) IBOutlet UITextView *descriptionText;

@end
