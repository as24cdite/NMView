//
//  LoadFromNIBView.m
//  NMView
//
//  Created by Benjamin Broll on 24.03.11.
//  Copyright 2011 NEXT Munich GmbH. The App Agency. All rights reserved.
//

/*
 * The BSD License
 * http://www.opensource.org/licenses/bsd-license.php
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, this
 *   list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice,
 *   this list of conditions and the following disclaimer in the documentation
 *   and/or other materials provided with the distribution.
 * - Neither the name of NEXT Munich GmbH nor the names of its contributors may
 *   be used to endorse or promote products derived from this software without
 *   specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
 * INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN
 * CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 * ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE
 * POSSIBILITY OF SUCH DAMAGE.
 */

#import "LoadFromNIBView.h"
#import "LoadFromNIBView+IB.h"

#define TEXT_TAG 1


@implementation LoadFromNIBView

#pragma mark Properties

- (void)setText:(NSString *)text {
	// We can access subviews by tag using -viewWithTag:.
	UILabel *lbl = (UILabel *)[self viewWithTag:TEXT_TAG];
	lbl.text = text;
	
	// We can also access elements of the nib using IBOutlets.
	if ([self.activityIndicator isAnimating]) {
		[self.activityIndicator stopAnimating];
	} else {
		[self.activityIndicator startAnimating];
	}
}

- (NSString *)text {
	UILabel *lbl = (UILabel *)[self viewWithTag:TEXT_TAG];
	return lbl.text;
}

// @synthesize does not seem to work if ivar and property are not defined in the
// same header. We need to implement the accessors ourselves.
- (void)setActivityIndicator:(UIActivityIndicatorView *)v {
	if (activityIndicator != v) {
		[activityIndicator release];
		activityIndicator = [v retain];
	}
}

- (UIActivityIndicatorView *)activityIndicator {
	return activityIndicator;
}


#pragma mark Dealloc

- (void)dealloc {
	[self.activityIndicator release];
	
	[super dealloc];
}

@end
