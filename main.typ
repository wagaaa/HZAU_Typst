#import "dependents/style.typ": *
#import "dependents/figures.typ": *

#show: project.with(
  title: "论文标题",
  title_en: "Title",
  degree: "硕士",
  class: "2222",
  abstract_cn: "为进一步规范学位（毕业）论文写作和装订，促进研究生学位（毕业）论文形式标准化，特制订本规范，其各项要求适用于答辩前后的论文，各位研究生在论文写作时务必认真阅读，严格执行。论文组成：一本完整的论文包括：封面、扉页、论文独创性声明及使用授权书、目录、中文摘要、英文摘要、缩略表、正文、参考文献、附录、致谢几个部分。其中正文由前言、材料与方法、结果与分析、讨论等几个部分组成。“论文独创性声明及使用授权书”置于扉页与目录之间。",
  abstract_en: "In order to further standardize the writing and binding of degree (graduation) thesis and promote the standardization of the form of graduate degree (graduation) thesis, this specification is specially formulated. Its various requirements are applicable to the thesis before and after the defense. All graduate students must read it carefully and strictly implement it when writing the thesis. Thesis Composition: A complete thesis includes: cover page, title page, thesis originality statement and use authorization letter, table of contents, Chinese abstract, English abstract, abbreviation table, main text, references, appendix, and thanks. The main text consists of several parts such as preface, materials and methods, results and analysis, discussion, etc. \"thesis originality statement and use authorization letter\" is placed between the title page and the table of contents.",
  keywords_zh: ("论文","写作","格式","装订"),
  keywords_en: ("Essay", "Writing", "Format", "Binding"),
  colleage: "华中农业大学理学院", //因为理学院不存在了
  candidate: "张三",
  candidate_en: "ZHANG SAN",
  id: "2021301987654",
  major: "应用化学",
  major_en: "PRACTICAL CHEMISTRY",
  supervisor: "李四 教授",
  supervisor_en: "LI SI PROFESSOR",
)

= 前言

前言应包括：研究问题的由来、文献综述、研究目的等基本内容。
研究问题的由来应明确地提出论文研究所针对的科学、生产和经济建设的问题，指出研究这些问题的意义。

== 文献综述

主要回顾与所研究课题相关的学科背景，相关领域的研究进展和存在的问题等，是作者对相关文献阅读、消化后的综合、提炼与升华，反映作者对国内外相关进展的了解和理解的程度。因此，文献综述在叙述前人工作的同时，应有自己的看法和观点。*不应将文献综述写成前人工作的堆砌，也不应象教科书一样写成知识性介绍*。

注意：过去已多次发现在学位论文的“文献综述”和科研论文的“前言”部分整段和部分照抄前人文章的现象，这种现象叫“抄袭”，在文献综述中尤其容易出现，写作时应注意避免。否则被发现后可能会导致不授予学位。

== 研究目的

是在提出问题和综述文献的基础上，阐述学术思想，提出科学假设和假说，提出论文研究要实现的目标或达到的目的。

= 材料与方法

研究所用的材料应详尽地列出，如生物材料及拉丁文学名、品种名称、菌株名称，实验材料与课题研究有关的各种特征特性，由实验材料所得到的各种衍生材料、实验群体、世代、数量等，清楚地说明各种材料的来源。

实验方法的描述也应详尽，以能将实验材料与实验结果贯通为准。描述的详尽程度应能使必要时，他人能重复出这一实验。对一些常用的实验方法，可在引用他人文献的基础上，简要加以描述，不必花大量篇幅去交待细节。但对于方法的改进和自己发明的新方法则需要作详细的交待。要注意说明所用的是他人的方法，还是自己发明的方法，还是在前人方法基础上有改进，有什么改进等。实验方法还应包括实验设计、田间种植方式、田间管理、试验时间、地点、数据采集（考种）、统计分析方法、所用统计软件、计算机程序等。

= 结果与分析

详尽陈述课题研究结果，在写作时力求条理清晰，层次分明，做到环环相扣，具有严密的逻辑性。避免重复叙述实验方法，也不要作过多的讨论。

对于单表行的表格，可以通过`#简单表格`，使用Markdown表格语法快速完成表格。

#简单表格(caption:"成绩分布表", cap_en:"Score Table")[
  | *姓名* | *地址* | *身高* | *分数* |
  | ------ | ---------- | -------- | ------- |
  | John   | Second St. | 180 cm   |  5      |
  | Wally  | Third Av.  | 160 cm   |  10     |
]


#图片(caption:"图片示例", cap_en:"Example of Image")[
  #image("./assets/sample_image.jpg", height: 40%)
]

= 结果与分析

详尽陈述课题研究结果，在写作时力求条理清晰，层次分明，做到环环相扣，具有严密的逻辑性。避免重复叙述实验方法，也不要作过多的讨论。