#import "SandboxManager.h"

@implementation SandboxManager

+ (NSString *)homePath {
    return NSHomeDirectory();
}

+ (NSString *)appPath {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSApplicationDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)docPath {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    return [paths objectAtIndex:0];
}

+ (NSString *)libPrefPath {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Preference"];
}

+ (NSString *)libCachePath {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/Caches"];
}

+ (NSString *)tmpPath {
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, NSUserDomainMask, YES);
    return [[paths objectAtIndex:0] stringByAppendingFormat:@"/tmp"];
}

+ (BOOL)deleteFileAtPath:(NSString *)path {
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager removeItemAtPath:path error:nil];
}

+ (BOOL)fileExistsAtPath:(NSString *)path {
    NSFileManager *manager = [NSFileManager defaultManager];
    return [manager fileExistsAtPath:path];
}

+ (BOOL)createFolderAtPath:(NSString *)path {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    return [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
}

+ (NSArray *)folderContentsAtPath:(NSString *)path {
    NSFileManager *fileManage = [NSFileManager defaultManager];
    return [fileManage contentsOfDirectoryAtPath:path error:NULL];
}

+ (BOOL)clearFolderContentsAtPath:(NSString *)path {
    NSArray *subFiles = [SandboxManager folderContentsAtPath:path];
    for (NSString *fileName in subFiles) {
        NSString *subFilePath = [path stringByAppendingPathComponent:fileName];
        if (![SandboxManager deleteFileAtPath:subFilePath]) {
            return NO;
        }
    }
    return YES;
}

+ (NSString *)createUniqueString {
    NSMutableString *result = [NSMutableString string];
    int num;
    for (int i = 0; i < 6; i ++) {
        num = arc4random() % 100;
        [result appendFormat:@"%d&",num];
    }
    return (NSString *)result;
}

@end
