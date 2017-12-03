//
//  CSPushAnnounceViewController.m
//  CSProduct
//
//  Created by LiGuoTing on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import "CSPushAnnounceViewController.h"
#import "CSParentmentListController.h"

@interface CSPushAnnounceViewController ()<UITextFieldDelegate,UITextViewDelegate>

@property (nonatomic,strong) UIButton *chooseType;
@property (nonatomic, strong) UITextField *titleTextField;;
@property (nonatomic,strong) UITextView *contentTextView;
@property (nonatomic,strong) UIButton *pushAnnounceArea;
@end

@implementation CSPushAnnounceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"发布公告";
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
    // Do any additional setup after loading the view.
}

-(void)initView{
    
    self.titleTextField = [[UITextField alloc] init];
    self.titleTextField.font = [UIFont systemFontOfSize:16];
    self.titleTextField.textColor = UIColorFromRGB(0x444444);
    self.titleTextField.placeholder = @"公告标题";
    [self.titleTextField setValue:UIColorFromRGB(0xDDDDDD) forKeyPath:@"_placeholderLabel.textColor"];
    self.titleTextField.delegate = self;
    [self.view addSubview:self.titleTextField];
    [self.titleTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).with.offset(20+64);
        make.left.equalTo(self.view).offset(18);
        make.right.equalTo(self.view).offset(-18);
        make.height.equalTo(@16);
    }];
    
    self.chooseType = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:self.chooseType];
    self.chooseType.titleLabel.textColor = UIColorFromRGB(0x444444);
    self.chooseType.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [self.chooseType addTarget:self action:@selector(chooseTypeDown) forControlEvents:UIControlEventTouchUpInside];
    self.chooseType.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.chooseType setTitle:@"公告类型:" forState:UIControlStateNormal];
    [self.chooseType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleTextField.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).offset(18);
        make.height.equalTo(@30);
    }];
    
    
    
    
    self.contentTextView = [[UITextView alloc] init];
    self.contentTextView.delegate = self;
    self.contentTextView.font = [UIFont systemFontOfSize:14.f];
    self.contentTextView.layer.cornerRadius = 4.0;
    self.contentTextView.layer.masksToBounds = YES;
    self.contentTextView.layer.borderColor = UIColorFromRGB(0xeeeeee).CGColor;
    self.contentTextView.layer.borderWidth = 0.5;
    self.contentTextView.backgroundColor = UIColorFromRGB(0xf9f9f9);
    self.contentTextView.textColor = UIColorFromRGB(0x444444);
    [self.view addSubview:self.contentTextView];
    [self.contentTextView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.chooseType.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).offset(18);
        make.right.equalTo(self.view).offset(-18);
        make.height.equalTo(@100);
    }];
    
    
    self.pushAnnounceArea = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.view addSubview:self.pushAnnounceArea];
    self.pushAnnounceArea.titleLabel.textColor = UIColorFromRGB(0x444444);
    self.pushAnnounceArea.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [self.pushAnnounceArea addTarget:self action:@selector(chooseTypeAreaDown) forControlEvents:UIControlEventTouchUpInside];
    [self.pushAnnounceArea setTitle:@"公告发布范围:" forState:UIControlStateNormal];
    self.pushAnnounceArea.titleLabel.textAlignment = NSTextAlignmentLeft;
    [self.pushAnnounceArea mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentTextView.mas_bottom).with.offset(20);
        make.left.equalTo(self.view).offset(18);
        make.right.equalTo(self.view).offset(-18);
    }];
    
}


-(void)chooseTypeDown{
    
    UIAlertController *alertControl = [UIAlertController alertControllerWithTitle:@"公告类型" message:@"请选择想发布的公告类型" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *normalAction = [UIAlertAction actionWithTitle:@"普通公告" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //普通按钮
        NSLog(@"我是普通按钮");
    }];
    UIAlertAction *allAction = [UIAlertAction actionWithTitle:@"全体公告" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
        //红色按键
        NSLog(@"我是红色按键");
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"cancel" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        //取消按钮
        NSLog(@"我是取消按钮");
    }];
    //添加按钮（按钮的排列与添加顺序一样，唯独取消按钮会一直在最下面）
    [alertControl addAction:allAction];//ok
    [alertControl addAction:normalAction];//aaa
    [alertControl addAction:cancelAction];//cancel
    //显示警报框
    [self presentViewController:alertControl animated:YES completion:nil];
}

-(void)chooseTypeAreaDown{
    CSParentmentListController * vc = [CSParentmentListController new];
    [self.navigationController pushViewController:vc animated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



//根据textfield的tag值来判断是点击的是哪个textfield
- (void)textFieldDidEndEditing:(UITextField *)textField{
    
}
-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return YES;
}
-(void)textViewDidEndEditing:(UITextView *)textView{
    
}
-(BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    return YES;
}
@end
