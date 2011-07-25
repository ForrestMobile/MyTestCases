//
//  JSONRunner.h
//  MasterDetail
//
//  Created by Forrest on 7/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import <Foundation/Foundation.h>

@interface JSONRunner : NSObject {

}

+ (JSONRunner*) sharedInstance;
- (void) testJSONCase:(NSNotification*)notifcation;

@end
