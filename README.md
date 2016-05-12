# Dynamic-Table-Height

This POC is related to set table cell height according to downloaded image.

We need to provide table cell height before creatinf cell. If downloaded image sizes are different then we need to update table row heights.

So first we are setting default table height. 
After downloading a image we are updating table view with following lines:
    
    [self.tblStoryCardView beginUpdates];
    [self.tblStoryCardView endUpdates];
