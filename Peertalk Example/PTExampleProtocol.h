#ifndef peertalk_PTExampleProtocol_h
#define peertalk_PTExampleProtocol_h

#import <Foundation/Foundation.h>
#include <stdint.h>

static const int PTExampleProtocolIPv4PortNumber = 2345;

enum {
  PTExampleFrameTypeDeviceInfo = 100,
  PTExampleFrameTypeTextMessage = 101,
  PTExampleFrameTypePing = 102,
  PTExampleFrameTypePong = 103,
};

typedef struct _PTExampleTextFrame {
  uint32_t length;
  uint8_t utf8text[0];
  uint32_t imageLength;
  uint8_t MByte[0];
} PTExampleTextFrame;


static dispatch_data_t PTExampleTextDispatchDataWithString(NSString *message,NSData * image) {
  // Use a custom struct
  const char *utf8text = [message cStringUsingEncoding:NSUTF8StringEncoding];
  size_t length = strlen(utf8text);
    
    
  NSString *imageString = [image base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
  const char *MByte = [imageString cStringUsingEncoding:NSUTF8StringEncoding];
  size_t imageLength = strlen(MByte);
    
  NSInteger size1 = sizeof(PTExampleTextFrame);
  NSLog(@"%ldd",size1);
    
  PTExampleTextFrame *textFrame = CFAllocatorAllocate(nil, sizeof(PTExampleTextFrame) +imageLength+length, 0);
    
 
//  PTExampleTextFrame *textFrame = CFAllocatorAllocate(nil, sizeof(PTExampleTextFrame) + length, 0);
  memcpy(textFrame->utf8text, utf8text, length); // Copy bytes to utf8text array
  textFrame->length = htonl(length); // Convert integer to network byte order
    
  memcpy(textFrame->MByte, MByte, imageLength);
  textFrame->imageLength = htonl(imageLength);
    
    
    NSInteger size2 = sizeof(PTExampleTextFrame);
    NSLog(@"%ldd",size2);
  // Wrap the textFrame in a dispatch data object
  return dispatch_data_create((const void*)textFrame, sizeof(PTExampleTextFrame)+imageLength+100+length, nil, ^{
//    return dispatch_data_create((const void*)textFrame, sizeof(PTExampleTextFrame)+length, nil, ^{
    CFAllocatorDeallocate(nil, textFrame);
  });
}

#endif
