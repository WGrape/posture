# posture
A powerful and efficient project development management tool / 一个强大且高效的项目开发管理工具

# 一、项目介绍
posture是一个强大且高效的项目开发管理工具，让你快速开始以正确的"姿势"编写和管理代码，解决团队开发时代码百花齐放、Git误操作等一系列疑难问题。

> 关于更多背景细节请阅读文章[《以正确的姿势编写和管理代码》](https://github.com/WGrape/Blog/issues/260)

# 三、下载安装

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

# 四、如何使用

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

### (2) commit钩子
当使用```git commit```时，会自动执行commit钩子，如下图所示。

<img width="800" alt="image" src="https://user-images.githubusercontent.com/35942268/189961812-86357a08-96d9-44d8-848c-557cb35cf2c9.png">

### (3) push钩子
当使用```git push```时，会自动执行push钩子，如下图所示。

<img width="800" alt="image" src="https://user-images.githubusercontent.com/35942268/189962394-397e9ab5-a523-405d-9d9e-3eaea0d0d706.png">

如果提交了与本地不一致的分支，会出现如下报错。

<img width="800" alt="image" src="https://user-images.githubusercontent.com/35942268/189963583-08a02a8d-b04e-401e-aed3-56c88e6ab619.png">

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
