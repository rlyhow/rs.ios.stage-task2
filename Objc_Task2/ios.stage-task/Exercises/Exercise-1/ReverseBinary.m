#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 result = 0;
    UInt8 left = 128;
    UInt8 right = 128;
    
    for (int i = 7; i >= 0; i--) {
        if (((n << i) & right) == right) {
            result |= left;
        }
        left >>= 1;
    }
    return result;
}
