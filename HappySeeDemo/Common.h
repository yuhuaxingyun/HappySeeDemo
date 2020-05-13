//
//  Common.h
//  HappySeeDemo
//
//  Created by 宋江 on 2020/5/12.
//  Copyright © 2020 宋江. All rights reserved.
//

#ifndef Common_h
#define Common_h


//屏幕宽度
#define kScreenWidth [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

//字体不同屏幕显示不同的大小
#define IS_IPHONE_4 (fabs((double)kScreenHeight - (double )480) < DBL_EPSILON)
#define IS_IPHONE_5 (fabs((double)kScreenHeight - (double )568) < DBL_EPSILON)
#define IS_IPHONE_6 (fabs((double)kScreenHeight - (double )667) < DBL_EPSILON)
#define IS_IPHONE_PLUS (fabs((double)kScreenHeight - (double )640) < DBL_EPSILON)
#define IS_IPHONE_X (fabs((double)kScreenHeight - (double )812) < DBL_EPSILON) || (fabs((double)kScreenHeight - (double )896) < DBL_EPSILON)

//导航栏高度
#define kNavHeight 64
//状态栏高度
#define kStatusHeight (IS_IPHONE_X?44:20)
// 顶部安全区域高度
#define KSafeAreaTopHeight (IS_IPHONE_X?44:0.0f)
// 底部安全区域高度
#define kSafeAreaBottomHeight (IS_IPHONE_X?14:0.0f)
//自定义导航栏的高度
#define kCustomerNavBarHeight 64
// 内容视图的top
#define kMainContantTop (IS_IPHONE_X?(kCustomerNavBarHeight+kStatusHeight):kCustomerNavBarHeight)

// 弱引用
#define SPWeakSelf __weak typeof(self) weakSelf = self;

#endif /* Common_h */
