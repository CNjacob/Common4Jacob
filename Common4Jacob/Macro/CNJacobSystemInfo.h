//
//  CNJacobSystemInfo.h
//  Common4Jacob
//
//  Created by jacob on 2018/11/13.
//  Copyright © 2018 CNjacob. All rights reserved.
//

#ifndef CNJacobSystemInfo_h
#define CNJacobSystemInfo_h

#define CNJACOB_APPNAME [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];

#define CNJACOB_APP_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleShortVersionString"];

#define CNJACOB_APP_BUILD_VERSION [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleVersion"];

#define CNJACOB_APP_BUNDLE_ID [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];

#endif /* CNJacobSystemInfo_h */
