#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    int countOfPairs = 0;
    int p = 1;
    
    NSSortDescriptor *sd = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    array = [array sortedArrayUsingDescriptors:@[sd]];
    
    for (int i = 0; i < array.count; i++) {
        for (int k = p; k < array.count; k++) {
            if (([array[k] intValue] - [array[i] intValue]) == [number intValue]) {
                countOfPairs++;
            }
        }
        p++;
    }
    return countOfPairs;
}

@end
