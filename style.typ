
#let heiti = ("Times New Roman", "Heiti SC", "Heiti TC", "SimHei")
#let songti = ("Times New Roman", "Songti SC", "Songti TC", "SimSun")
#let zhongsong = ("Times New Roman","STZhongsong", "SimSun")


// 目录
#let cn_outline() = {
  align(center)[
    #text(size: 18pt, font: songti, "目录")

    #set par(leading: 1.24em, first-line-indent: 0pt)
    #locate(loc => {
    let elements = query(heading.where(outlined: true), loc)
    for el in elements {
      // 是否有 el 位于前面，前面的目录中用拉丁数字，后面的用阿拉伯数字
      let before_toc = query(heading.where(outlined: true).before(loc), loc).find((one) => {one.body == el.body}) != none
      let page_num = if before_toc {
        numbering("I", counter(page).at(el.location()).first())
      } else {
        counter(page).at(el.location()).first()
      }

      link(el.location())[#{
        // acknoledgement has no numbering
        let chapt_num = if el.numbering != none {
          numbering(el.numbering, ..counter(heading).at(el.location()))
        } else {none}

        if el.level == 1 {
          set text(weight: "black")
          if chapt_num == none {} else {
            chapt_num
            "　　"
          }
          el.body
        } else {
          chapt_num
          "　"
          el.body
        }
      }]

      // 填充 ......
      box(width: 1fr, h(0.5em) + box(width: 1fr, repeat[.]) + h(0.5em))
      [#page_num]
      linebreak()
    }
    }
    )
  ]
}

//中文章节名称
#let num_cn(num, standalone: false) = if num < 11 {
  ("零", "一", "二", "三", "四", "五", "六", "七", "八", "九", "十").at(num)
} else if num < 100 {
  if calc.rem(num, 10) == 0 {
    num(calc.floor(num / 10)) + "十"
  } else if num < 20 and standalone {
    "十" + num_cn(calc.rem(num, 10))
  } else {
    num_cn(calc.floor(num / 10)) + "十" + num_cn(calc.rem(num, 10))
  }
} else if num < 1000 {
  let left = num_cn(calc.floor(num / 100)) + "百"
  if calc.rem(num, 100) == 0 {
    left
  } else if calc.rem(num, 100) < 10 {
    left + "零" + num_cn(calc.rem(num, 100))
  } else {
    left + num_cn(calc.rem(num, 100))
  }
} else {
  let left = num_cn(calc.floor(num / 1000)) + "千"
  if calc.rem(num, 1000) == 0 {
    left
  } else if calc.rem(num, 1000) < 10 {
    left + "零" + num_cn(calc.rem(num, 1000))
  } else if calc.rem(num, 1000) < 100 {
    left + "零" + num_cn(calc.rem(num, 1000))
  } else {
    left + num_cn(calc.rem(num, 1000))
  }
}

#let appendixcounter = counter("appendix")
#let numing_cn(..nums, location: none, brackets: false) = locate(loc => {
  let actual_loc = if location == none { loc } else { location }
  if appendixcounter.at(actual_loc).first() < 10 {
    if nums.pos().len() == 1 {
      "第" + num_cn(nums.pos().first(), standalone: true) + "章"
    } else {
      numbering(if brackets { "(1.1)" } else { "1.1" }, ..nums)
    }
  } else {
    if nums.pos().len() == 1 {
      "附录 " + numbering("A.1", ..nums)
    } else {
      numbering(if brackets { "(A.1)" } else { "A.1" }, ..nums)
    }
  }
})

