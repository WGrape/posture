# posture
The out of box tool for you to write and manage your code in the right posture / 一个可以让你以正确的姿势编写和管理代码的开箱即用工具

## 一、背景说明
在团队协作开发时，由于习惯不同，经常遇到代码"百花齐放"的情况。对于代码的管理，可能也只是基于```git```版本控制做一些仅限于```pull/commit/push```的简单操作，导致出现代码冲突、拉错分支、提交错分支、合并错误等一系列混乱的操作。这些问题都暴露出我们对代码的编写和管理方面很薄弱，不仅影响效率而且增加风险。

> 关于更多背景细节请阅读文章[《以正确的姿势编写和管理代码》](https://github.com/WGrape/Blog/issues/260)

## 二、项目介绍
本项目会提供一系列开箱可用的"工具"，让你快速开始以正确的"姿势"编写和管理代码。

## 三、下载安装

你可以先通过以下命令完成下载安装操作，如果出现```install successfully```提示，则说明安装成功。

```bash
git clone https://github.com/WGrape/posture.git && cd posture && bash ./install.sh
```

在安装成功后，会在您的```~/.bash_profile```文件中写入如下内容，这样您即可开始使用posture工具。

```bash
# Here is the configurations of posture
export POSTUREPATH={{the path of posture installation}}
export PATH=$PATH:${POSTUREPATH}
```

## 四、如何使用

### 1、调整规范
在团队开发前，需要先统一设置代码规范。工具支持```go/php/java```三种语言的代码规范设置，在```config/config.sh```文件中配置```lang```项目语言，然后切至你的项目目录下，再使用如下命令即可。

```bash
posture adjust
```

### 2、全局钩子
通过如下命令即可设置全局钩子，这样无论在哪个项目下，在使用```git checkout/git commit/git push```等命令时，钩子都会生效。

```bash
posture sethook
```

## 五、卸载更新

### 1、卸载应用
如果需要卸载，在执行完以下命令后，手动删除```$POSTUREPATH```目录即可。

```bash
cd $POSTUREPATH && bash ./uninstall.sh
```

### 2、版本更新
为保证您的良好使用体验，建议使用最新版的posture工具，执行以下命令即可完成更新。

```bash
posture update
```
