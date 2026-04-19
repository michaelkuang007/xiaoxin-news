#!/bin/bash
# Vercel 部署脚本

cd /Users/sean/xiaoxin-news
export PATH="/Users/sean/.workbuddy/binaries/node/versions/22.12.0/bin:$PATH"

echo "🚀 开始部署小新早报到 Vercel..."
echo ""

# 登录 Vercel
echo "步骤1: 登录 Vercel"
npx vercel login

echo ""
echo "步骤2: 部署到生产环境"
npx vercel --prod

echo ""
echo "✅ 部署完成！"
