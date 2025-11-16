## Contact and Resources

### Official Documentation
- **Typst**: https://typst.app/docs
- **Source Han Fonts**: https://github.com/adobe-fonts/source-han-serif

### Session Information
- **Development Date**: 2025-11-16
- **Developer**: Claude Code (Anthropic)
- **Platform**: Linux 6.17.4-orbstack

---

## Appendix: Code Snippets

### Apply patch

```bash
patch -p1 < typst_toolchain.patch
```

### Complete test.typ (Final Version)
```typst
#set page(
  paper: "a4",
  margin: (x: 2cm, y: 2cm)
)

#set text(
  font: ("Source Han Serif", "Source Han Sans"),
  lang: "zh",
  size: 12pt
)

#set par(
  justify: true,
  leading: 0.65em
)

#set heading(numbering: "1.")

#show raw.where(block: true): it => {
  block(
    width: 100%,
    inset: 10pt,
    radius: 4pt,
    stroke: 1pt + luma(180),
    fill: luma(245),
    breakable: true,
    it
  )
}

= 测试文档

这是一个测试文档，用于验证Typst的中文支持。

== Bash脚本示例

#raw(read("example.sh"), lang: "bash", block: true)

== C++代码示例

#raw(read("example.cpp"), lang: "cpp", block: true)

== 长Python文件示例

以下是一个较长的Python文件，用于测试分页效果：

#raw(read("long_example.py"), lang: "python", block: true)
```

### Example External Files

#### example.sh
```bash
#!/bin/bash
# 这是一个测试脚本
# This is a test script

echo "你好，世界！"
echo "Hello, World!"

# 循环示例
for i in {1..5}; do
    echo "计数: $i"
done
```

#### example.cpp
```cpp
#include <iostream>
#include <string>

// 学生类
class 学生 {
private:
    std::string 姓名;
    int 年龄;

public:
    学生(std::string n, int a) : 姓名(n), 年龄(a) {}

    void 显示信息() {
        std::cout << "姓名: " << 姓名 << std::endl;
        std::cout << "年龄: " << 年龄 << std::endl;
    }
};

int main() {
    学生 张三("张三", 20);
    张三.显示信息();
    return 0;
}
```

---
