#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    NSMutableString *ipaddress = [[NSMutableString alloc] init];
    
    if (numbersArray.count == 0) {
        return @"";
    }
    
    int count = 0;
    
    while (count < 4) {
        
        if (count > 0 && count < 4) {
            [ipaddress appendString:@"."];
        }
        
        if (count < numbersArray.count) {
            if ([numbersArray[count] intValue] < 0) {
                return @"Negative numbers are not valid for input.";
            }
            if ([numbersArray[count] intValue] > 255) {
                return @"The numbers in the input array can be in the range from 0 to 255.";
            }
            [ipaddress appendString:[numbersArray[count] stringValue]];
        } else {
            [ipaddress appendString:@"0"];
        }
        
        count++;
    }
    
    return ipaddress;
}

@end
