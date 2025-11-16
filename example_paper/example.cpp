#include <iostream>
#include <string>
#include <vector>

// 中文注释：简单的C++程序示例
class 学生 {
private:
    std::string 姓名;
    int 年龄;

public:
    // 构造函数
    学生(const std::string& name, int age)
        : 姓名(name), 年龄(age) {}

    // 打印信息
    void 打印信息() const {
        std::cout << "姓名: " << 姓名
                  << ", 年龄: " << 年龄 << std::endl;
    }
};

int main() {
    // 创建学生对象
    std::vector<学生> 学生列表 = {
        学生("张三", 20),
        学生("李四", 22),
        学生("王五", 21)
    };

    // 遍历并打印
    std::cout << "学生信息列表：" << std::endl;
    for (const auto& s : 学生列表) {
        s.打印信息();
    }

    return 0;
}
