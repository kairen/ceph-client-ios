//
//  OSDTableViewCell.m
//  CephMonitor
//
//  Created by KaiRen.Bai on 2015/6/3.
//  Copyright (c) 2015年 KaiRen.Bai. All rights reserved.
//

#import "OSDTableViewCell.h"


@interface OSDTableViewCell ()

@property (nonatomic) CGFloat height;
@property (nonatomic, strong) NSMutableArray *titleLabels;
@property (nonatomic, strong) NSMutableArray *valueLabels;

@property (nonatomic, strong) UILabel *upStateLabel;
@property (nonatomic, strong) UILabel *inStateLabel;

@end

@implementation OSDTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier height:(CGFloat)height {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        self.height = height;
        self.backgroundColor = [UIColor clearColor];
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.contentBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(10, 0, CGRectGetWidth([UIScreen mainScreen].bounds) - 20, height - 20)];
        self.contentBackgroundView.backgroundColor = [UIColor whiteColor];
        self.contentBackgroundView.layer.cornerRadius = 5;
        self.contentBackgroundView.layer.borderColor = [UIColor customGreenColor].CGColor;
        self.contentBackgroundView.layer.borderWidth = 1.5;
        self.contentBackgroundView.clipsToBounds = YES;
        [self addSubview:self.contentBackgroundView];
        
        self.titleBackgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.contentBackgroundView.width, 60)];
        self.titleBackgroundView.backgroundColor = [UIColor customGreenColor];
        [self.contentBackgroundView addSubview:self.titleBackgroundView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 0, self.titleBackgroundView.width - 20, self.titleBackgroundView.height)];
        self.titleLabel.font = [UIFont fontHelveticaNeueLightSize:20];
        self.titleLabel.textColor = [UIColor whiteColor];
        [self.titleBackgroundView addSubview:self.titleLabel];
    }
    return self;
}

- (void)setKeyTitles:(NSArray *)keyTitles values:(NSArray *)values {
    NSAssert(keyTitles.count == values.count, @"Key and Value is not equal..");
    
    if(!self.titleLabels && !self.valueLabels) {
        self.titleLabels = [NSMutableArray array];
        self.valueLabels = [NSMutableArray array];
        
        CGFloat positionY = self.titleBackgroundView.maxY;
        CGFloat averageHeigth = self.contentBackgroundView.height - self.titleBackgroundView.height / keyTitles.count;
        
        for(int i = 0 ; i < keyTitles.count ; i++) {
            UILabel *keyLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, positionY, self.contentBackgroundView.width * 0.25, averageHeigth)];
            [self.contentBackgroundView addSubview:keyLabel];
            [self.titleLabels addObject:keyLabel];
            
            UILabel *valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(keyLabel.maxX, positionY, self.contentBackgroundView.width * 0.75, averageHeigth)];
            valueLabel.font = [UIFont fontHelveticaNeueLightSize:14];
            [self.contentBackgroundView addSubview:valueLabel];
            [self.valueLabels addObject:valueLabel];
            positionY += averageHeigth;
        }
    }
    for(int i = 0 ; i < keyTitles.count ; i++) {
        if([keyTitles[i] isEqualToString:@"狀態"]) {
            ((UILabel *)self.titleLabels[i]).text = keyTitles[i];
            [self createStateWithValue:values[i] withLabel:self.valueLabels[i]];
        } else {
            ((UILabel *)self.titleLabels[i]).text = keyTitles[i];
            ((UILabel *)self.valueLabels[i]).text = values[i];
        }
    }
}

- (void) createStateWithValue:(NSString *)value withLabel:(UILabel *)label{
    NSArray *states = [value componentsSeparatedByString:@","];
    if(!self.upStateLabel && !self.inStateLabel) {
        self.upStateLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, label.height * 0.2, label.width * 0.2, label.height * 0.6)];
        self.upStateLabel.text = states[0];
        [label addSubview:self.upStateLabel];
        
        self.inStateLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.upStateLabel.maxX + 10, label.height * 0.2, label.width * 0.2, label.height * 0.6)];
        self.inStateLabel.text = states[1];
        [label addSubview:self.inStateLabel];
        
        self.upStateLabel.textAlignment = self.inStateLabel.textAlignment = NSTextAlignmentCenter;
        self.upStateLabel.font = self.inStateLabel.font = [UIFont fontHelveticaNeueLightSize:14];
        self.upStateLabel.layer.cornerRadius = self.inStateLabel.layer.cornerRadius = 2.5;
        self.upStateLabel.layer.masksToBounds = self.inStateLabel.layer.masksToBounds = YES;
        self.upStateLabel.textColor = self.inStateLabel.textColor = [UIColor whiteColor];
    }
    self.upStateLabel.backgroundColor = ([states[0] isEqualToString:@"up"]) ? [UIColor customGreenColor]:[UIColor customRedColor];
    self.inStateLabel.backgroundColor = ([states[1] isEqualToString:@"in"]) ? [UIColor customGreenColor]:[UIColor customRedColor];
    [self changeContentBackgroudWithUp:states[0] andIn:states[1]];
}

- (void)changeContentBackgroudWithUp:(NSString *)stateUp andIn:(NSString *)stateIn {
    self.titleBackgroundView.backgroundColor = ([stateUp isEqualToString:@"up"] && [stateIn isEqualToString:@"in"]) ? [UIColor customGreenColor]:[UIColor customRedColor];
    self.contentBackgroundView.layer.borderColor = self.titleBackgroundView.backgroundColor.CGColor;
}

@end
