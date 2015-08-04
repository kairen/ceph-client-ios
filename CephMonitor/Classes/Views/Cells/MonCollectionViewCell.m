//
//  TableCollectionViewCell.m
//  CephMonitor
//
//  Created by Wu~ on 2015/6/3.
//  Copyright (c) 2015年 Wu~. All rights reserved.
//

#import "MonCollectionViewCell.h"

#define SPACE 5
#define TITLE_HEIGHT 30
#define CELL_SPACE 2
#define CELL_HEIGHT 55
#define LEFT_WIDTH 7

@interface MonCollectionViewCell ()

@property (nonatomic, strong) NSMutableArray *keyObjects;
@property (nonatomic, strong) NSMutableArray *valueObjects;

@end

@implementation MonCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = YES;
        /**
         *  Title Background
         */
        self.titleBackground = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(frame), TITLE_HEIGHT)];
        self.titleBackground.backgroundColor = [UIColor customBlueColor];
        [self addSubview:self.titleBackground];
        /**
         *  Title Label
         */
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(SPACE, 0, CGRectGetWidth(self.titleBackground.frame) - (SPACE * 2), CGRectGetHeight(self.titleBackground.frame))];
        self.titleLabel.backgroundColor = [UIColor clearColor];
        self.titleLabel.font = [UIFont fontHelveticaNeueBoldSize:18];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self addSubview:self.titleLabel];
    }
    return self;
}

#pragma mark - Create Cell
- (void)createCellWithKeys:(NSDictionary *)keys datas:(NSArray *)datas {
    if (!self.keyObjects && !self.valueObjects) {
        self.keyObjects = [NSMutableArray array];
        self.valueObjects = [NSMutableArray array];
        
        CGFloat yOrigin = CGRectGetMaxY(self.titleLabel.frame) + CELL_SPACE;
        int index = 0;
        for (NSString *key in keys[@"Key"]) {
            UIView *leftView = [[UIView alloc] initWithFrame:CGRectMake(0, yOrigin, LEFT_WIDTH, CELL_HEIGHT - (CELL_SPACE * 2))];
            leftView.backgroundColor = [UIColor customGreenColor];
            [self addSubview:leftView];
            
            UILabel *keyLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(leftView.frame) + SPACE, CGRectGetMinY(leftView.frame), (CGRectGetWidth(self.frame) - CGRectGetMaxX(leftView.frame) - SPACE) * 0.4, CGRectGetHeight(leftView.frame))];
            keyLabel.textColor = [UIColor customBlueColor];
            keyLabel.text = key;
            keyLabel.adjustsFontSizeToFitWidth = YES;
            [self addSubview:keyLabel];
            [self.keyObjects addObject:keyLabel];
            
            UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(keyLabel.frame) + SPACE, CGRectGetMinY(keyLabel.frame), CGRectGetWidth(self.frame) - CGRectGetMaxX(keyLabel.frame) - (SPACE * 2), CGRectGetHeight(keyLabel.frame))];
            valueLabel.textColor = [UIColor blackColor];
            valueLabel.text = datas[index];
            valueLabel.numberOfLines = 0;
            valueLabel.adjustsFontSizeToFitWidth = YES;
            valueLabel.font = [UIFont fontHelveticaNeueLightSize:16];
            [self addSubview:valueLabel];
            [self.valueObjects addObject:valueLabel];
            
            UIView *separateLine = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetMinX(keyLabel.frame), CGRectGetMaxY(leftView.frame) + CELL_SPACE, CGRectGetWidth(self.frame) - CGRectGetMinX(keyLabel.frame), 1)];
            separateLine.backgroundColor = [UIColor customGrayColor];
            [self addSubview:separateLine];
            
            index ++;
            yOrigin += CELL_HEIGHT;
        }
    }
    else {
        for (int i = 0; i < self.keyObjects.count; i++) {
            ((UILabel *)self.keyObjects[i]).text = keys[@"Key"][i];
            ((UILabel *)self.valueObjects[i]).text = datas[i];
        }
    }
}

@end
