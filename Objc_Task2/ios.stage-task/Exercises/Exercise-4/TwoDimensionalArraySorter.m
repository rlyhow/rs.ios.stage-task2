#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    // Если массив пустой
    if (array.count == 0) {
        return @[];
    }
    
    NSMutableArray *resultArrayOfNumbers = [NSMutableArray new]; // сюда будет записан результат для чисел
    NSMutableArray *resultArrayOfStrings = [NSMutableArray new]; // сюда будет записан результат для cтрок
    
    NSSortDescriptor *sdIncrease = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES]; // сортировка по возрастанию
    NSSortDescriptor *sdDecrease = [NSSortDescriptor sortDescriptorWithKey:nil ascending:NO]; // сортировка по убыванию
    
    NSEnumerator *enumerator = [array objectEnumerator];
    NSArray *number;
    
    while (number = [enumerator nextObject]) {
        // проверка на двойной массив
        if (![number isKindOfClass:[NSArray class]]) {
            return @[];
        }
        
        for (int i = 0; i < number.count; i++) {
            if ([number[i] isKindOfClass:[NSNumber class]]){
                [resultArrayOfNumbers addObject:number[i]];
            } else {
                [resultArrayOfStrings addObject:number[i]];
            }
        }
    }
    
    NSMutableArray *resultEnd = [[NSMutableArray alloc] init];
    NSArray *resultNumberEnd;
    NSArray *resultStringEnd;
    
    if (resultArrayOfNumbers.count != 0 && resultArrayOfStrings.count == 0) {
        resultNumberEnd = [resultArrayOfNumbers sortedArrayUsingDescriptors:@[sdIncrease]];
        return resultNumberEnd;
    } else if (resultArrayOfNumbers.count == 0 && resultArrayOfStrings.count != 0) {
        resultStringEnd = [resultArrayOfStrings sortedArrayUsingDescriptors:@[sdIncrease]];
        return resultStringEnd;
    } else {
        resultNumberEnd = [resultArrayOfNumbers sortedArrayUsingDescriptors:@[sdIncrease]];
        resultStringEnd = [resultArrayOfStrings sortedArrayUsingDescriptors:@[sdDecrease]];
        [resultEnd addObject:resultNumberEnd];
        [resultEnd addObject:resultStringEnd];
    }
    
    return resultEnd;
}

@end
