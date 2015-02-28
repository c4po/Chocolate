//
//  chocolateViewController.m
//  Chocolate
//
//  Created by Max Cai on 2014-07-11.
//  Copyright (c) 2014 max. All rights reserved.
//

#import "chocolateViewController.h"

@interface chocolateViewController ()
@property (weak, nonatomic) IBOutlet UILabel *greetingMessage;
@property (nonatomic) int chocolates;
@end
NSString * const kChocolates = @"kChocolates";

@implementation chocolateViewController
- (IBAction)clickChocaltes:(UIButton *)sender {
    self.chocolates ++;
}

- (void) setChocolates:(int)chocolates
{
    _chocolates=chocolates;
    self.greetingMessage.text= [NSString stringWithFormat:@"You have %d chocolates.",self.chocolates];
    [self saveData];
}
- (void)viewDidLoad
{
    NSLog(@"viewDidLoad");

    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self loadData];
}

-(void)saveData
{
    [[NSUserDefaults standardUserDefaults]
     setObject:[NSNumber numberWithInt:self.chocolates] forKey:kChocolates];
    
    [[NSUserDefaults standardUserDefaults] synchronize];
}


-(void)loadData
{
    if ([[NSUserDefaults standardUserDefaults] objectForKey:kChocolates])
    {
        self.chocolates = [(NSNumber *)[[NSUserDefaults standardUserDefaults]
                                   objectForKey:kChocolates] intValue];
    }
    else
    {
        self.chocolates = 0;
    }
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
