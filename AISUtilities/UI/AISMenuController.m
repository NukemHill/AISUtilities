//
//  AISMenuController.m
//  Pandora
//
//  Created by Gregory Hill on 3/12/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import "AISMenuController.h"

@interface AISMenuController ()

@end

@implementation AISMenuController

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}


- (MenuSections) menuSectionFromString:(NSString *)menuSection {
	MenuSections section = UnknownSection;

	if([menuSection isEqualToString:@"ViewsSection"]) {
		section = ViewsSection;
	} else if([menuSection isEqualToString:@"SettingsSection"]) {
		section = SettingsSection;
	}

	return section;
}

@end
