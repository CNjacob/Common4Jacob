//
//  ViewController.m
//  Common4Jacob
//
//  Created by jacob on 2018/10/31.
//  Copyright © 2018 CNJacob. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSMutableArray *mArr = [NSMutableArray arrayWithObjects:@"1", nil, @"2", nil, nil];
    [mArr addObject:nil];
    [mArr addObject:@"4"];
    [mArr insertObject:nil atIndex:100];
    [mArr insertObject:@"5" atIndex:5];
    NSLog(@"index10 = %@", [mArr objectAtIndex:10]);
    NSLog(@"mArr = %@", mArr);
    
    NSMutableDictionary *mdic = [NSMutableDictionary dictionaryWithObjectsAndKeys:@"one", @"1", @"two", @"2", @"three", @"3", nil];
    [mdic setObject:nil forKey:@"testnil"];
    [mdic setObject:nil forKeyedSubscript:@"scripttest"];
    NSLog(@"mdic = %@", mdic);
}

@end
