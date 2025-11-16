# Typst Toolchain

A toolchain for generating PDFs with Typst.

Download a portable patch file:

```bash
curl -sSL https://raw.githubusercontent.com/iamwrm/try_typst/refs/heads/master/typst_toolchain.patch | patch -p1
bash ./typst_toolchain/build.sh
bash ./typst_toolchain/compile.sh example_paper/test.typ
```

Example output: [example_paper/test.pdf](example_paper/test.pdf)
