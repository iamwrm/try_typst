#!/bin/bash

# 中文注释：打印欢迎信息
echo "你好，世界！"

# 函数定义
greet_user() {
    local name=$1
    echo "欢迎, $name!"
}

# 调用函数
greet_user "张三"

# 循环示例
for i in {1..5}; do
    echo "计数: $i"
done

# 条件判断
if [ -f "test.txt" ]; then
    echo "文件存在"
else
    echo "文件不存在"
fi
