### 目录
- [1、如何报告问题](#1)
- [2、如何提交PR](#2)
- [3、如何理解项目](#3)
- [4、代码提交规约](#4)
- &nbsp;&nbsp;&nbsp;&nbsp;[1、单测通过](#41)
- &nbsp;&nbsp;&nbsp;&nbsp;[2、commit message 规范](#42)
- &nbsp;&nbsp;&nbsp;&nbsp;[3、分支管理](#43)
- [5、打包Release](#5)
- [6、项目数据](#6)

## <span id="1">1、如何报告问题</span>
如果在了解和使用过程中，有任何疑问，非常欢迎提出宝贵的 [Issue](https://github.com/WGrape/posture/issues/new)

## <span id="2">2、如何提交PR</span>
PR的提交不限制范围，如代码、文档等修改均在允许范围内，可 [参考这里](https://github.com/WGrape/posture/pull/26/files) 的PR提交

## <span id="3">3、如何理解项目</span>
在[以正确的姿势编写和管理代码](https://github.com/WGrape/Blog/issues/260)文档中详细介绍了本项目产生的背景原因，和功能作用。或许它可以帮助你了解本项目

## <span id="4">4、代码提交规约</span>
在提交代码前，至少需要做到以下几项

### <span id="41">(1) 单测通过</span>
如果有单元测试，则整个项目的单元测试必须通过

### <span id="42">(2) commit message 规范</span>
规范使用如```fix: 修复commit日志记录的bug```这种组合的提交规范
- fix: 修复bug相关
- doc: 文档完善相关
- refactor: 重大功能重构
- feat: 新功能、新组件等
- perf: 性能优化提升相关
- test: 新增测试或测试相关的修改
- style: 调整代码格式等对功能和性能无较大影响的修改
- chore: 构建过程或辅助工具的变动，如dockerfile的修改

### <span id="43">(3) 分支管理</span>
代码统一先提交合至```test```分支，在review通过后，会根据实际情况选择合入```main```分支或者```release```分支。如果是非重要修改，则只会合入```main```分支。

- ```main``` ：主分支
- ```test``` ：测试分支
- ```release``` ：版本发布专用分支，合入```release```分支后会自动打包发布release

### <span id="43">(4) 提交内容注释</span>
对于重要代码部分，请以评论的方式写清楚原因，可以参考 [fix: 修复push钩子中对特定分支名截取的bug](https://github.com/WGrape/posture/pull/23#pullrequestreview-1110452197)

## <span id="5">5、打包Release</span>
本项目设置了自动release发布，不需要手动打包处理。

## <span id="6">6、项目数据</span>
<a href="https://starchart.cc/WGrape/esupdater"><img src="https://starchart.cc/WGrape/esupdater.svg" width="700"></a>