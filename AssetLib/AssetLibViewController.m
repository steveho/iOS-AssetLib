//
//  AssetLibViewController.m
//  AssetLib
//
//  Created by Steve Ho on 6/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "AssetLibViewController.h"

@implementation AssetLibViewController

@synthesize tableView;
@synthesize activity;

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    [activity startAnimating];

    
    void (^assetEnumerator)(ALAsset *, NSUInteger, BOOL *) = ^(ALAsset *result, NSUInteger index, BOOL *stop)
    {
        if(result != nil)
        {
            [assets addObject:result];
        }
    };    
    
    void (^assetGroupEnumerator)(ALAssetsGroup *, BOOL *) = ^(ALAssetsGroup *group, BOOL *stop){
        if(group != nil)
        {
            [group enumerateAssetsUsingBlock:assetEnumerator];
            
        }  
        [self.tableView reloadData];
        [self.activity stopAnimating];
        [self.activity setHidden:YES];
            
    };
    
    
    assets = [[NSMutableArray alloc] init];
    ALAssetsLibrary *library = [[ALAssetsLibrary alloc] init];
    [library enumerateGroupsWithTypes:ALAssetsGroupAll usingBlock:assetGroupEnumerator failureBlock: ^(NSError *error) { NSLog(@"Failure");}];
}

#pragma mark UITableViewDataSource Methods


// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [assets count];
}


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    
	ALAsset *asset = [assets objectAtIndex:indexPath.row];
	[cell.imageView setImage:[UIImage imageWithCGImage:[asset thumbnail]]];
	[cell.textLabel setText:[NSString stringWithFormat:@"Photo %d", indexPath.row+1]];


    return cell;
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
