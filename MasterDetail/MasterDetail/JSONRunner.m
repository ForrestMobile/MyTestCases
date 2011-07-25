//
//  JSONRunner.m
//  MasterDetail
//
//  Created by Forrest on 7/25/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//	File created using Singleton XCode Template by Mugunth Kumar (http://blog.mugunthkumar.com)
//  More information about this template on the post http://mk.sg/89	
//  Permission granted to do anything, commercial/non-commercial with this file apart from removing the line/URL above

#import "JSONRunner.h"
#import "JSONKit.h"

static JSONRunner *_instance;
@implementation JSONRunner

#pragma mark -
#pragma mark Singleton Methods

+ (JSONRunner*)sharedInstance
{
	@synchronized(self) {
		
        if (_instance == nil) {
			
            _instance = [[self alloc] init];
            
            // Allocate/initialize any member variables of the singleton class here
            // example
			//_instance.member = @"";
            
            [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testJSONCase:) name:@"JSON" object:nil];
        }
    }
    return _instance;
}

+ (id)allocWithZone:(NSZone *)zone

{	
    @synchronized(self) {
		
        if (_instance == nil) {
			
            _instance = [super allocWithZone:zone];			
            return _instance;  // assignment and return on first allocation
        }
    }
	
    return nil; //on subsequent allocation attempts return nil	
}


- (id)copyWithZone:(NSZone *)zone
{
    return self;	
}

- (id)retain
{	
    return self;	
}

- (unsigned)retainCount
{
    return UINT_MAX;  //denotes an object that cannot be released
}

- (void)release
{
    //do nothing
}

- (id)autorelease
{
    return self;	
}

#pragma mark -
#pragma mark Custom Methods

// Add your custom methods here

+ (void) simpleTest1{
    //REMOTE JSON 
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.jaiku.com/feed/json"]
                                                cachePolicy:NSURLRequestReturnCacheDataElseLoad
                                            timeoutInterval:30];
    // Fetch the JSON response
	NSData *urlData;
	NSURLResponse *response;
	NSError *error;
    
	// Make synchronous request
	urlData = [NSURLConnection sendSynchronousRequest:urlRequest returningResponse:&response error:&error];
    
    //JSON FILE 
    NSData* jsonData = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"test" ofType:@"json"]];
    JSONDecoder* decoder = [[JSONDecoder alloc]
                            initWithParseOptions:JKParseOptionNone];
    NSArray* json = [decoder objectWithData:urlData];
    NSLog(@"json %@",json);
    [decoder release];
}


+ (void) testJSONCase:(NSNotification*)notifcation{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    
    NSDictionary *dict = [notifcation userInfo];
    NSInteger index = [[dict objectForKey:@"index"] intValue];
    switch (index) {
        case 0:
            //simple json test
            [self simpleTest1];
            break;
            
        default:
            break;
    }
    
}

@end
