//
//  AbstractFactoryBase.m
//  AbstractFactory
//
//  Created by Dmitriy Arkhipov on 08.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import "AbstractFactoryBase.h"


@implementation Developer

+ (Developer *) createDeveloperWithLanguage: (ProgrammingLanguage) lang {

    Developer *dev;
    
    switch (lang) { //switch добавлен только для демонстрации, плохой подход :]
        case Java:
            dev = [[JavaDeveloper alloc] init];
            break;
            
        case Swift:
            dev = [[SwiftDeveloper alloc] init];
            break;
            
            
        case Unity3D:
            dev = [[Unity3DDeveloper alloc] init];
            break;
            
        default:
            dev = [[Unity3DDeveloper alloc] init];
            break;
    }

    return dev;
}


- (void) generateCode {

    NSLog(@"Developer: Jast Code");


}

- (void) stopGenCode {

    NSLog(@"Developer: Stop Code");

}

@end




@implementation DevFactory

- (Developer *) createDeveloper { [self doesNotRecognizeSelector:_cmd]; return nil; }

@end



@implementation JavaDeveloper

- (void) generateCode {

    NSLog(@"JavaDeveloper: Jast Code Java");

}

@end

@implementation SwiftDeveloper

- (void) generateCode {
    
    NSLog(@"SwiftDeveloper: Jast Code Swift :]");
    
}

@end

@implementation Unity3DDeveloper

- (void) generateCode {
    
    NSLog(@"Unity3DDeveloper: Jast Code C#");
    
}

@end



//фабрики

@implementation JavaFactory

- (Developer *) createDeveloper {
    
    id dev = [[JavaDeveloper alloc] init];

    return dev;
}

@end


@implementation SwiftFactory

- (Developer *) createDeveloper {
    
    id dev = [[SwiftDeveloper alloc] init];
    
    return dev;
}

@end

@implementation Unity3DFactory

- (Developer *) createDeveloper {
    
    id dev = [[Unity3DDeveloper alloc] init];
    
    return dev;
}

@end


//управление отделом

@implementation Dept

- (void) generateCode {
    
    for (id pers in _personal)
    {
        if ([pers isKindOfClass: [Developer class]])
        {
            [pers generateCode];
        }
    }
}


- (void) stopGenCode {
    
    for (id pers in _personal)
    {
        if ([pers isKindOfClass: [Developer class]])
        {
            [pers stopGenCode];
        }
    }
}

@end


@implementation DeptCreator

- (Dept *) createDeptInFactory:(DevFactory *)fact count:(int)cnt {
    
    Dept *dept = [[Dept alloc] init];
    
    dept.personal = [[NSMutableArray alloc] init];
    
    for (int i = 0; i<cnt; i++)
    {
        [dept.personal addObject:[fact createDeveloper]];
    
    }

    return dept;

}

@end



