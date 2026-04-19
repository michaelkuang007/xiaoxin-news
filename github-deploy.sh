#!/bin/bash
# GitHub Pages 一键部署脚本

GITHUB_USERNAME="MichaelKuang007"
REPO_NAME="xiaoxin-news"

echo "🚀 小新早报 GitHub Pages 部署脚本"
echo "================================"
echo ""

cd /Users/sean/xiaoxin-news

# 检查git配置
if [ -z "$(git config --global user.name)" ]; then
    git config --global user.name "MichaelKuang007"
    git config --global user.email "user@example.com"
fi

# 添加远程仓库
echo "📦 步骤1: 配置远程仓库..."
git remote remove origin 2>/dev/null
git remote add origin https://github.com/$GITHUB_USERNAME/$REPO_NAME.git

# 推送代码
echo "📤 步骤2: 推送代码到GitHub..."
git push -u origin main

if [ $? -eq 0 ]; then
    echo ""
    echo "✅ 代码推送成功！"
    echo ""
    echo "🔧 步骤3: 启用 GitHub Pages"
    echo "   请打开: https://github.com/$GITHUB_USERNAME/$REPO_NAME/settings/pages"
    echo "   Source: Deploy from a branch"
    echo "   Branch: main / (root)"
    echo "   点击 Save"
    echo ""
    echo "⏳ 等待2-5分钟后访问:"
    echo "   https://$GITHUB_USERNAME.github.io/$REPO_NAME"
else
    echo "❌ 推送失败，请检查:"
    echo "   1. 是否已在GitHub创建仓库: https://github.com/new"
    echo "   2. 仓库名是否为: xiaoxin-news"
    echo "   3. 是否选择了 Public"
fi
