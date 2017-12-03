//
//  CSParentmentListTableCell.h
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CSParentmentListTableCell;

@protocol CSParentmentListTableCellDelegate <NSObject>

-(void)csParentmentSelectCellValueChanged:(CSParentmentListTableCell *)cell indexPath:(NSIndexPath *)indexPath value:(BOOL)value;

@end

@interface CSParentmentListTableCell : UITableViewCell

@property(nonatomic, strong)UILabel *cellTitleLabel;
@property(nonatomic, assign)BOOL cellValue;
@property(nonatomic, strong)UIButton *cellImageBtn;
@property(nonatomic, strong)NSIndexPath *indexPath;

@property (nonatomic,weak) id<CSParentmentListTableCellDelegate> delegate ;

+(CGFloat)cellEstimatedHeight;
+(NSString *)cellIdentifier;
@end
