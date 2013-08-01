//
//  AISMenuController.h
//  Pandora
//
//  Created by Gregory Hill on 3/12/13.
//  Copyright (c) 2013 Gregory Hill. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
	SettingsSection,
	ViewsSection,
	UnknownSection
} MenuSections;


@interface AISMenuController : UITableViewController

- (MenuSections) menuSectionFromString:(NSString *)menuSection;

@end
