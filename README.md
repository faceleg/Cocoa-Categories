# Cocoa Categories
A collection of Cocoa categories I've found useful.

## NSString+Size
Adds `- (NSSize) sizeWithWidth:(float)width andFont:(NSFont *)font;` method to NSStrings. Returns the width and height of a box that would contain the rendered string with the given width & font.

## NSColor+Hex
Adds the following:

```Objective C
+ (NSColor *) colorWithHex:(NSString *)hexColor;

- (NSString *) hexColor;
```

The class method `+ (NSColor *) colorWithHex:(NSString *)hexColor` attempts to initialise a new NSColor object from the given hexadecimal string. It will accept a three or six character string (# is optional). Anything else and it will raise an exception.

The instance method `- (NSString *) hexColor;` returns a hexadecimal string representation of the given NSColor. If the colour's `colorSpaceName` is not one of: `NSCalibratedWhiteColorSpace`, `NSCalibratedBlackColorSpace`, `NSCalibratedRGBColorSpace` or `NSDeviceRGBColorSpace`, the method will return `@"transparent"`.
