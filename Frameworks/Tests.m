#import <GCDWebServers/GCDWebServers.h>
#import <XCTest/XCTest.h>

#pragma clang diagnostic ignored "-Weverything"  // Prevent "messaging to unqualified id" warnings

@interface Tests : XCTestCase
@end

@implementation Tests

- (void)testWebServer {
  GCDWebServer2* server = [[GCDWebServer2 alloc] init];
  XCTAssertNotNil(server);
}

- (void)testDAVServer {
  GCDWebDAVServer* server = [[GCDWebDAVServer alloc] init];
  XCTAssertNotNil(server);
}

- (void)testWebUploader {
  GCDWebUploader* server = [[GCDWebUploader alloc] init];
  XCTAssertNotNil(server);
}

- (void)testPaths {
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@""), @"");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"/foo/"), @"/foo");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"foo/bar"), @"foo/bar");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"foo//bar"), @"foo/bar");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"foo/bar//"), @"foo/bar");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"foo/./bar"), @"foo/bar");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"foo/bar/."), @"foo/bar");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"foo/../bar"), @"bar");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"/foo/../bar"), @"/bar");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"/foo/.."), @"/");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"/.."), @"/");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"."), @"");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@".."), @"");
  XCTAssertEqualObjects(GCDWebServerNormalizePath(@"../.."), @"");
}

@end