#let project(
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
  date_cn:"二〇二三年六月",
  date_en: "JUNE, 2023",
  body,
) = {
  //页面属性
  set page(paper: "a4", margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 3.2cm,
    right: 2.5cm
  ))
  set heading(numbering: numing_cn)

  // 封面
  align(center)[
    #image("./assets/HZAU_LOGO.png", width: 60%, height: 8%)
    #text(
      size: 16pt,
      font: zhongsong,
      weight: "bold"
    )[HUAZHONG AGRICULTURAL UNIVERSITY]

    #par()[
    #text(
      size: 36pt,
      font: heiti,
      weight: "bold"
    )[硕士学位论文]

    #text(
      size: 24pt,
      font: zhongsong,
      weight: "bold"
    )[MASTER’S DEGREE DISSERTATION]
    ]


    #text(
      font: heiti,
      size: 22pt,
      weight: "bold"
    )[
      #title
    ]

    #text(
      font: heiti,
      size: 22pt,
      weight: "bold"
    )[
      #title_en
    ]

    #v(5pt)

    // Author Infos
    #let info_key(body) = {
      rect(width: 100%, inset: 2pt, 
       stroke: none,
       text(
        font: songti,
        size: 18pt,
        weight: "bold",
        body
      ))
    }

    #let sub_info_key(body) = {
      rect(width: 100%, inset: 2pt, 
       stroke: none,
       text(
        font: songti,
        size: 14pt,
        weight: "bold",
        body
      ))
    }

    #table(
      columns: (40%, 40%),
      align: left,
      stroke: none,
      gutter: 0pt,
      [
        #info_key("研究生：")
        #sub_info_key("CANDIDATE: ")
      ],[
        #info_key(candidate)
        #sub_info_key(candidate_en)
      ],
      [
        #info_key("学号：")
        #sub_info_key("STUDENT NO.: ")
      ],[
        #info_key(id)
      ],
      [
        #info_key("专业：")
        #sub_info_key("MAJOR: ")
      ],[
        #info_key(major)
        #sub_info_key(major_en)
      ],
      [
        #info_key("导师：")
        #sub_info_key("SUPERVISOR: ")
      ],[
        #info_key(supervisor)
        #sub_info_key(supervisor_en)
      ]
    )

    #v(8pt)
    
    #text(
      font: songti,
      size: 16pt,
    )[
      #set par(justify: false, leading: 0pt)

      中国 武汉

      WUHAN, CHINA

      #date_cn

      #date_en
    ]
    #pagebreak()

  ]

  //内封面
  align(center)[
    #v(40pt)
    #text(
      font: songti,
      weight: "bold",
      size: 24pt
    )[
      华中农业大学硕士学位论文
      #v(40pt)
    ]

    #text(
      font: heiti,
      weight: "bold",
      size: 18pt,
    )[
      #title
      
      #title_en
    ]

    #v(30pt)
    
    #set text(
        font: songti,
        size: 16pt,
        weight: "bold"
    )
    #table(
      columns: (20%, 20%),
      stroke: none,
      align: left,
      gutter: 12pt,
      [研究生：],[#candidate],
      [学号：],[#id],
      [指导教师：],[#supervisor],
      [指导小组：],
      [
        王五

        赵六

        陈七
      ])

    #v(8em)
    #table(
      columns: (55%, 45%),
      align: left,
      stroke: none,
      [专业：#major],[研究方向：submajor],
      [获得学位名称：],[获得学位时间：]
    )
    #v(2em)
    #text(
      font: songti,
      size: 16pt,
    )[
      #colleage

      #date_cn
    ]
    
  ]
  pagebreak()

  //显示目录
  cn_outline()

  pagebreak()
  
  //摘要
  let zh_abstract_page(abstract, keywords: ()) = {
    set heading(level: 1, numbering: none)
    show <_zh_abstract_>: {
      align(center)[
        #text(font: heiti, size: 18pt, "摘　　要")
      ]
    }
    [= 摘要 <_zh_abstract_>]

    set text(font: songti, size: 12pt)

    abstract
    par(first-line-indent: 0em)[
      #text(weight: "bold", font: heiti, size: 12pt)[
        关键词：
        #keywords.join("；")
      ]
    ]
  }

  let en_abstract_page(abstract, keywords: ()) = {
    set heading(level: 1, numbering: none)
    show <_en_abstract_>: {
      align(center)[
        #text(font: heiti, size: 18pt, "Abstract")
      ]
    }
    [= Abstract <_en_abstract_>]

    set text(font: songti, size: 12pt)

    abstract
    par(first-line-indent: 0em)[
      #text(weight: "bold", font: heiti, size: 12pt)[
        Key Words: 
        #keywords.join("; ")
      ]
    ]
}

  counter(page).update(1)

  zh_abstract_page(abstract_cn, keywords: keywords_zh)
  pagebreak()
  en_abstract_page(abstract_en, keywords: keywords_en)
  pagebreak()

  text(font: songti)[#body]
}