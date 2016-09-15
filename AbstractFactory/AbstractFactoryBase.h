//
//  AbstractFactoryBase.h
//  AbstractFactory
//
//  Created by Dmitriy Arkhipov on 08.08.16.
//  Copyright © 2016 Dmitriy Arkhipov. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM (NSInteger, ProgrammingLanguage) { Java, Swift, Unity3D };



@protocol IDeveloper <NSObject>

@optional

- (void) generateCode;

- (void) stopGenCode;

@end



@interface Developer : NSObject <IDeveloper>

/**
 Заголовок фабричного метода. Создание разработчиков.
 */
+ (Developer *) createDeveloperWithLanguage: (ProgrammingLanguage) lang;

- (void) generateCode;

- (void) stopGenCode;

@end


@interface JavaDeveloper : Developer

- (void) generateCode;

@end


@interface SwiftDeveloper : Developer

- (void) generateCode;

@end

@interface Unity3DDeveloper : Developer

- (void) generateCode;

@end


/**
 Шаблон фабрики.
 */
@interface DevFactory : NSObject

/**
 Абстрактный фабричный метод.
 */
- (Developer *) createDeveloper;

@end

//Фабрики создающие разработчиков.

@interface JavaFactory : DevFactory

- (Developer *) createDeveloper;

@end

@interface SwiftFactory : DevFactory

- (Developer *) createDeveloper;

@end

@interface Unity3DFactory : DevFactory

- (Developer *) createDeveloper;

@end


/**
 Отдел. Здесь хранятся программисты.
 */
@interface Dept : NSObject

@property (strong, nonatomic) NSMutableArray *personal;

/**
 Всем кодить
 */
- (void) generateCode;
/**
 Остановить кодинг
 */
- (void) stopGenCode;

@end

/**
 Создатель отдела.
 */
@interface DeptCreator : NSObject

/**
 Создает отдел при помощи фабрики разработчиков.
 @param fact Фабрика разработчиков
 @param cnt Cчетчик разработчиков
 */
- (Dept *) createDeptInFactory:(DevFactory *)fact count:(int)cnt;

@end







