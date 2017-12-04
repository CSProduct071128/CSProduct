//
//  CSOrganizationModel.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#import <JSONModel/JSONModel.h>


@protocol CSOrganizationUserListModel
@end
@interface CSOrganizationUserListModel : JSONModel
@property (nonatomic,copy) NSString *role;//职位
@property (nonatomic,copy) NSString *name;//名子
@property (nonatomic,copy) NSString *userId;//

@end

@protocol CSOrganizationListModel
@end
@interface CSOrganizationListModel : JSONModel
@property (nonatomic,copy) NSString *depOneId;//本级部门id
@property (nonatomic,copy) NSString *depOneName;//本级部门
@property (nonatomic,copy) NSString *type;//

@end


@interface CSOrganizationModel : JSONModel

@property (nonatomic,copy) NSString *depRootId;//上级部门id
@property (nonatomic,copy) NSString *depRootName;//上级部门
@property (nonatomic,copy) NSString *type;//
@property (nonatomic,strong) NSArray <CSOrganizationUserListModel> *userList;//用户list
@property (nonatomic,strong) NSArray <CSOrganizationListModel > *depOneList;//组织list

@end
