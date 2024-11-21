#!/bin/bash

remote_path="/Users/sunliangmu/work/ss/lowcode-manage-center/public"

CURRENT_DIR="antd"

# 检查当前目录下是否存在 build 文件夹
if [ ! -d "dist" ]; then
  # 如果不存在 build 文件夹，则打印错误信息并退出脚本
  echo "Error: 'dist' directory does not exist in the current directory."
  exit 1
fi

# 检查是否存在 lowcode 文件夹，如果存在，则删除
if [ -d "${CURRENT_DIR}" ]; then
  echo "Removing existing '${CURRENT_DIR}' directory..."
  rm -rf "${CURRENT_DIR}"
fi

# 创建 lowcode 文件夹
mkdir "${CURRENT_DIR}"

# 将 build 文件夹内的所有内容移动到 lowcode 文件夹中
mv dist "${CURRENT_DIR}"/

rm -rf "${remote_path}/${CURRENT_DIR}"

mv "${CURRENT_DIR}" "${remote_path}/"