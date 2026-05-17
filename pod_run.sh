#!/bin/bash

echo "📦 正在执行 pod install..."
if ! pod install; then
    echo "❌ pod install 执行失败，请检查 Podfile 或网络。"
    exit 1
fi

# 查找当前目录下的 xcworkspace 文件
WORKSPACE_FILE=$(ls *.xcworkspace 2>/dev/null | head -n 1)

if [ -z "$WORKSPACE_FILE" ]; then
    echo "⚠️ 未找到 .xcworkspace 文件，请确认是否包含 CocoaPods 依赖。"
    exit 1
fi

echo "🔄 正在关闭 Xcode..."
# 使用 AppleScript 优雅地退出 Xcode，避免强制杀进程导致数据丢失
osascript -e 'quit app "Xcode"'

# 稍微等待一秒，确保 Xcode 完全退出
sleep 1

echo "🚀 正在使用 Xcode 打开 $WORKSPACE_FILE..."
open "$WORKSPACE_FILE"

echo "✅ 搞定！环境已就绪。"
