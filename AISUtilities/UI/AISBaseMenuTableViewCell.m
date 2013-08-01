//
//  AISBaseMenuTableViewCell.m
//  AISUtilities
//
//  Created by Gregory Hill on 7/25/13.
//  Copyright (c) 2013 Applied IS. All rights reserved.
//

#import "AISBaseMenuTableViewCell.h"

@implementation AISBaseMenuTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
