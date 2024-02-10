
#let heiti = ("Times New Roman", "Heiti SC", "Heiti TC", "SimHei")
#let songti = ("Times New Roman", "Songti SC", "Songti TC", "SimSun")
#let zhongsong = ("Times New Roman","STZhongsong", "SimSun")

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

// 目录

#let partcounter = counter("part")

#let cn_outline(title: "目录", depth: none, indent: false) = {
  align(center)[
    #heading(title, numbering: none, outlined: false)
  ]
  v(2em)
  set par(leading: 1.24em, first-line-indent: 0pt)
  set text(font: songti, size: 14pt)
  locate(it => {
    let elements = query(heading.where(outlined: true).after(it), it)

    for el in elements {
      // Skip list of images and list of tables
      if partcounter.at(el.location()).first() < 20 and el.numbering == none { continue }

      // Skip headings that are too deep
      if depth != none and el.level > depth { continue }

      let maybe_number = if el.numbering != none {
        if el.numbering == numing_cn {
          numing_cn(..counter(heading).at(el.location()), location: el.location())
        } else {
          numbering(el.numbering, ..counter(heading).at(el.location()))
        }
        h(0.5em)
      }

      let line = {
        if indent {
          h(1em * (el.level - 1 ))
        }

        // if el.level == 1 {
        //   v(0.5em, weak: true)
        // }

        if maybe_number != none {
          style(styles => {
            box(
              link(el.location(), if el.level == 1 {
                strong(maybe_number)
              } else {
                maybe_number
              })
            )
          })
        }

        link(el.location(), if el.level == 1 {
          strong(el.body)
        } else {
          el.body
        })

        // Filler dots
        if el.level == 1 {
          box(width: 1fr, h(10pt) + box(width: 1fr, repeat[.]) + h(10pt))
        } else {
          box(width: 1fr, h(10pt) + box(width: 1fr, repeat[.]) + h(10pt))
        }
        // Page number
        let page_number = {
          counter(page).at(el.location()).first()
        }
        
        link(el.location(), if el.level == 1 {
          strong(str(page_number))
        } else {
          str(page_number)
        })

        linebreak()
        v(-0.2em)
      }
      line
    }
  })
}

#let empty_par() = {
  v(-1em)
  box()
}

#let project(
  title: "文献标题",
  title_en: "Title of thi Thiese",
  degree: "硕士",
  class: "2023",
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
  sup_group:("王五","赵六","陈七","郭八"),
  body,
) = {
  //页面属性
  set page(paper: "a4", margin: (
    top: 2.5cm,
    bottom: 2.5cm,
    left: 3.2cm,
    right: 2.5cm
  ))

  // 封面
  align(center)[
    #image("/assets/HZAU_LOGO.png", width: 60%, height: 8%)
    #text(
      size: 16pt,
      font: zhongsong,
      weight: "bold"
    )[HUAZHONG AGRICULTURAL UNIVERSITY]

    #par()[
    #text(
      size: 36pt,
      font: heiti
    )[
      #degree#[学位论文]
    ]

    #text(
      size: 18pt,
      font: zhongsong,
      weight: "bold"
    )[
      #if degree=="学士" {
        [BACHELOR'S DEGREE DISSERTATION]
      } else if degree=="硕士" {
        [MASTER'S DEGREE DISSERTATION]
      } else{
        [DOCTOR'S GREE DISSERTATION]
      }
    ]
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
        size: 16pt,
        weight: "bold",
        body
      ))
    }

    #table(
      columns: (40%, 40%),
      align: (left + horizon),
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
    
    #par(justify: false,leading: 0pt)[
      #text(
      font: songti,
      size: 16pt,
    )[
      中国 武汉

      WUHAN, CHINA

      #date_cn

      #date_en
    ]]
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
      #[华中农业大学]#degree#[学位论文]
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
        #for c in sup_group [
          #c

        ]
      ])

    #v(6em)
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

  set page(
    footer: {
      set align(center)
        text(font: songti, 10pt, baseline: -3pt, 
        counter(page).display("I"))
    }
  )
  counter(page).update(1)
  //显示目录
  cn_outline(
    title: "目录",
    depth: 3,
    indent: true,
  )

  pagebreak()

  set page(
    footer: {
      set align(center)
        text(font: songti, 10pt, baseline: -3pt, 
        counter(page).display("i"))
    }
  )
  
  //摘要
  let zh_abstract_page(abstract, keywords: ()) = {
    set heading(level: 1, numbering: none,outlined: false)
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
    set heading(level: 1, numbering: none,outlined: false)
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


  //页眉
  set page(header: locate(loc => {
      set text(font: songti, 10pt, baseline: 8pt, spacing: 3pt)
      set align(center)
      if calc.even(loc.page()) { title } else {
      [华中农业大学]+class+[届]+degree+[研究生学位（毕业）论文]
      }
      line(length: 100%, stroke: 0.7pt)
  }))


  //设置编号格式
  set heading(numbering: numing_cn)
  show heading: set text(font: heiti)
   show heading.where(level: 1): it => {
    set text(weight: "bold", font: heiti, size: 18pt)
    set block(spacing: 1.5em)
    it
  }
  show heading.where(level: 2): it => {
    set text(weight: "bold", font: heiti, size: 14pt)
    set block(above: 1.5em, below: 1.5em)
    it
  }
  
  show heading: it => {
    set text(weight: "bold", font: heiti, size: 12pt)
    set block(above: 1.5em, below: 1.5em)
    it
  } + empty_par()

  //设置段落格式
  set par(justify: true, leading: 1.24em, first-line-indent: 2em)
  show par: set block(spacing: 1.24em)

  //------内容部分------
  //简介部分
  //修正页码
  counter(page).update(1)

  zh_abstract_page(abstract_cn, keywords: keywords_zh)

  pagebreak()

  en_abstract_page(abstract_en, keywords: keywords_en)
  pagebreak()

  set page(
    footer: {
      set align(center)
        text(font: songti, 10pt, baseline: -3pt, 
          counter(page).display("1")
        )
    }
  )



  counter(page).update(1)
  set text(font: songti, size: 12pt)
  body
  
}