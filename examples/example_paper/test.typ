#set page(paper: "a4", margin: 2.5cm)
#set text(font: "Source Han Serif SC", lang: "zh")

// 为代码块添加边框（允许跨页）
#show raw.where(block: true): it => block(
  width: 100%,
  fill: luma(245),
  stroke: 1pt + luma(180),
  radius: 4pt,
  inset: 10pt,
  breakable: true
)[#it]

#align(center)[
  #text(size: 17pt, weight: "bold")[中文测试文档]

  #v(0.5em)

  Typst测试

  #v(0.5em)

  #datetime.today().display()
]

#v(1em)

= 简介

这是一个测试文档，用于验证Typst能否正确渲染中文字符。

= 字体切换演示

*本段使用 Source Han Serif SC（思源宋体）—— 带有装饰性笔画的衬线字体：*

中文（Chinese）是世界上使用人数最多的语言之一。汉字是中文的书写系统。这是传统的衬线字体，笔画末端有装饰性的衬线。

#v(1em)

#text(font: "Source Han Sans SC")[
*本段切换到 Source Han Sans SC（思源黑体）—— 现代无衬线字体：*

中文（Chinese）是世界上使用人数最多的语言之一。汉字是中文的书写系统。这是现代的无衬线字体，笔画简洁、线条均匀。
]

#v(1em)

*本段切换回 Source Han Serif SC（思源宋体）：*

通过对比可以看到，宋体（Serif）和黑体（Sans）的视觉差异非常明显。

= 常用词汇
- 你好 (Hello)
- 世界 (World)
- 测试 (Test)
- 文档 (Document)

= 混合内容

这段文字包含中文和English混合内容，用于测试mixed language rendering。

数学公式测试：$E = m c^2$

= 代码示例

Typst 支持语法高亮的代码块。

== 内联代码示例

行内代码可以用反引号包围，例如：`println!("Hello")` 或 `int main()`。

也可以指定语言：#raw("Vec<String>", lang: "rust") 或 #raw("SELECT * FROM users", lang: "sql")。

== 直接在文件中编写代码块

以下是直接在 `.typ` 文件中编写的代码块示例：

=== Python 示例

```python
def fibonacci(n: int) -> int:
    """计算斐波那契数列的第n项"""
    if n <= 1:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)

# 测试
for i in range(10):
    print(f"F({i}) = {fibonacci(i)}")
```

=== Rust 示例

```rust
fn main() {
    let message = "你好，世界！";
    println!("{}", message);

    // 使用迭代器
    let numbers: Vec<i32> = (1..=5).collect();
    let sum: i32 = numbers.iter().sum();
    println!("Sum: {}", sum);
}
```

=== JavaScript 示例

```javascript
// 异步函数示例
async function fetchData(url) {
    const response = await fetch(url);
    const data = await response.json();
    return data;
}

// 箭头函数
const greet = (name) => `Hello, ${name}!`;
console.log(greet("Typst"));
```

=== SQL 示例

```sql
-- 创建用户表
CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- 查询活跃用户
SELECT username, email
FROM users
WHERE created_at > NOW() - INTERVAL '30 days'
ORDER BY created_at DESC;
```

== 从外部文件读取的代码块

以下代码块从外部文件读取：

=== Bash 脚本示例

#raw(read("example.sh"), lang: "bash", block: true)

== C++ 代码示例

#raw(read("example.cpp"), lang: "cpp", block: true)

== Makefile 示例

#raw(read("Makefile"), lang: "makefile", block: true)

== Dockerfile 示例

#raw(read("Dockerfile"), lang: "dockerfile", block: true)

== Python 长代码示例

#raw(read("long_example.py"), lang: "python", block: true)

= 结论

如果你能看到这些中文字符和不同的字体效果，说明Typst成功渲染了Adobe Source Han字体系列！