//
//  LoadMoreCell.m
//  TogglDesktop
//
//  Created by Indrek Vändrik on 19/02/16.
//  Copyright © 2016 Alari. All rights reserved.
//

#import "LoadMoreCell.h"

@implementation LoadMoreCell
extern void *ctx;

- (void)initCell
{
	[self setupLoadMoreText];
	[self.loader stopAnimation:nil];
	[self.loader setHidden:YES];
}

- (void)setupLoadMoreText
{
	NSMutableParagraphStyle *paragrapStyle = NSMutableParagraphStyle.new;

	paragrapStyle.alignment                = kCTTextAlignmentCenter;

	NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:@"Load More"];
	[string setAttributes:
	 @{
		 NSFontAttributeName : [NSFont systemFontOfSize:13],
		 NSForegroundColorAttributeName:[ConvertHexColor hexCodeToNSColor:@"#000000"],
		 NSParagraphStyleAttributeName:paragrapStyle
	 }
					range:NSMakeRange(0, [string length])];
	self.loadButton.attributedTitle = string;
}

- (IBAction)loadMoreClicked:(id)sender
{
	[self.loadButton setTitle:@""];
	[self.loader startAnimation:sender];
	[self.loader setHidden:NO];
	toggl_load_more(ctx);
}

@end
