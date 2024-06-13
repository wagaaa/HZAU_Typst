# HZAU_Typst
Typst template for HZAU dissertation

华中农业大学学位论文Typst模版（开发中）

## 使用方法

1. 安装[Typst](https://typst.app/)
2. 安装字体依赖（宋体、黑体、Times New Roman等）
3. 使用推荐的编辑器（VSCode）编辑`main.typ`

## 待完善功能

- [x] 页眉页脚
- [x] 目录
- [x] 简单图表
- [ ] 装订页边距
- [ ] 格式调整
- [x] 自动生成参考文献？CSL格式支持不佳
- [ ] 参考文献、附录、致谢暂未加入目录

## 文件结构

```
.
├── LICENSE
├── README.md
├── assets              🖼️图片、媒体等
│   ├── HZAU_LOGO.png   LOGO图
│   ├── ref.bib         参考文献
│   └── sample_image.jpg    图片
├── dependents          项目依赖
│   ├── appendix.typ    随附页面
│   ├── figures.typ     图表
│   ├── hzau.csl        引用格式
│   └── style.typ       项目格式设置
├── main.typ            ⭐主文件，请编辑此文件完成论文
└── playground.typ
```

## 致谢

- [werifu/HUST-typst-template](https://github.com/werifu/HUST-typst-template/tree/main)
- [lucifer1004/pkuthss-typst](https://github.com/lucifer1004/pkuthss-typst/tree/main)
- [OrangeX4/typst-tablem](https://github.com/OrangeX4/typst-tablem)
- [HZAU-CSL](https://github.com/redleafnew/Chinese-STD-GB-T-7714-related-csl/blob/main/403huazhong-agricultural-university.csl)
