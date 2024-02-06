#import "style.typ": *
#show: project.with(
  title: "文献标题",
  title_en: "Title of thi Thiese",
  abstract_cn: "中文文献",
  abstract_en: "英文文献",
  keywords_zh: (),
  keywords_en: (),
  colleage: "信息学院",
  candidate: "张三",
  candidate_en: "ZHANG SAN",
  id: "2021301987654",
  major: "人工智能",
  major_en: "ARTIFICIAL INTELLEGENCE",
  supervisor: "李四",
  supervisor_en: "LI SI",
)

= 序言

这是序言部分。Typst 是为科学写作而诞生的基于标记的排版系统。 它被设计之初就是作为一种替代品，用于替代像 LaTeX 这样的高级工具，又或者是像 Word 和 Google Docs 这样的简单工具。 我们对 Typst 的目标是构建一个功能强大的排版工具，并且让用户可以愉快地使用它。

== 何时使用 Typst

在开始之前，让我们考虑一下 Typst 到底是什么，以及我们在什么时候应该使用它。 Typst 是一种用于排版文档的标记语言，它旨在易于学习、快速且用途广泛。 Typst 输入带有标记的文本文件，并将其输出为 PDF 格式。

Typst 是撰写长篇文本（如论文、文章、书籍、报告和作业）的极佳选择。 并且，Typst 非常适合书写包含数学公式的文档，例如数学、物理和工程领域的论文。 此外，由于其强大的样式和自动化功能，它是编写具有相同样式的一系列文档（例如丛书）的绝佳选择。

= 使用Typst写作

让我们开始吧！假设你被要求为大学写一份技术报告，报告将包含文字、数学公式、标题和图表。 首先，请在 Typst App 上创建一个新项目。你将会看见一个分为两个面板的编辑器： 用于撰写文档的代码面板和查看渲染文档的预览面板。