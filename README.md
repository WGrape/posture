<p align="center">
<img width="321" alt="image" src="https://user-images.githubusercontent.com/35942268/190055195-bb9ab05a-1922-400e-b9cd-ff536351c323.png">
</p>

<div align="center">
<p>A powerful and efficient project development management tool</p>
<p>一个强大且高效的项目开发管理工具</p>
</div>

<p align="center">
    <img src="https://img.shields.io/badge/Language-Shell-blue.svg">
    <img src="https://img.shields.io/badge/Release-1.0.0-blue.svg">
    <img src="https://img.shields.io/badge/Document-中文-orange.svg">
    <img src="https://img.shields.io/badge/License-MIT-green.svg">   
</p>

# 一、项目介绍
posture是一个强大且高效的项目开发管理工具，让你快速开始以正确的"姿势"编写和管理代码，解决团队开发时代码百花齐放、Git误操作等一系列疑难问题。

> 关于更多背景细节请阅读文章[《以正确的姿势编写和管理代码》](https://github.com/WGrape/Blog/issues/260)

# 二、快速安装

你可以先通过以下命令完成下载安装操作，如果出现```install successfully```提示，则说明安装成功。

```bash
git clone https://github.com/WGrape/posture.git && cd posture && bash ./install.sh
```

![image](https://user-images.githubusercontent.com/35942268/190054375-4280aead-411a-404c-b068-c71da4241528.png)

在安装成功后，会在您的```~/.bash_profile```文件中写入如下内容，确保您可以开始使用posture工具。

```bash
# Here is the configurations of posture
export POSTUREPATH={{the path of posture installation}}
export PATH=$PATH:${POSTUREPATH}
```

# 三、如何使用

## 1、调整代码格式
在团队开发前，需要先统一调整代码规范。工具支持```go/php/java```三种语言的代码规范设置，在```config/config.sh```文件中配置```lang```项目语言，然后切至你的项目目录下，再使用如下命令即可。

```bash
posture adjust
```

## 2、设置全局钩子
通过如下命令即可设置全局钩子，这样无论在哪个项目下，在使用```git checkout/git commit/git push```等命令时，钩子都会生效。

```bash
posture sethook
```

### (1) checkout钩子
当使用```git checkout```时，会自动执行checkout钩子，如下图所示。

<img width="680" alt="image" src="https://user-images.githubusercontent.com/35942268/189962874-9c6a3bba-d573-41a2-af3e-3594d4be2297.png">

### (2) pull钩子
在使用```git pull```时，会自动执行pull钩子（由post-merge钩子实现），如下图所示。

<img src="https://user-images.githubusercontent.com/35942268/190092067-4de64421-39c0-45fb-be53-b2cace7a5d66.png" width="500">

### (3) commit钩子
当使用```git commit```时，会自动执行commit钩子，如下图所示。

<img width="800" alt="image" src="https://user-images.githubusercontent.com/35942268/189961812-86357a08-96d9-44d8-848c-557cb35cf2c9.png">

如果在主分支（main/master）直接编辑提交代码，会出现如下报错。

<img width="800" alt="image" src="https://user-images.githubusercontent.com/35942268/190095654-565a82c1-455e-403d-8e56-adb8c7685b7c.png">

### (4) push钩子
当使用```git push```时，会自动执行push钩子，如下图所示。

<img width="800" alt="image" src="https://user-images.githubusercontent.com/35942268/189962394-397e9ab5-a523-405d-9d9e-3eaea0d0d706.png">

如果提交了与本地不一致的分支，会出现如下报错。

<img width="800" alt="image" src="https://user-images.githubusercontent.com/35942268/189963583-08a02a8d-b04e-401e-aed3-56c88e6ab619.png">

## 四、卸载更新

### 1、卸载应用
如果需要卸载，在执行完以下命令后，手动删除```$POSTUREPATH```目录即可。

```bash
cd $POSTUREPATH && bash ./uninstall.sh
```

![image](https://user-images.githubusercontent.com/35942268/190053831-7310bffb-3fb2-4232-adbc-2e3871f08a4f.png)

### 2、版本更新
为保证您的良好使用体验，建议使用最新版的posture工具，执行以下命令即可完成更新。

```bash
posture update
```

![image](https://user-images.githubusercontent.com/35942268/190094229-4617b499-458c-4ced-a1b8-20dd0ffc345d.png)

## 五、项目贡献

<img src="https://contrib.rocks/image?repo=wgrape/cimanager" >
