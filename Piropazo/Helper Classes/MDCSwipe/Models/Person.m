//
// Person.m
//
// Copyright (c) 2014 to present, Brian Gesiak @modocache
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

#import "Person.h"

@implementation Person

#pragma mark - Object Lifecycle

- (instancetype)initWithLike:(NSString *)likeType image:(UIImage *)image age:(NSUInteger)age SharedFriends:(NSString *)shareType personType:(NSString *)personType numberOfPhotos:(NSUInteger)numberOfPhotos AddPerson:(NSString *)addPerson
{
    self = [super init];
    if (self) {
       // NSLog(@"personType %@",likeType);
//         NSLog(@"_shareType2 %@",shareType);
        _likeType = likeType;
        _image = image;
        _age = age;
        _shareType = shareType;
        _personType = personType;
        _numberOfPhotos = numberOfPhotos;
        _personAdd=addPerson;
    }
    return self;
}

@end
