#!/usr/bin/env python3
# -*- coding: utf-8 -*-

"""
学生管理系统 (Student Management System)
一个简洁的学生管理系统示例，用于测试 Typst 如何处理代码文件。
"""

import json
import os
from datetime import datetime
from typing import List, Dict, Optional
from dataclasses import dataclass, field, asdict


@dataclass
class 学生:
    """学生类 - 存储学生基本信息"""
    学号: str
    姓名: str
    性别: str
    年龄: int
    专业: str
    入学年份: int
    成绩: Dict[str, float] = field(default_factory=dict)

    def __post_init__(self):
        if self.年龄 < 0 or self.年龄 > 150:
            raise ValueError(f"年龄必须在0-150之间: {self.年龄}")
        if self.性别 not in ["男", "女", "其他"]:
            raise ValueError(f"性别必须是'男'、'女'或'其他': {self.性别}")

    def 添加成绩(self, 课程名称: str, 分数: float):
        if 分数 < 0 or 分数 > 100:
            raise ValueError(f"分数必须在0-100之间: {分数}")
        self.成绩[课程名称] = 分数

    def 计算平均分(self) -> float:
        return sum(self.成绩.values()) / len(self.成绩) if self.成绩 else 0.0

    def 获取等级(self) -> str:
        平均分 = self.计算平均分()
        if 平均分 >= 90: return "优秀"
        elif 平均分 >= 80: return "良好"
        elif 平均分 >= 70: return "中等"
        elif 平均分 >= 60: return "及格"
        else: return "不及格"


@dataclass
class 课程:
    """课程类 - 存储课程信息"""
    课程代码: str
    课程名称: str
    学分: int
    授课教师: str


class 学生管理系统:
    """学生管理系统主类"""

    def __init__(self, 数据文件: str = "students.json"):
        self.学生列表: List[学生] = []
        self.课程列表: List[课程] = []
        self.数据文件 = 数据文件
        self.加载数据()

    def 加载数据(self):
        if os.path.exists(self.数据文件):
            try:
                with open(self.数据文件, 'r', encoding='utf-8') as f:
                    数据 = json.load(f)
                    for 学生数据 in 数据.get('学生', []):
                        self.学生列表.append(学生(**学生数据))
            except Exception as e:
                print(f"加载数据时出错: {e}")

    def 保存数据(self):
        数据 = {
            '学生': [asdict(s) for s in self.学生列表],
            '保存时间': datetime.now().isoformat()
        }
        with open(self.数据文件, 'w', encoding='utf-8') as f:
            json.dump(数据, f, ensure_ascii=False, indent=2)

    def 添加学生(self, 学生对象: 学生) -> bool:
        if any(s.学号 == 学生对象.学号 for s in self.学生列表):
            return False
        self.学生列表.append(学生对象)
        return True

    def 删除学生(self, 学号: str) -> bool:
        for i, s in enumerate(self.学生列表):
            if s.学号 == 学号:
                self.学生列表.pop(i)
                return True
        return False

    def 查找学生(self, 学号: str) -> Optional[学生]:
        return next((s for s in self.学生列表 if s.学号 == 学号), None)

    def 按专业查找(self, 专业: str) -> List[学生]:
        return [s for s in self.学生列表 if s.专业 == 专业]

    def 统计信息(self) -> Dict:
        if not self.学生列表:
            return {}
        有成绩学生 = [s for s in self.学生列表 if s.成绩]
        平均分列表 = [s.计算平均分() for s in 有成绩学生]
        return {
            '总人数': len(self.学生列表),
            '最高分': max(平均分列表) if 平均分列表 else 0,
            '最低分': min(平均分列表) if 平均分列表 else 0,
            '平均分': sum(平均分列表) / len(平均分列表) if 平均分列表 else 0
        }


def 主程序():
    """主程序入口"""
    系统 = 学生管理系统("students.json")

    # 添加示例学生
    学生1 = 学生("2021001", "张三", "男", 20, "计算机科学", 2021)
    学生1.添加成绩("高等数学", 95)
    学生1.添加成绩("程序设计", 88)
    学生1.添加成绩("数据结构", 92)
    系统.添加学生(学生1)

    学生2 = 学生("2021002", "李四", "女", 19, "计算机科学", 2021)
    学生2.添加成绩("高等数学", 78)
    学生2.添加成绩("程序设计", 85)
    系统.添加学生(学生2)

    学生3 = 学生("2021003", "王五", "男", 21, "软件工程", 2021)
    学生3.添加成绩("高等数学", 92)
    学生3.添加成绩("程序设计", 95)
    系统.添加学生(学生3)

    # 添加课程
    系统.课程列表.append(课程("CS101", "程序设计基础", 4, "李教授"))

    # 显示统计和查找示例
    统计 = 系统.统计信息()
    print(f"学生总数: {统计['总人数']}, 平均分: {统计['平均分']:.2f}")

    if 学生 := 系统.查找学生("2021001"):
        print(f"找到学生: {学生.姓名}, 等级: {学生.获取等级()}")
    系统.保存数据()

if __name__ == "__main__":
    主程序()
