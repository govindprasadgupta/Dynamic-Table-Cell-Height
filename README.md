# Dynamic-Table-Height

This POC is related to set table cell height according to downloaded image.
If user taps on a cell then application is navigated to description screen where we are setting image and text height dynamucaly.

We need to provide table cell height before creatinf cell. If downloaded image sizes are different then we need to update table row heights.

So first we are setting default table height. 
After downloading a image we are updating table view with following lines:
    
    [self.tblStoryCardView beginUpdates];
    [self.tblStoryCardView endUpdates];
    
    
We are using SDWebCAche image for downloading images.


To get a text height we are using following method:
- (CGSize)getExactSizeForTextSize:(CGSize)size
                          andFont:(UIFont *)font {
    
    CGRect labelRect = [self boundingRectWithSize:size
                                          options:NSStringDrawingUsesLineFragmentOrigin
                                       attributes:@{NSFontAttributeName : font}
                                          context:nil];
    
    return labelRect.size;
}

