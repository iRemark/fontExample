//
//  TableViewCell.m
//  fontExample
//
//  Created by lc-macbook pro on 2017/6/8.
//  Copyright © 2017年 mac. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (UILabel *)contentLabel {
    if (_contentLabel == nil) {
        _contentLabel = [[UILabel alloc]initWithFrame:
                         CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width-200, 100)];
        _contentLabel.textAlignment = NSTextAlignmentCenter;
        _contentLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_contentLabel];
    }
    return _contentLabel;
}

- (UILabel *)miniLabel {
    if (_miniLabel == nil) {
        _miniLabel = [[UILabel alloc]initWithFrame:
                         CGRectMake([UIScreen mainScreen].bounds.size.width-200,0, 200, 100)];
        _miniLabel.textAlignment = NSTextAlignmentCenter;
        _miniLabel.textColor = [UIColor whiteColor];
        
        [self.contentView addSubview:_miniLabel];
    }
    return _miniLabel;
}
@end
