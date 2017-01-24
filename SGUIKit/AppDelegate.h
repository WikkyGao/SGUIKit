//
//  AppDelegate.h
//  SGUIKit
//
//  Created by Wikky on 2017/1/10.
//  Copyright © 2017年 Wikky. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;


@end

