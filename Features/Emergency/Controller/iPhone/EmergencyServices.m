//
//  EmergencyServices.m
//  iWVU
//
//  Created by Jared Crawford on 6/26/09.
//  Copyright 2009 Jared Crawford. All rights reserved.
//

/*
 Copyright (c) 2009 Jared Crawford
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 
 The trademarks owned or managed by the West Virginia 
 University Board of Governors (WVU) are used under agreement 
 between the above copyright holder(s) and WVU. The West 
 Virginia University Board of Governors maintains ownership of all 
 trademarks. Reuse of this software or software source code, in any 
 form, must remove all references to any trademark owned or 
 managed by West Virginia University.
 */ 

#import "EmergencyServices.h"

@implementation EmergencyServices


- (void)viewDidLoad {
    [super viewDidLoad];
	
	//These arrays represent the text label of each cell, 1 array per section
	
	secs = [[NSArray alloc] initWithObjects:@"",@"Police",@"Medical", @"Fire", @"Miscellaneous", nil];
	
	sec0 = [[NSArray alloc] initWithObjects:@"911", nil];
	sec1 = [[NSArray alloc] initWithObjects:@"Campus",@"Morgantown", nil];
	sec2 = [[NSArray alloc] initWithObjects:@"WVU Student Health",@"WVU Hospitals", @"Ruby Memorial", @"Monongalia General", nil];
	sec3 = [[NSArray alloc] initWithObjects:@"Morgantown Fire Department", nil];
	sec4 = [[NSArray alloc] initWithObjects:@"Allegheny Energy", @"Poison Control",@"Road Conditions", @"Local AT&T Store", @"Nearest Apple Store", nil];
	
	
}






#pragma mark UITableView

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [secs count];
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if(0==section){
		return [sec0 count];
	}
	else if(1==section){
		return [sec1 count];
	}
	else if(2==section){
		return [sec2 count];
	}
	else if(3==section){
		return [sec3 count];
	}
	else if(4==section){
		return [sec4 count];
	}
	
	return 0;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    iWVUAppDelegate *AppDelegate = [UIApplication sharedApplication].delegate;
	cell = [AppDelegate configureTableViewCell:cell inTableView:tableView forIndexPath:indexPath];
	
	if (indexPath.section == 0) {
		cell.detailTextLabel.text = nil;
		cell.backgroundColor = [UIColor colorWithRed:.6627 green:.1697 blue:.0509 alpha:1];
		cell.textLabel.textColor = [UIColor whiteColor];
		cell.textLabel.backgroundColor = cell.backgroundColor;
		cell.textLabel.shadowColor = [UIColor blackColor];
		
	}
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";	
	
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:CellIdentifier] autorelease];
    }
    
	cell.textLabel.adjustsFontSizeToFitWidth = YES;
	cell.detailTextLabel.adjustsFontSizeToFitWidth = YES;
	cell.detailTextLabel.textColor = [UIColor WVUBlueColor];
	
	NSString *mainText = @"";
	NSString *subText = @"";
	
	if(0==indexPath.section){
		mainText = [sec0 objectAtIndex:indexPath.row];
	}
	else if(1==indexPath.section){
		mainText =  [sec1 objectAtIndex:indexPath.row];
		if([@"Campus" isEqualToString:mainText]){
			subText = @"(304) 293-COPS";
		}
		else if([@"Morgantown" isEqualToString:mainText]){
			subText = @"(304) 599-6382";
		}
	}
	else if(2==indexPath.section){
		mainText =  [sec2 objectAtIndex:indexPath.row];
		if([@"WVU Student Health" isEqualToString:mainText]){
			subText = @"(304) 293-2311";
		}
		else if([@"WVU Hospitals" isEqualToString:mainText]){
			subText = @"(304) 598-4000";
		}
		else if([@"Ruby Memorial" isEqualToString:mainText]){
			subText = @"(304) 598-4400";
		}
		else if([@"Monongalia General" isEqualToString:mainText]){
			subText = @"(304) 598-1200";
		}
	}
	else if(3==indexPath.section){
		mainText =  [sec3 objectAtIndex:indexPath.row];
		if([@"Morgantown Fire Department" isEqualToString:mainText]){
			subText = @"(304) 284-7480";
		}
	}
	else if(4==indexPath.section){
		mainText =  [sec4 objectAtIndex:indexPath.row];
		if([@"Allegheny Energy" isEqualToString:mainText]){
			subText = @"(800) ALLEGHENY";
		}
		else if([@"Poison Control" isEqualToString:mainText]){
			subText = @"(800) 222-1222";
		}
		else if([@"Road Conditions" isEqualToString:mainText]){
			subText = @"(877) WVA-ROAD";
		}
		else if([@"Local AT&T Store" isEqualToString:mainText]){
			subText = @"(304) 598-6520";
		}
		else if([@"Nearest Apple Store" isEqualToString:mainText]){
			subText = @"(412) 833-1840";
		}
	}
	
	cell.textLabel.text = mainText;
	cell.detailTextLabel.text = [@"   " stringByAppendingString:subText];
	
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here. Create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
	// [self.navigationController pushViewController:anotherViewController];
	// [anotherViewController release];
	[tableView deselectRowAtIndexPath:indexPath animated:YES];
	NSString *phoneNum;
	if(indexPath.section == 0){
		phoneNum = @"911";
	}
	else{
		phoneNum = [tableView cellForRowAtIndexPath:indexPath].detailTextLabel.text;
	}
	
	//replace vanity phone numbers with number equivalent
	phoneNum = [phoneNum stringByReplacingOccurrencesOfString:@"COPS" withString:@"2677"];
	phoneNum = [phoneNum stringByReplacingOccurrencesOfString:@"WVA-ROAD" withString:@"982-7623"];
	phoneNum = [phoneNum stringByReplacingOccurrencesOfString:@"ALLEGHENY" withString:@"255-3443"];
	phoneNum = [phoneNum stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
	iWVUAppDelegate *AppDelegate = [UIApplication sharedApplication].delegate;
	
	[AppDelegate callPhoneNumber:phoneNum];
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
	return [secs objectAtIndex:section];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
	//these are the default's, but I'm going to explicitly define them, just to be safe
	if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone) {
		return (UIInterfaceOrientationPortrait == interfaceOrientation);
	}
	return YES;
}


#pragma mark Memory


- (void)dealloc {
	
	[secs release];
	[sec0 release];
	[sec1 release];
	[sec2 release];
	[sec3 release];
	[sec4 release];
	
    [super dealloc];
}




@end

