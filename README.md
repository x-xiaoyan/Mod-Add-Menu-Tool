# MAMT (Mod Add Menu Tool)
### MOD菜单添加工具

***更新至v1.2版本***    
图标和文本图片进行了拆分

## 目录
- [使用说明](#使用说明)
- [常见问题](#常见问题)
- [config配置](#config配置)
- [进阶玩法](#进阶玩法)

## 使用说明
### 1\. 打开应用，界面如下

![打开应用](images/pic1.png?t=1765083965196)   


### 2\. 点击选择目录，导入要添加菜单的MOD目录（文件夹），存在UIBlock.ini时会弹出是否加载已有配置的对话框     

如果点击确认，会加载UIBlock.ini中的已有配置     

如果点击取消，会加载MOD目录中的所有ini文件中的快捷键配置     

![弹出加载已有配置的对话框](images/pic2.png?t=1765083965196)       

加载已有配置：

![加载已有配置](images/pic3.png?t=1765083965196)    

加载默认配置：

![加载默认配置](images/pic4.png?t=1765083965196)    

### 3\. 设置按钮内容，点击选中按钮调整对应按钮内容     

左侧为按钮对应代码区域：一般自动生成了内容，不需要修改    

中间为按钮操作区域：点击选中按钮；左键可拖动按钮调整顺序，按钮为选中状态时，右键点击为删除按钮    

右侧为图标列表区域：点击图标可以将中间区域选中的按钮修改为对应图标；   

拖动调整按钮顺序：

![拖动按钮调整顺序](images/pic5.png?t=1765083965196)

点击文本内容输入修改文本

![输入修改文本](images/pic6.png?t=1765083965196)

### 4\. 点击生成菜单，完成时弹出是否打开文件夹的对话框     

![弹出打开文件夹对话框](images/pic7.png?t=1765083965196)    

### 5\. 点击确认时，自动打开MOD目录     
 
![打开MOD目录](images/pic8.png?t=1765083965196)    

## 常见问题    

### 1. MAMT生成菜单后产生内容错乱
可能是因为不同ini内容存在重名问题，因为MAMT是强行将应用文件列表中的所有文件都添加了同一个namespace，也就是等于所有ini内容到了同一个ini运行；同时也请避免namespace重名，这就相当于ini文件名重名    

解决方案：    
1.尝试修改重名内容    
2.或者只添加一个ini文件，删除应用文件列表中不重要的其他ini文件    

### 2. MAMT生成菜单后点击按钮切换不正确
可能是因为原快捷键切换内容并不规范，因为MAMT只能生成连续变化的切换内容：    
✅️正确格式例如：0,1,2,3或者2,3,4（更建议从0开始）    
❌️错误格式例如：0,2,3或者0,1,1,0    

解决方案：尝试修改原切换快捷键内容使其达成规范

## config配置    

***注意：安装和更新MAMT时将会删除config文件夹中的UI内容，如果有修改记得提前备份！！！***     

配置文件在应用根目录的config目录中结构如下：
```
├─ config  | 配置目录
│ ├─ UIconfig.ini | UI代码文件
│ └─ res | UI资源文件夹
│   ├─ icons | UI按钮图标文件夹
│   └─ ...
└─ ...
```

***一般不需要配置config内容，修改操作应用会自动完成，如果你有更多需求可以看详细教学***     

详细UI代码配置教学看这里： [UIConfig.md](UIConfig.md)    

提供了4套参考主题：

pink:  [UITheme/new/pink](UITheme/new/pink)    

![pink](UITheme/new/pink/preview.png?t=1765083965196)    

blue:  [UITheme/new/blue](UITheme/new/blue)    

![blue](UITheme/new/blue/preview.png?t=1765083965196)      

dark:  [UITheme/new/dark](UITheme/new/dark)    

![dark](UITheme/new/dark/preview.png?t=1765083965196)   

retro（怀旧主题）:  [UITheme/new/retro](UITheme/new/retro)    

![retro](UITheme/new/retro/preview.png?t=1765083965196)    

旧版本参考主题看这里：[UITheme/v1.1](UITheme/v1.1)    

## 进阶玩法

***注意：请尽量不要修改注释中的内容***

在进行进阶玩法前我们需要先了解MAMT各操作对文件都做了什么：

### 读取ini

首先选择目录后MAMT会读取MOD目录中所有除DISABLED开头的.ini文件

如果存在UIBlock.ini会询问用户是否加载其中内容

如果选择确认：

MAMT就会读取UIBlock.ini文件中\[CommandListSetButtonContent\]中的内容，解析加载到应用中完成读取按钮功能和图标配置的操作

如果选择取消：

MAMT就将从MOD目录中读取到的所有文件路径添加到应用文件列表（先会剔除掉UIBlock.ini文件），同时搜索文件列表中所有文件中的快捷键内容，解析加载到应用数据中，同时会对比旧UI数据，如果有则会加载，如果没有则会默认设置所有图标为图标列表中第一个图标，所有文本则会默认为对应图片名

### 写入ini

点击生成菜单按钮后，先会判断文件列表中是否有UIBlock.ini文件

如果有：

MAMT会先读取应用config路径下的UIConfig.ini文件内容，

添加 namespace = 应用设置的内容或MOD目录路径，

替换 global \$Button_amount = 应用中的按钮总数，

替换 global \$Button_horizontal_max = 应用中的横向最大按钮数，

替换 ;添加按钮 至 \$Button_number = 0 中的内容为按钮总数个对应个的run = CommandListAddButton，

替换 \[CommandListSetButtonContent\] 中的所有内容为应用解析对应的按钮数据，

替换 ;引入按钮图标资源 至 下一个非空内容中的所有内容为\[ResourceButton_图标文件名\]filename = res/icons/图标文件名.文件类型，

对比旧的UIBlock.ini文件中的内容和修改后的内容是否一致，一致则不做文件操作，否则备份旧的UIBlock.ini文件，将修改后的内容写入新的UIBlock.ini文件；

以下为有和没有都会进行的操作：

MAMT会先读取应用中文件列表下的所有ini文件，

添加或替换 namespace = 应用设置的内容或MOD目录路径，

添加 \$active = 1 到搜索到的第一个含有hash=......vb2=......内容的section最后，

删除：如果ini中存在以下旧版本UI内容将直接删除此段落后的所有内容    
; UI Block    
; By: Comilarex    
; Modifier: 夕小言    

对比旧的文件中的内容和修改后的内容是否一致，一致则不做文件操作，否则备份旧的文件，将修改后的内容写入新的对应文件；

### res文件操作

首先打开应用时会读取一次config/res/icons/目录下的所有图片文件，加入应用图标列表中；

其次应用中有个刷新按钮，点击也会重新读取一次config/res/icons/目录下的所有图片文件，加入应用图标列表中；

点击生成菜单按钮后：

所有ini写入操作后，会复制res文件夹除icons文件夹外所有的文件到MOD目录下，

再读取应用中的按钮图标数据和文本数据，生成合并后的新图标文件到MOD目录中res/icons/文件夹下

***那么知道MAMT的所有文件操作后，就可以进行一些进阶行为了***

例如：可以修改res/icons文件夹中的所有图标为你想要的任意图标，MAMT会自动读取，甚至res/文件夹下除了icons文件夹外的所有文件都可以修改为你想要的图片文件

再例如：修改config/UIConfig.ini文件中的内容，自行设计一个UI代码，只需要保留\[CommandListSetButtonContent\] （既按钮功能和图标块）中的格式，UI样式都可以自定义








































