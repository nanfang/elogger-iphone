//
//  DBMigrate.h
//  eLogger
//
//  Created by Nan Fang on 1/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBMigrator : NSObject
- (id)initWithVersonFile:(NSString *)versionFile sqlFile:(NSString *)sqlFile;
/* migrate to latest */
- (void) migrate;
/* migrate to specific version */
- (void) migrateVersion:(int)version;
@end
