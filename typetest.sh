#!/bin/bash

# 指法练习小程序

# 选择难度级别
echo "请选择难度级别（1-简单，2-中等，3-困难）:"
read difficulty

# 根据难度生成字母
case $difficulty in
    1)
        # 简单难度：只包含小写字母
        characters=$(tr -dc 'a-z' </dev/urandom | head -c 30)
        ;;
    2)
        # 中等难度：包含小写和大写字母
        characters=$(tr -dc 'a-zA-Z' </dev/urandom | head -c 30)
        ;;
    3)
        # 困难难度：包含小写、大写字母和数字
        characters=$(tr -dc 'a-zA-Z0-9' </dev/urandom | head -c 30)
        ;;
    *)
        echo "无效的难度级别，程序退出。"
        exit 1
        ;;
esac

# 开始计时
start=$(date +%s)

# 显示字母并让用户输入
echo "请输入以下字母:"
echo $characters

# 读取用户输入
read -t 114514 user_input

# 结束计时
end=$(date +%s)
time_taken=$((end - start))

# 检查正确率和计算错误字母数
correct_count=0
wrong_count=0
wrong_characters=""
for (( i=0; i<${#characters}; i++ )); do
    if [ "${characters:$i:1}" == "${user_input:$i:1}" ]; then
        correct_count=$((correct_count + 1))
    else
        wrong_count=$((wrong_count + 1))
        wrong_characters="$wrong_characters${characters:$i:1}"
    fi
done
accuracy=$(echo "scale=2; ($correct_count / ${#characters}) * 100" | bc)

# 计算平均每秒输入的字母数
average=$(echo "scale=2;${#characters} / $time_taken" | bc)

# 显示结果
echo "练习结束！"
echo "用时: $time_taken 秒"
echo "正确率: $accuracy%"
echo "您打错了 $wrong_count 个字母，分别是:$wrong_characters"
echo "平均每秒输入字母数: $average 个/秒"