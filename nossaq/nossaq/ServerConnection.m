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

+(NSString *) sendXMLWithPOSTConnetion{
    
    NSString * xmlString = @"<user><username>semih</username><password>123456</password></user>";

    NSMutableString *serverAddress = [NSMutableString stringWithString:@"http://139.179.206.143:9000/login"] ;
    NSLog(@"FF%@FF", serverAddress);
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
    
    NSLog(@"FF%@FF", responseString);
    return responseString;
}

@end