//
//  SingletonSample.m
//  BigBallOfMud
//
//  Created by Jason Agostoni on 1/22/12.
//

#import "ServerConnection.h"


@implementation ServerConnection

#pragma mark Singleton Implementation
static ServerConnection *sharedObject;

+ (ServerConnection*)sharedInstance
{
    if (sharedObject == nil) {
        sharedObject = [[super allocWithZone:NULL] init];
    }
    return sharedObject;
}

#pragma mark Shared Public Methods
+(NSString *) getDataWithGETConnection: (NSString *)serverURL MethodName: (NSString *)methodName Paramater: (NSMutableArray *)parameters{
    NSMutableString *serverAddress = [NSMutableString stringWithString:@""] ;
    [serverAddress appendString:serverURL];
    [serverAddress appendString:@"/"];
    [serverAddress appendString:methodName];
    for (NSString * parameter in parameters) {
        [serverAddress appendString:@"/"];
        [serverAddress appendString:parameter];
    }
    NSLog(@"FF%@FF", serverAddress);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:serverAddress]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:10];
    
    [request setHTTPMethod: @"GET"];
    
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    NSLog(@"FF%@FF", responseString);
    return responseString;
}

+(NSString *) sendXMLWithPOSTConnection{
    
    NSString * xmlString = @"<user><username>semih</username><password>123456</password></user>";
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"Properties" ofType:@"plist"];
    NSData *plistXML = [[NSFileManager defaultManager] contentsAtPath:plistPath];
    NSString *errorDesc = nil;
    NSPropertyListFormat format;
    // convert static property liost into dictionary object
    NSDictionary *propertyDictionary = (NSDictionary *)[NSPropertyListSerialization propertyListFromData:plistXML mutabilityOption:NSPropertyListMutableContainersAndLeaves format:&format errorDescription:&errorDesc];
    if (!propertyDictionary)
    {
        NSLog(@"Error reading plist: %@, format: %d", errorDesc, format);
    }
    // assign values
    NSString *serverAddressString = [NSString stringWithFormat:@"%@login", [propertyDictionary objectForKey:@"ServerIP"]];
    NSMutableString *serverAddress = [NSMutableString stringWithString:serverAddressString];
    NSLog(@"Server address: %@", serverAddress);
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:serverAddress]
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:10];
    
    [request setValue:@"text/xml" forHTTPHeaderField:@"Content-type"];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[xmlString dataUsingEncoding:NSASCIIStringEncoding]];
    
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    NSString *responseString = [[NSString alloc] initWithData:response encoding:NSUTF8StringEncoding];
    
    return responseString;
    }

@end