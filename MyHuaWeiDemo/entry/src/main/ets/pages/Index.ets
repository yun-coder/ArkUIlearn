/**
 * ** 框架结构**
 * AppScope 中存放应用全局所需要的资源文件
 * entry是应用的主模块，存放HarmonyOS应用的代码、资源等
 * oh_modules 是工程的依赖包，存放工程的源文件
 * build-profile.json5 是工程配置信息，包括了签名、产品配置等
 * hvigorfile.ts 是工程级编译构建任务脚本，
 * havigor是基于任务管理机制实现的一款全新的自动化构建工具
 * 主要提供任务注册编排，工程模型管理、配置管理等核心能力
 *
 * oh-package.json5 是工程级依赖配置文件，用于记录引入包的配置信息
 * AppScope-> app.json5 是应用全局的配置文件，用于存放应用公共的配置信息
 *  bundleName 包名
 *  vendor 应用程序供应商
 *  versionCode 应用版本
 *  versionName 版本号
 *  icon 应用的显示图标
 *  label 应用名
 *
 * src/main/resources/base/profile/main_pages.json
 * 文件保存的是页面page的路径配置信息，
 * 所有需要进行路由跳转的page页面都要在这里进行配置。
 *
 * 组件状态管理装饰器和@Builder装饰器
 * @State装饰的变量是组件内部的状态数据
*  @Prop与@State有相同的语义，但初始化方式不同。
 * @Prop装饰的变量必须使用其父组件提供的@State变量进行初始化
 * ，允许组件内部修改@Prop变量，但更改不会通知给父组件，即@Prop属于单向数据绑定
 * @Link装饰的变量可以和父组件的@State变量建立双向数据绑定，
 * 需要注意的是：@Link变量不能在组件内部进行初始化
 *
 *
 * @Entry 有效的生命周期函数
 * onPageShow
 * onPageHide
 * onBackPress
 * 一个应用可以有一个UIAbility(业务能力)，也可以有多个UIAbility
 */


/**
 * **  路由  **
 * 页面跳转和参数接收
 * 导入router 模块
 * 第一种
 * router.pushUrl() 提供了2种模式
 * router.RouterMode.Single  单例模式
 * router.RouterMode.Standard 混合模式
 * 第二种
 * router.replaceUrl()
 *
 * 获取页面传参
 * router.getParams()
 * 返回上一个页面 或者指定url返回到指定页面
 * router.back()
 * 关闭页面之前询问
 * router.enableBackPageAlert()
 * router.disableAlertBeforeBackPage() 关闭询问
 * 实际业务场景中可以在 onPageShow() 生命周期中进行参数的解析
 */


/**
 * **  UIAbility 生命周期  **
 * Create              onCreate
 * // 窗口管理器
 * WindowStageCreate   onWindowStageCreate
 * Foreground          onForeground
 * Background          onBackground
 * WindowStageDestroy  onWindowStageDestroy
 * Destroy             onDestroy
 */


/**
 * **  UIAbility **
 * singleton  单实例模式   即在最近任务列表中只存在一个该类型的UIAbility实例。
 * multiton   多实例模式   分屏功能时应用
 * specified  指定实例模式  例如用户打开文档应用
 */


/**
 * **  管理组件状态  **
 * 观察嵌套类对象属性变化
 * @Observed
 * @ObjectLink
 */


/**
 * **  管理跨组件层级双向同步状态 **
 * @Provide  父级
*  @Consume  所有后代组件
 */

/**
 *  **  组件状态  **
 *  本地必须初始化的状态修饰器  @State  @Provide 如果使用必须先声明初始化
 *  @State 组件内部状态管理
 *  @Prop  从父组件单向同步状态
 *  @Link  与父组件双向同步状态
 *  @Provide  @Consume 跨组件双向同步状态
 */


/**
 *  ** animation  属性动画  **
 *  使用对象  包括基础组件和容器组件
 *  duration 动画时长
 *  tempo    动画的播放速度
 *  curve    动画变化曲线
 *  delay    延时播放时间  延时间距*图标数量=总延时间距
 *  iterations  播放次数  -1时表示无限制播放 OnFinish 不会被调用
 *  playMode  动画播放模式
 *  onFinish  动画播放结束时回调函数
 */


/**
 *   **  加载网页 **
 *   WebController  加载在线网页
 *   main/resources/rawfile/ 创建HTML文件 通过 $rawfile 引用本地网页资源
 * 网页缩放
 *   zoomAccess 允许进行web组件手势缩放，默认支持
 *   factor 缩放比列 需要网页自身支持缩放
 * 文本缩放
 *   textZoomAtio 默认值为100 表示100%
 * 启用JavaScript
 *    javaScriptAccess(true)
 *    runJavaScript()  执行html网页中的脚本
 * js 调用web组件方法
 *    registerJavaScriptProxy
 *    需要调用refresh方法
 * 处理页面导航
 *    backward() 返回到上一个页面
 *    forward()  前进一个页面
 *    refresh()  刷新页面
 *    clearHistory()  清除历史记录
 *    通过accessBackward()检查是否有后退来时记录，通过accessForward() 检查是否存在前进历史记录
 * 调试网络应用
 *    onConsole 获取网页输出的调试日志信息
 */

/**
 *   **  数据管理能力-- 首选项  **
 * 以 Key-Value 形式存储数据
 * 非关系型数据库
 * 通过调用 flush 方法可以将实例中的数据回写到文件里
 * 常用接口
 * put 保存数据
 * get 获取数据
 * has 是否包含指定的key
 * delete  删除数据
 * flush   数据持久化
 */


/**
 *  ** 应用通知和提醒  **
 *  普通文本类型通知  ContentType.NOTIFICATION_CONTENT_BASIC_TEXT
 *  图片类型通知 ContentType.NOTIFICATION_CONTENT_PICTURE
 *  进度条类型通知
 * 更新通知 通过之前的相同通知id,再次调用 notification.publish
 * 取消已发布的通知  notification.cancel(notificationId)
 * 取消所有的通知    notification.cancelAll()
 *
 * 设置通知通道  slotType
 * SOCIAL_COMMUNICATION 社交类型 显示图标，有横幅，有提示音
 * SERVICE_INFORMATION  服务类型 显示图标，没有横幅，但有提示音
 * CONTENT_INFORMATION  内容类型 显示图标，没有横幅，没有提示音
 * OTHER_TYPES 其他类型   不显示图标，没有横幅，没有提示音
 *
 * 设置通知组  groupName
 *
 * 为通知添加行为意图
 * 拉起UIAbility
 * 发布公共事件
 *
 * ----------后台代理提醒  reminderAgentManager -------------
 * 倒计时类
 * 日历类
 * 闹钟类
 * 在应用退居后台或退出后，计时和提醒通知功能会被系统后台代理接管
 */

/**
 * 应用服务上架
 * 软件包的格式是 .app
 * 新建API 9及以上版本的工程将使用[ohpm]作为默认包管理器。
 */

/**
 * 代码高效开发
 * ctrl+F12  打开代码结构树
 * 右键 + show in API reference  查看API 接口文档
 */



import router from '@ohos.router';
import dataPreferences from '@ohos.data.preferences';
import notification from '@ohos.notificationManager';

@Entry
@Component
struct Index {
  @State message: string = 'Hello World'

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
      }
      .width('100%')
    }
    .height('100%')
  }
}