# iOSLearn

这是一个用于 iOS 原生开发的学习工程，主要聚焦于 UIKit 框架，采用纯代码构建方式（无 Storyboard/XIB）。

## 工程结构

为了方便对比和独立学习，本工程拆分为两条平行的技术路线：

- **Objective-C 路线 (`OC_Route/`)**：用于存放 Objective-C 相关的学习代码。
- **Swift 路线 (`Swift_Route/`)**：用于存放 Swift 相关的学习代码。

工程已经配置好 Bridging Header (`iOSLearn-Bridging-Header.h`)，支持 OC 与 Swift 混编。应用入口由 `AppDelegate.swift` 接管，并通过 `RootViewController` 分发两条技术路线的入口。

## 开发环境与依赖

本项目使用 CocoaPods 进行依赖管理，并已接入 LookinServer 用于 UI 视图层级调试。

### 依赖配置

- 包管理工具: CocoaPods
- 调试工具: LookinServer (仅在 Debug 模式下注入，不影响 Release 包)

### 如何运行

1. 克隆本仓库到本地。
2. 在终端进入工程根目录，执行以下命令安装依赖：
   ```bash
   pod install
   ```
   或者直接运行工程目录下提供的自动化脚本：
   ```bash
   ./pod_run.sh
   ```
3. 依赖安装完成后，务必双击打开 `iOSLearn.xcworkspace` 文件，而不是 `.xcodeproj`。
4. 选择 iOS 模拟器，按下 `Cmd + R` 编译运行。

## 注意事项

- 本工程已通过 `Podfile` 钩子关闭了 Xcode 的 User Script Sandboxing，以解决 CocoaPods 植入动态库时的构建报错。
- 如果需要使用 Lookin 调试 UI，请确保 Mac 端已安装 Lookin 客户端，并在模拟器运行状态下进行连接。
