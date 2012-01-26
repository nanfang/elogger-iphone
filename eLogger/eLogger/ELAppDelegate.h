//
//  ELAppDelegate.h
//  eLogger
//
//  Created by Nan Fang on 1/22/12.
//  Copyright (c) 2012 Free. No rights reserved.
//

#import <UIKit/UIKit.h>
#import "ELLoginViewController.h"

@interface ELAppDelegate : UIResponder <UIApplicationDelegate>{
    ELLoginViewController * _loginViewController;
}

@property (strong, nonatomic) UIWindow *window;

@end
