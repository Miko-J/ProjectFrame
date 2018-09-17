//
//  NJF_PlistConfigProtocol.h
//  NJF_Project
//
//  Created by jinfeng niu on 2018/9/17.
//  Copyright © 2018年 jinfeng niu. All rights reserved.
//

#ifndef NJF_PlistConfigProtocol_h
#define NJF_PlistConfigProtocol_h

@protocol ConfigAPI <NSObject>
@property (nonatomic, strong, readonly) NSArray <NSDictionary *> *itemArr;
@end

#endif /* NJF_PlistConfigProtocol_h */
