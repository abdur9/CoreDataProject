//
//  GlobalHeader.h
//  simpleExample
//
//  Created by Abdur Rahim on 07/04/15.
//  Copyright (c) 2015 Abdur Rahim. All rights reserved.
//

#ifndef simpleExample_GlobalHeader_h
#define simpleExample_GlobalHeader_h

#if DEBUG == 0
#define DebugLog(...)
#elif DEBUG == 1
#define DebugLog(...) NSLog(__VA_ARGS__)
#endif

#endif
