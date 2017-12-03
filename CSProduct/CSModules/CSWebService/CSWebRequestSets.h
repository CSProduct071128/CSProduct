//
//  CSWebRequestSets.h
//  CSProduct
//
//  Created by zhiwei jiang on 2017/12/3.
//  Copyright © 2017年 zhiwei jiang. All rights reserved.
//

#ifndef CSWebRequestSets_h
#define CSWebRequestSets_h

// 所有接口配置url
#define kURL_Login @"rest/user/login" //登录
#define kURL_UserInfo_save @"rest/user/saveUser" //保存人员信息接口
#define kURL_UserInfo_get @"rest/user/getUserInfo" //获取某个用户基本信息
#define kURL_UserList_get @"rest/user/getUserList" //获取用户列表
#define kURL_User_operationBlacklist @"rest/user/addUser2BlackList" //用户加入/解绑 黑名单
#define kURL_User_getBlackList @"rest/user/getBlackList" //获取黑名单列表
#define kURL_User_signin @"rest/user/userAttendance" // 打卡
#define kURL_User_getAttendanceList @"rest/user/getAttendanceList" //获取考勤日历
#define kURL_saveDep @"rest/emp/saveDep" //保存组织结构
#define kURL_getEmpList @"rest/emp/getEmpList" //获取组织结构
#define kURL_saveNotice @"rest/notice/saveNotice" //保存公告
#define kURL_getNoticeList @"rest/notice/getNoticeList" //获取公告列表
#define kURL_getNoticeDetail @"rest/notice/getNoticeDetail" //获取公告详情

#endif /* CSWebRequestSets_h */
