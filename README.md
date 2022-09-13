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

项目支持```go/php/java```三种语言，在```config/config.sh```文件中配置```lang```项目语言即可

## 四、如何使用

### 1、调整姿势
如果需要解决代码不规范的问题，先使用命令```cd xxx```切至你的项目目录下，然后再使用如下命令即可。

```bash
posture adjust
```

### 2、全局钩子
通过如下命令即可设置全局钩子，这样无论在哪个项目下，在使用```git checkout/git commit/git push```等命令时，钩子都会生效。

```bash
posture sethook
```
