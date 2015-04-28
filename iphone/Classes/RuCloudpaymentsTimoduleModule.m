/**
 * Titanium Mobile Module for Cloudpayments
 *
 * Created by Your Name
 * Copyright (c) 2015 Your Company. All rights reserved.
 */

#import "RuCloudpaymentsTimoduleModule.h"
#import "TiBase.h"
#import "TiHost.h"
#import "TiUtils.h"

#import "CloudPaymentsAPI/CPService.h"

@implementation RuCloudpaymentsTimoduleModule

#pragma mark Internal

// this is generated for your module, please do not change it
-(id)moduleGUID
{
	return @"1460cc3e-4954-4519-94a3-c6b44ee1cc9c";
}

// this is generated for your module, please do not change it
-(NSString*)moduleId
{
	return @"ru.cloudpayments.timodule";
}

#pragma mark Lifecycle

-(void)startup
{
	// this method is called when the module is first loaded
	// you *must* call the superclass
	[super startup];

	NSLog(@"[INFO] %@ loaded",self);
}

-(void)shutdown:(id)sender
{
	// this method is called when the module is being unloaded
	// typically this is during shutdown. make sure you don't do too
	// much processing here or the app will be quit forceably

	// you *must* call the superclass
	[super shutdown:sender];
}

#pragma mark Cleanup

-(void)dealloc
{
	// release any resources that have been retained by the module
	[super dealloc];
}

#pragma mark Internal Memory Management

-(void)didReceiveMemoryWarning:(NSNotification*)notification
{
	// optionally release any resources that can be dynamically
	// reloaded once memory is available - such as caches
	[super didReceiveMemoryWarning:notification];
}

#pragma mark Listener Notifications

-(void)_listenerAdded:(NSString *)type count:(int)count
{
	if (count == 1 && [type isEqualToString:@"my_event"])
	{
		// the first (of potentially many) listener is being added
		// for event named 'my_event'
	}
}

-(void)_listenerRemoved:(NSString *)type count:(int)count
{
	if (count == 0 && [type isEqualToString:@"my_event"])
	{
		// the last listener called for event named 'my_event' has
		// been removed, we can optionally clean up any resources
		// since no body is listening at this point for that event
	}
}

#pragma Public APIs


-(id)example:(id)args
{
	// example method
	return @"hello world";
}

-(id)exampleProp
{
	// example property getter
	return @"hello world";
}

-(void)setExampleProp:(id)value
{
	// example property setter
}


-(id)isCardNumberValid:(id)args
{
    ENSURE_SINGLE_ARG(args, NSString);
    if ([CPService isCardNumberValid: args]) {
        return NUMBOOL(1);
    } else {
        NSLog(@"[INFO] Incorrect card number");
        return NUMBOOL(0);
    }
}

-(id)cardTypeFromCardNumber:(id)args
{
    /*
     typedef enum {
     CPCardTypeAmericanExpress,
     CPCardTypeDinersClub,
     CPCardTypeCarteBlanche,
     CPCardTypeMasterCard,
     CPCardTypeMaestro,
     CPCardTypeEnRoute,
     CPCardTypeJCB,
     CPCardTypeDiscover,
     CPCardTypeVisa,
     CPCardTypeUnknown
     } CPCardType;
     */
    ENSURE_SINGLE_ARG(args, NSString);
    return NUMINT([CPService cardTypeFromCardNumber:args]);
}

-(id)makeCardCryptogramPacket:(id)args
{
    ENSURE_SINGLE_ARG(args, NSDictionary);
    //    NSString *_apiPublicID = [args objectForKey:@"apiPublicID"];
    
    CPService *_apiService = [[CPService alloc] init];
    return  [_apiService makeCardCryptogramPacket: [args objectForKey:@"cardNumber"]
                                       andExpDate: [args objectForKey:@"expirationDate"]
                                           andCVV: [args objectForKey:@"cvv"]
                                 andStorePublicID: [args objectForKey:@"apiPublicID"]
             ];
}






@end
