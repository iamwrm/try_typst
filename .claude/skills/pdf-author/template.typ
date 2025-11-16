#set page(paper: "a4", margin: 2.5cm)
#set text(font: "Source Han Serif SC", lang: "zh")

// Code block styling with breakable frames
#show raw.where(block: true): it => block(
  width: 100%,
  fill: luma(245),
  stroke: 1pt + luma(180),
  radius: 4pt,
  inset: 10pt,
  breakable: true
)[#it]

#align(center)[
  #text(size: 17pt, weight: "bold")[文档标题]

  #v(0.5em)

  文档副标题

  #v(0.5em)

  #datetime.today().display()
]

#v(1em)

= 简介

这是一个使用 Typst 生成的中文文档示例。

= 代码示例

== Python 代码

#raw(read("example.py"), lang: "python", block: true)

== Bash 脚本

#raw(read("example.sh"), lang: "bash", block: true)

= 结论

文档生成完成。
