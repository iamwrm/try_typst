// Custom styling for diff format

#let removed(content) = text(fill: rgb("#dc2626"), raw("-" + content))

#let added(content) = text(fill: rgb("#16a34a"), raw("+" + content))

#let hunk(content) = text(fill: rgb("#7c3aed"), raw(content))

#let context_(content) = raw(" " + content)

// Diff code block with syntax highlighting

#let diff-block(code) = {
  let lines = code.split("\n")
  block(
    fill: rgb("#f8f8f8"),
    stroke: 1pt + rgb("#e0e0e0"),
    radius: 4pt,
    inset: 8pt,
    width: 100%,
  )[
    #set text(font: "Fira Code", size: 9pt)
    #for line in lines {
      if line.starts-with("@@") {
        text(fill: rgb("#7c3aed"))[#raw(line)]
      } else if line.starts-with("---") or line.starts-with("+++") {
        text(fill: rgb("#0369a1"), weight: "bold")[#raw(line)]
      } else if line.starts-with("-") {
        text(fill: rgb("#dc2626"))[#raw(line)]
      } else if line.starts-with("+") {
        text(fill: rgb("#16a34a"))[#raw(line)]
      } else {
        raw(line)
      }
      linebreak()
    }
  ]
}

= Diff/Patch Format in Typst

This document demonstrates colored diff/patch format rendering.

== Inline Diff Examples

Here's a hunk header: #hunk("@@ -1,3 +1,4 @@")

Lines removed are in red: #removed("old line")

Lines added are in green: #added("new line")

Context lines are plain: #context_("unchanged line")

== File Headers

Diff file headers: #text(fill: rgb("#0369a1"), weight: "bold", raw("--- a/file.txt")) and #text(fill: rgb("#0369a1"), weight: "bold", raw("+++ b/file.txt"))

== Complete Patch Example

#diff-block("--- a/hello.py
+++ b/hello.py
@@ -1,5 +1,6 @@
import sys
+import os
def main():
-    print(\"Hello\")
+    print(\"Hello, World!\")
return 0")

== Another Example

#diff-block("--- a/config.json
+++ b/config.json
@@ -2,7 +2,8 @@
  \"name\": \"my-app\",
-  \"version\": \"1.0.0\",
+  \"version\": \"1.1.0\",
  \"debug\": false,
-  \"timeout\": 30
+  \"timeout\": 60,
+  \"retries\": 3
}")

== Inline Usage

- Deletion: #removed("const OLD_VALUE = 42;")
- Addition: #added("const NEW_VALUE = 100;")
- Hunk: #hunk("@@ -10,6 +10,8 @@")
