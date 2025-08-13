#!/bin/bash
# Emscripten環境設定スクリプト
# 使用方法: source setup_env.sh

# .envファイルから環境変数を読み込み
if [ -f .env ]; then
    source .env
fi

# .env.localファイルから環境変数を読み込み（.envより優先）
if [ -f .env.local ]; then
    source .env.local
fi

if [ -z "$EMSDK_PATH" ]; then
    echo "❌ EMSDK_PATH環境変数が設定されていません"
    exit 1
fi

EMSDK_ENV_SCRIPT="$EMSDK_PATH/emsdk_env.sh"

if [ -f "$EMSDK_ENV_SCRIPT" ]; then
    echo "Emscripten環境を設定中..."
    source "$EMSDK_ENV_SCRIPT"
    echo "✅ Emscripten環境が設定されました"
    echo "📍 em++パス: $(which em++)"
else
    echo "❌ Emscripten SDKが見つかりません: $EMSDK_ENV_SCRIPT"
    echo "💡 EMSDK_PATHが正しく設定されているか確認してください"
    echo "   現在の設定: EMSDK_PATH=$EMSDK_PATH"
    exit 1
fi