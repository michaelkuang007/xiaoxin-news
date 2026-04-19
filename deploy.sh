#!/bin/bash
# 小新早报 GitHub Pages 部署脚本

echo "🚀 小新早报 GitHub Pages 部署脚本"
echo "================================"
echo ""

# 检查git配置
if [ -z "$(git config --global user.name)" ]; then
    echo "⚠️  请设置你的 Git 用户名:"
    echo "   git config --global user.name \"你的名字\""
    exit 1
fi

if [ -z "$(git config --global user.email)" ]; then
    echo "⚠️  请设置你的 Git 邮箱:"
    echo "   git config --global user.email \"你的邮箱@example.com\""
    exit 1
fi

# 提示用户输入GitHub用户名
echo "请输入你的 GitHub 用户名:"
read GITHUB_USERNAME

REPO_NAME="xiaoxin-news"
GITHUB_REPO="https://github.com/$GITHUB_USERNAME/$REPO_NAME.git"

echo ""
echo "📋 部署步骤:"
echo "1. 在 GitHub 创建仓库: https://github.com/new"
echo "   仓库名: $REPO_NAME"
echo "   选择: Public (公开)"
echo ""
echo "2. 按回车继续..."
read

# 添加远程仓库
git remote remove origin 2>/dev/null
git remote add origin $GITHUB_REPO

# 推送到GitHub
echo "📤 推送到 GitHub..."
git push -u origin main || git push -u origin master

echo ""
echo "✅ 代码已推送!"
echo ""
echo "🔧 启用 GitHub Pages:"
echo "   访问: https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
echo "   Source: Deploy from a branch"
echo "   Branch: main / (root)"
echo "   点击 Save"
echo ""
echo "⏳ 等待 2-5 分钟后，访问:"
echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME"
echo ""
