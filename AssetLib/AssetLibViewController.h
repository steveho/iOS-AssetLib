//
//  AssetLibViewController.h
//  AssetLib
//
//  Created by Steve Ho on 6/23/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>

@interface AssetLibViewController : UIViewController <UITableViewDelegate, UITableViewDataSource> {
   IBOutlet UITableView *tableView;       
   IBOutlet UIActivityIndicatorView *activity;
   NSMutableArray *assets; 
}

@property (nonatomic, retain) IBOutlet UITableView *tableView;
@property (nonatomic, retain) IBOutlet UIActivityIndicatorView *activity;

@end


/*
 16 pictures (4 x 4 grid - centered)
 
 iPhone: 480 x 320
 Pictures 75  x 75, 150px for big pict
 4px margin all around
 
 iPad: 1024 x 768
 pictures 175 x 175, 240px for big pict
 12px margin 
 */