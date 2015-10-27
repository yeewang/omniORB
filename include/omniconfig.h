/* -*- Mode: C++; -*-
 *                            Package   : omniORB
 * omniconfig.h               Created on: 2002/02/15
 *                            Author    : Duncan Grisby (dpg1)
 *
 *    Copyright (C) 2002 AT&T Laboratories Cambridge
 *
 *    This file is part of the omniORB library
 *
 *    The omniORB library is free software; you can redistribute it and/or
 *    modify it under the terms of the GNU Library General Public
 *    License as published by the Free Software Foundation; either
 *    version 2 of the License, or (at your option) any later version.
 *
 *    This library is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 *    Library General Public License for more details.
 *
 *    You should have received a copy of the GNU Library General Public
 *    License along with this library; if not, write to the Free
 *    Software Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  
 *    02111-1307, USA
 *
 *
 * Description:
 *	*** PROPRIETARY INTERFACE ***
 *
 *      Fake omniconfig.h used when not using autoconf
 */

#ifndef __omniconfig_h__
#define __omniconfig_h__

#define OMNI_CONFIG_TRADITIONAL

/* Uncomment this to enable lock tracing. See omniORB4/tracedthread.h.*/

/*#define OMNIORB_ENABLE_LOCK_TRACES*/


#if defined(__ANDROID__)

#define NS_EXPORT

extern "C" {
/*
 * To work around http://code.google.com/p/android/issues/detail?id=23203
 * we don't link with the crt objects. In some configurations, this means
 * a lack of the __dso_handle symbol because it is defined there, and
 * depending on the android platform and ndk versions used, it may or may
 * not be defined in libc.so. In the latter case, we fail to link. Defining
 * it here as weak makes us provide the symbol when it's not provided by
 * the crt objects, making the change transparent for future NDKs that
 * would fix the original problem. On older NDKs, it is not a problem
 * either because the way __dso_handle was used was already broken (and
 * the custom linker works around it).
 */
  NS_EXPORT __attribute__((weak)) void *__dso_handle;
}
#endif

#endif
