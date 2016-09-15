//
//  ViewController.m
//  AbstractFactory
//
//  Created by Dmitriy Arkhipov on 08.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "ViewController.h"
#import "AbstractFactoryBase.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //test new object call
    
    NSLog(@"=====================================");
    
    SwiftDeveloper *Dmitriy = [[SwiftDeveloper alloc] init];
//    [Dmitriy generateCode]; //test call
    
    
    JavaDeveloper *Alexey = [[JavaDeveloper alloc] init];
    
    Unity3DDeveloper *Maks = [[Unity3DDeveloper alloc] init];
    
    NSMutableArray *developers = [[NSMutableArray alloc] initWithObjects:Alexey, Maks, Dmitriy, nil];
    
    NSLog(@"===========without Factory===========");
    
    for (id developer in developers)
    {
        if ([developer isKindOfClass:[Developer class]])
        {
            [developer generateCode];
        
        }
    }
    
    
    NSLog(@"=====================================");
    NSLog(@"===============Factories=============");
    
    JavaFactory *javaFactory = [[JavaFactory alloc] init];
    SwiftFactory *swftFactory = [[SwiftFactory alloc] init];
    Unity3DFactory *unityFactory = [[Unity3DFactory alloc] init];
    
    
    NSMutableArray *developersTeam = [[NSMutableArray alloc] initWithObjects:
                                 [javaFactory createDeveloper],
                                 [swftFactory createDeveloper],
                                 [unityFactory createDeveloper],
                                 nil];
    
    
    for (id developer in developersTeam)
    {
        if ([developer isKindOfClass:[Developer class]])
        {
            [developer generateCode];
        }
    }
    
    
    NSLog(@"=====================================");
    NSLog(@"=============Factory Method===========");
    
    NSMutableArray *developersTeam2 = [[NSMutableArray alloc] initWithObjects:
                                       [Developer createDeveloperWithLanguage:Java],
                                       [Developer createDeveloperWithLanguage:Swift],
                                       [Developer createDeveloperWithLanguage:Unity3D],
                                      nil];
    
    
    for (id developer in developersTeam2)
    {
        if ([developer isKindOfClass:[Developer class]])
        {
            [developer generateCode];
        }
    }
    
    
    
    NSLog(@"=====================================");
    
    Dept *web_native;
    Dept *web_unity;
    DeptCreator *creator = [[DeptCreator alloc] init];
    
    web_unity = [creator createDeptInFactory:unityFactory count:5];
    web_native = [creator createDeptInFactory:swftFactory count:10];
    
    NSLog(@"======AbstractFactory - Native=======");
    
    [web_native generateCode];
    
    NSLog(@"======AbstractFactory - Unity========");
    
    [web_unity generateCode];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
