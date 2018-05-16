#import <Foundation/Foundation.h>

@interface SandboxManager : NSObject

///---------------------------------------------------------------------------------------
/// @name  沙盒目录
///---------------------------------------------------------------------------------------

/**
 程序主目录，可见子目录(3个):Documents、Library、tmp
 */
+ (NSString *)homePath;

/**
 程序目录，不能存任何东西
 */
+ (NSString *)appPath;

/**
 文档目录，需要ITUNES同步备份的数据存这里，可存放用户数据
 */
+ (NSString *)docPath;

/**
 配置目录，配置文件存这里
 */
+ (NSString *)libPrefPath;

/**
 缓存目录，可能会被系统删除
 */
+ (NSString *)libCachePath;

/**
 临时缓存目录，随时可能会被删除
 */
+ (NSString *)tmpPath;


///---------------------------------------------------------------------------------------
/// @name  文件操作
///---------------------------------------------------------------------------------------

/**
 删除任意文件（也可删除文件夹）

 @param path 文件路径
 @return 是否删除成功
 */
+ (BOOL)deleteFileAtPath:(NSString *)path;

/**
 判断目标路径文件是否存在

 @param path 文件路径
 @return 文件是否存在
 */
+ (BOOL)fileExistsAtPath:(NSString *)path;

/**
 在指定路径下创建文件夹

 @param path 文件夹路径
 @return 是否创建成功，注：如果指定目录下存在文件夹返回NO
 */
+ (BOOL)createFolderAtPath:(NSString *)path;

/**
 查询文件夹下的子文件

 @param path 文件夹路径
 @return 子文件数组
 */
+ (NSArray *)folderContentsAtPath:(NSString *)path;

/**
 清除文件夹内容

 @param path 文件夹路径
 @return 是否清除成功
 */
+ (BOOL)clearFolderContentsAtPath:(NSString *)path;


///---------------------------------------------------------------------------------------
/// @name  其他
///---------------------------------------------------------------------------------------

/**
 创建唯一性字符串
 */
+ (NSString *)createUniqueString;


@end
