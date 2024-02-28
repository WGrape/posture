<p align="center">
<img width="321" alt="image" src="https://user-images.githubusercontent.com/35942268/190055195-bb9ab05a-1922-400e-b9cd-ff536351c323.png">
</p>

<div align="center">
<p>A lightweight and extensible tool for supervising and correcting of development posture</p>
<p>一个轻量可扩展的开发姿势监督与矫正工具</p>
</div>

<p align="center">
    <a href="https://www.oscs1024.com/project/oscs/WGrape/posture?ref=badge_small" alt="OSCS Status"><img src="https://www.oscs1024.com/platform/badge/WGrape/posture.svg?size=small"/></a>
    <img src="https://img.shields.io/badge/language-Shell-blue.svg">
    <img alt="GitHub release (latest by date)" src="https://img.shields.io/github/v/release/wgrape/posture">
    <img src="https://img.shields.io/github/repo-size/wgrape/posture">
    <!--<img src="https://img.shields.io/github/downloads/wgrape/posture/total">-->
    <img src="https://img.shields.io/badge/document-中文-orange.svg">
    <img src="https://img.shields.io/badge/license-MIT-green.svg">   
</p>

<details>
  <summary>目录</summary>

- [一、项目介绍](#1)
- [二、快速安装](#2)
- [三、如何使用](#3)
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [1、矫正开发姿势](#31)
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [(1) git配置](#311)
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [(2) 代码规范](#312)
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [2、设置全局钩子](#32)
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [(1) checkout钩子](#321)
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [(2) pull钩子](#322)
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [(3) commit钩子](#323)
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [(4) push钩子](#324)
- [四、卸载更新](#4)
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [1、卸载应用](#41)
- &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; [2、版本更新](#42)
- [五、项目贡献](#5)

</details>

# <span id="1">一、项目介绍</span>
posture是一个轻量可扩展的开发姿势监督与矫正工具，让您快速开始以正确的规范编写和管理代码，解决团队开发时代码百花齐放、Git误操作等一系列开发中的"姿势不正确"问题。

<!-- > 关于更多背景细节请阅读文章[《以正确的姿势编写和管理代码》](https://github.com/WGrape/Blog/issues/260) -->

# <span id="2">二、快速安装</span>

您可以先通过以下命令完成下载安装操作，如果出现```install successfully```提示，则说明安装成功。这时使用```posture```或```posture help```命令都可以查看使用帮助。

```bash
git clone https://github.com/WGrape/posture.git && cd posture && bash ./install.sh
```

<details>
  <summary>查看使用示例</summary>
  <h4>安装成功</h4>
  <img width="500" alt="image" src="https://github.com/WGrape/posture/assets/35942268/0827c1a8-ec41-4275-b324-517c6f450e86">
  <h4>查看命令帮助</h4>
  <img width="500" alt="image" src="https://github.com/WGrape/posture/assets/35942268/101cbd76-24f1-45f3-b92d-0f209458d902">
</details>

在安装成功后，会在您的```~/.bash_profile```文件中写入如下内容，自动创建```$POSTUREPATH```变量并添加到```$PATH```变量中，以确保您可以开始使用posture工具。

```bash
# Here is the configurations of posture
export POSTUREPATH={{the path of posture installation}}
export PATH=$PATH:${POSTUREPATH}
```

# <span id="3">三、如何使用</span>

## <span id="31">1、矫正开发姿势</span>
在团队开发中的任何阶段，都可以使用如下命令快速矫正git配置、代码规范等开发姿势，统一团队成员的开发环境。

```bash
posture adjust
```

### <span id="311">(1) git配置
在执行完```adjust```命令时，```posture```会自动执行以下操作，确保git配置保持一致。

```bash
# 忽略文件权限
git config --global --add core.fileMode false 
```

### <span id="312">(2) 代码规范

工具目前支持```go/java/js/php/shell```五种语言的代码规范设置，在```config/config.sh```文件中配置```lang```项目语言即可，默认为```go```语言。

在执行完```adjust```命令后，在您的项目根目录下，会生成一个```.editorconfig```文件，它会为您的IDE设置统一的代码规范。

## <span id="32">2、设置全局钩子</span>
在开发前，请使用如下命令设置全局钩子。这样无论在哪个项目下，当使用git命令时，相应的钩子都会自动工作，实时监督我们在git流程中的操作，一旦出现姿势错误的情况，就会即时发出提醒并中断操作。

```bash
posture hook
```

当需要取消全局钩子时, 执行```unhook```命令即可

```bash
posture unhook
```

### <span id="321">(1) checkout钩子</span>
当使用```git checkout/git switch```命令时，会自动执行checkout钩子，如下图所示。

<details>
  <summary>查看使用示例</summary>
<img width="680" alt="image" src="https://user-images.githubusercontent.com/35942268/190693301-44347c94-2c4f-4d8a-bfcc-2b917ae2d41f.png">
</details>

### <span id="322">(2) pull钩子</span>
在使用```git pull```命令时，会自动执行pull钩子（由post-merge钩子实现），如下图所示。

<details>
  <summary>查看使用示例</summary>
  <img width="800" src="https://user-images.githubusercontent.com/35942268/190868050-13348f58-5abe-4da1-b714-f1a3784a6f0c.png">
</details>

### <span id="323">(3) commit钩子</span>
当使用```git commit```命令时，会自动执行commit钩子，如下图所示。

<details>
  <summary>查看使用示例</summary>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/35942268/189961812-86357a08-96d9-44d8-848c-557cb35cf2c9.png">
</details>

如果在主分支（main/master）直接编辑提交代码，会出现如下提醒并中断操作。

<details>
  <summary>查看使用示例</summary>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/35942268/190095654-565a82c1-455e-403d-8e56-adb8c7685b7c.png">
</details>

提交成功后会触发```post-commit```钩子，自动在```$POSTUREPATH/storage/```目录下生成一条以天为单位的```commit.${day}.log```commit日志文件，以实现每日工作统计等功能。

```text
# 日志内容如下
2021-08-17/10:51:44 posture wgrape test 3exxxxx feat:新增钉钉WebHook
2021-08-17/10:56:44 posture wgrape test 3exxxxx feat:新增commit日志记录功能

# 每行由6部分组成
-------------------------------------------------------------
| date | project | user | branch | commitId | commitMessage |
-------------------------------------------------------------
```

### <span id="324">(4) push钩子</span>
当使用```git push```命令时，会自动执行push钩子，如下图所示。

<details>
  <summary>查看使用示例</summary>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/35942268/189962394-397e9ab5-a523-405d-9d9e-3eaea0d0d706.png">
</details>

如果提交了与本地不一致的分支，会出现如下提醒并中断操作。

<details>
  <summary>查看使用示例</summary>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/35942268/189963583-08a02a8d-b04e-401e-aed3-56c88e6ab619.png">
</details>

# <span id="4">四、卸载更新</span>

## <span id="41">1、卸载应用</span>
如果需要卸载，在执行完以下命令后，手动删除```$POSTUREPATH```目录即可。

```bash
cd $POSTUREPATH && bash ./uninstall.sh
```

<details>
  <summary>查看使用示例</summary>
  <img src="https://user-images.githubusercontent.com/35942268/190053831-7310bffb-3fb2-4232-adbc-2e3871f08a4f.png">
</details>

## <span id="42">2、版本更新</span>
为保证您的良好使用体验，建议使用最新版的posture工具，执行以下命令即可完成更新。

```bash
posture update
```

<details>
  <summary>查看使用示例</summary>
  <img src="https://user-images.githubusercontent.com/35942268/190094229-4617b499-458c-4ced-a1b8-20dd0ffc345d.png">
</details>

# <span id="5">五、项目贡献</span>
如果您觉得项目有用，欢迎star ！您还可以参考[如何贡献](./.github/CONTRIBUTING.md)文档来共同参与此项目，欢迎加入 ！

<img src="https://contrib.rocks/image?repo=wgrape/cimanager" >
