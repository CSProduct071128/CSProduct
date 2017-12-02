//
//  CSSearchView.m
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/2.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSSearchView.h"
@interface CSSearchView () <UISearchBarDelegate>
{
    UISearchBar *_searchBar;
}
@end

@implementation CSSearchView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    self.backgroundColor = [UIColor whiteColor];
    [self setViews];
    return self;
}

- (void)setViews{
    UIView *searchBarBG = [[UIView alloc] initWithFrame:CGRectZero];
    searchBarBG.backgroundColor = [UIColor whiteColor];
    searchBarBG.layer.cornerRadius = 4.f;
    searchBarBG.layer.borderColor = UIColorFromRGB(0xDDDDDD).CGColor;
    searchBarBG.layer.borderWidth = 1.f;
    [self addSubview:searchBarBG];
    
    [searchBarBG mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5.f);
        make.left.equalTo(self).offset(5.f);
        make.right.equalTo(self.mas_right).offset(-5.f);
        make.bottom.equalTo(self.mas_bottom).offset(-5.f);
    }];

    
    // Do any additional setup after loading the view.
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectZero];
    _searchBar.backgroundColor = [UIColor clearColor];
    _searchBar.showsCancelButton = NO;
    _searchBar.delegate = self;
    _searchBar.tintColor = UIColorFromRGB(0x999999);
    _searchBar.layer.cornerRadius = 4.f;
    _searchBar.clipsToBounds = YES;
    [_searchBar setSearchFieldBackgroundImage:[UIImage imageNamed:@""] forState:(UIControlStateNormal)];
    [self addSubview:_searchBar];
    
    [_searchBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.center.equalTo(self);
    }];

    for (UIView *subView in _searchBar.subviews) {
        if ([subView isKindOfClass:[UIView  class]]) {
            if (subView.subviews.count == 1) {
                //   删除默认边框
                [[subView.subviews objectAtIndex:0] removeFromSuperview];
            }else if (subView.subviews.count > 1){
                //   删除默认边框
                [[subView.subviews objectAtIndex:0] removeFromSuperview];
                if ([[subView.subviews objectAtIndex:0] isKindOfClass:[UITextField class]]) {
                    UITextField *textField = [subView.subviews objectAtIndex:0];
                    textField.backgroundColor = [UIColor clearColor];
                }
            }
        }
    }
    
    UIView *line = [[UIView alloc] init];
    line.backgroundColor =UIColorFromRGB(0xEEEEEE);
    [self addSubview:line];
    
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(self);
        make.height.equalTo(@(1.f));
        make.bottom.equalTo(self);
    }];

}

#pragma mark - delegate
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if (self.delegate && [self.delegate respondsToSelector:@selector(textChangeGetTheText:)]) {
        [self.delegate textChangeGetTheText:searchText];
    }
}


#pragma mark - add other property
/**
     注！需要增加其他属性也设置属性。
 */
-(void)setSearchPlaceholder:(NSString *)searchPlaceholder{
    if (searchPlaceholder) {
        _searchBar.placeholder = searchPlaceholder;
    }
}
@end
