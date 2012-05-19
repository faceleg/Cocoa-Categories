# Cocoa Categories
A collection of Cocoa categories I've found useful.

## NSString+Size
Adds `- (NSSize) sizeWithWidth:(float)width andFont:(NSFont *)font;` method to NSStrings. Returns the width and height of a box that would contain the rendered string with the given width & font.

## NSColor+Hex
Adds the following:

```ObjectiveC
+ (NSColor *) colorWithHex:(NSString *)hexColor;

- (NSString *) hexColor;
```

The class method `+ (NSColor *) colorWithHex:(NSString *)hexColor` attempts to initialise a new NSColor object from the given hexadecimal string. It will accept a three or six character string (# is optional). Anything else and it will raise an exception.

The instance method `- (NSString *) hexColor;` returns a hexadecimal string representation of the given NSColor. If the colour's `colorSpaceName` is not one of: `NSCalibratedWhiteColorSpace`, `NSCalibratedBlackColorSpace`, `NSCalibratedRGBColorSpace` or `NSDeviceRGBColorSpace`, the method will return `@"transparent"`.

## NSPopover+Message
Adds the class method:

```ObjectiveC
+ (void) showRelativeToRect:(NSRect)rect
                     ofView:(NSView *)view
              preferredEdge:(NSRectEdge)edge
                     string:(NSString *)string
                   maxWidth:(float)width;
```

Intended to allow one to show a NSPopover containing a message with the minimum of fuss.

Example:

```ObjectiveC
[NSPopover showRelativeToRect:[view bounds]
                       ofView:view
                preferredEdge:NSMaxXEdge
                       string:@"Your message - the NSPopover will be as tall as required depending on your given maxWidth"
                     maxWidth:200.0];
```

## NSSplitView+Animation

Adds `- (void) animateView:(int)viewIndex toDimension:(CGFloat)dimension` method to NSSplitViews. Animates the split view panels such that the view at `viewIndex` has the pixel width or height of `dimension`. Note that animating a panel to zero width or height will cause it to 'disappear', and such a panel will not animate again. Animating a panel to no less than 1 pixel wide or high is sufficient to make the panel appear hidden.
