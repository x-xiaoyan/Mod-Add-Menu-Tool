# MAMT (Mod Add Menu Tool)
### MOD菜单添加工具

***更新至v1.2版本***    
图标和文本图片进行了拆分*    
新增自定义字体和大小等样式功能！！！    
新增生成菜单时自动查询重复命名，并修改命名添加_Repeat后缀    
新增单文件选择功能    
新增退出自动保存应用设置状态     

## 目录
- [使用说明](#使用说明)
- [常见问题](#常见问题)
- [config配置](#config配置)
- [进阶内容](#进阶内容)
- [声明](#声明)

## 使用说明
### 1\. 打开应用，界面如下

![打开应用](images/pic1.png?raw=true)   

### 2\. 点击选择目录/文件，导入要添加菜单的MOD目录/主ini文件，存在UIBlock内容时会弹出是否加载已有配置的对话框     

* #### 选择目录    

如果点击确认，会加载UIBlock.ini中的已有配置     

如果点击取消，会加载MOD目录中的所有ini文件中的快捷键配置     

![弹出加载已有配置的对话框](images/pic2.png?raw=true)       

加载已有配置：

![加载已有配置](images/pic3.png?raw=true)    

加载默认配置：

![加载默认配置](images/pic4.png?raw=true)    

* #### 选择文件

流程同上  

![选择文件](images/pic5.png?raw=true)    


### 3\. 设置菜单内容，点击选中按钮调整对应按钮内容     

应用界面功能分布如下表：

<table>
  <tr>
    <td  align="center">
      <br>
      <p><strong>选择按钮</strong></p>
      <ol align="left">
        <li>
          点击选择要导入的MOD目录/文件;
        </li>
        <li>
          应用会自动添加进文件列表中;
        </li>
        </li>
      </ol>
      <br>
    </td>
    <td colspan="2" align="center">
      <br>
      <p><strong>文件列表区域：</strong></p>
      <ol align="left">
        <li>
          点击文件路径可以打开文件;
        </li>
        <li>
          点击×可以移出文件列表（ini对应的按钮也会从菜单中移出）;
        </li>
        </li>
      </ol>
      <br>
    </td>
  </tr>
  <tr>
    <td align="center">
      <br>
      <p><strong>按钮代码区域：</strong></p>
      <ol align="left">
        <li>
          上面为按钮对应的原快捷键信息
        </li>
        <li>
          下面为应用自动生成的按钮对应的切换功能代码，一般不需要修改;
        </li>
      </ol>
      <br>
    </td>
    <td align="center">
      <br>
      <p><strong>菜单区域：</strong></p>
      <ol align="left">
        <li>
          点击选中按钮；左键可拖动按钮调整顺序;
        </li>
        <li>
          按钮为选中状态时，右键点击为删除按钮;
        </li>
        <li>
          点击按钮文本，可以修改文本内容；
        </li>
        <li>
          取消勾选字体栏，可以关闭文本显示；修改字体栏对应内容可以修改按钮文本字体;
        </li>
      <ol>
      <br>  
    </td>
    <td align="center">
      <br>
      <p><strong>图标列表区域：</strong></p> 
      <ol align="left">
        <li>
          点击图标可以将中间区域选中的按钮修改为对应图标；
        </li>
        <li>
          点击顶部刷新图标，可以重新读取本地图标文件；
        </li>
        <li>
          点击底部打开图标文件夹，可以打开应用加载的图标文件夹；
        </li>
      <ol>
      <br>
    </td>
  </tr>
</table>

拖动调整按钮顺序：

![拖动按钮调整顺序](images/pic6.png?raw=true)

点击文本内容输入修改文本：

![输入修改文本](images/pic7.png?raw=true)

操作字体栏可控制文本是否显示，以及修改字体、大小、粗细等。

修改字体：

![修改字体](images/pic8.png?raw=true)

关闭按钮文本：

![不显示按钮文本](images/pic9.png?raw=true)


### 4\. 点击生成菜单，完成时弹出是否打开文件夹的对话框     

![弹出打开文件夹对话框](images/pic10.png?raw=true)  


## 常见问题    

### 1. MAMT生成菜单后产生内容错乱
可能是因为不同ini内容存在重名问题，因为MAMT是强行将应用文件列表中的所有文件都添加了同一个namespace，也就是等于所有ini内容到了同一个ini运行；同时也请避免namespace重名，这就相当于ini文件名重名    

解决方案：    
1.尝试修改重名内容    
2.或者只添加一个ini文件，删除应用文件列表中不重要的其他ini文件    
3.v1.2.2及之后版本已添加自动修改重复命名内容的功能，自动添加_Reapeat后缀，如有问题可自行在文件中搜索后缀名查找修改

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
│   ├─ icons | UI按钮图标图片文件夹
│   └─ ...
└─ ...
```

***一般不需要配置config内容，修改操作应用会自动完成，如果你有更多需求可以看详细教学***     

 [UI代码配置教学](UIConfig.md)    

提供了4套参考主题（直接替换配置目录config/res文件夹中的配置文件）：    

<table>
  <tr>
    <th>
      pink
    </th>
    <th>
      blue
    </th>
    <th>
      dark
    </th>
    <th>
      retro（怀旧主题）
    </th>
  </tr>
  <tr>
    <td align="center">
      <img src="UITheme/new/pink/preview.png?raw=true" alt="pink">
    </td>
    <td align="center">
      <img src="UITheme/new/blue/preview.png?raw=true" alt="blue">
    </td>
    <td align="center">
      <img src="UITheme/new/dark/preview.png?raw=true" alt="dark">
    </td>
    <td align="center">
      <img src="UITheme/new/retro/preview.png?raw=true" alt="retro">
    </td>
  </tr>
  <tr>
    <td align="center">
      <a href="UITheme/new/pink">UITheme/new/pink</a>
    </td align="center">
    <td align="center">
      <a href="UITheme/new/blue">UITheme/new/blue</a>
    </td>
    <td align="center">
      <a href="UITheme/new/dark">UITheme/new/dark</a>
    </td>
    <td align="center">
      <a href="UITheme/new/retro">UITheme/new/retro</a>
    </td>
  </tr>
</table>

旧版本参考主题看这里：    
v1.1版本：[UITheme/v1.1](UITheme/v1.1)    

## 进阶内容

***在进阶玩法前我们需要先了解MAMT各操作对文件都做了什么：***    

### 读取ini

首先选择目录后MAMT会读取MOD目录中所有除DISABLED开头的.ini文件     

如果存在UIBlock.ini会询问用户是否加载其中内容    

如果选择确认：    

MAMT就会读取UIBlock.ini文件中\[CommandListSetButtonContent\]中的内容，解析加载到应用中完成读取按钮功能和图标配置的操作    

如果选择取消：    

MAMT就将从MOD目录中读取到的所有文件路径添加到应用文件列表（先会剔除掉UIBlock.ini文件），同时搜索文件列表中所有文件中的快捷键内容，解析加载到应用数据中，同时会对比旧UI数据，如果有则会加载，如果没有则会默认设置所有图标为图标列表中第一个图标，所有文本则会默认为对应图片名    

同理选择文件时会读取选择文件中\[CommandListSetButtonContent\]中的内容，解析加载到应用中完成读取按钮功能和图标配置的操作    

### 写入ini

点击生成菜单按钮后，    

MAMT会先读取应用中文件列表里的所有ini文件，    

添加或替换/删除 namespace = 应用设置的内容或MOD目录路径，（选择文件模式时，将会删除选择文件中的namespace内容，文件列表中有UIBlock.ini将会删除UIBlock.ini文件）    
```
namespace = E:\GameTools\XXMI\ZZMI\Mods\character\ellen\艾莲-FES时装\BassistEllenFull
```

添加 \$active = 1 到搜索到的第一个含有hash=......vb2=......内容的Section最后，    
```
[TextureOverrideEllenBodyBlend]
hash = ed9cb852
handling = skip
vb2 = ResourceEllenBodyBlend
if DRAW_TYPE == 1
	vb0 = ResourceEllenBodyPosition
	draw = 104662, 0
endif
$active = 1
```

查询 是否存在\[Constants\]和\[Present\]之外的Section重名，以及除global $active以外的全局变量重名，如果重名则在原名上添加_Reapeat后缀，      
```
global persist $swapkey0_Repeat = 0
...
[ResourceDiffuse_Repeat]
filename = Diffuse.dds
```

删除：如果ini中存在以下旧版本UI内容将直接删除此段落后的所有内容    
```
; UI Block
; By: Comilarex
; Modifier: 夕小言
```

删除：选择目录模式时会删除如下段落间已存在的原菜单内容（选择文件模式时，为替换中间的所有内容为新菜单内容）    
```
;MARK:UIBlockStart ----------------------------------------------------------
...    
;UIBlockEnd ----------------------------------------------------------
```

对比旧的文件中的内容和修改后的内容是否一致，一致则不做文件操作，否则备份旧的文件，将修改后的内容写入新的对应文件；    

之后MAMT会读取应用config路径下的UIConfig.ini文件内容，    

添加 namespace = 应用设置的内容或MOD目录路径，（选择文件模式时，将不会添加namespance）    
```
[TextureOverride_VB_a5eac582_上身_Position]
hash = e0269fbf
vb0 = Resourcea5eac582Position
vb2 = Resourcea5eac582Blend
handling = skip
draw = 14461, 0
$active = 1
```

替换 global \$Button_amount = 应用中的按钮总数，    
```
;设置按钮总数
global $Button_amount = 4
```

替换 global \$Button_horizontal_max = 应用中的横向最大按钮数，    
```
;设置横向最大按钮数
global $Button_horizontal_max = 10
```

替换 global \$Button_text_show = 应用中是显示文本（否勾选字体内容），    
```
global $Button_text_show = 1
```

替换 global \$Button_text_ratio = 根据应用中设置的字体大小计算的字体高度比例，    
```
global $Button_text_ratio = 0.4
```

替换 ;添加按钮 至 \$Button_number = 0 中的内容为按钮总数个对应个的run = CommandListAddButton，    
```
;添加按钮
run = CommandListAddButton
run = CommandListAddButton
...
$Button_number = 0
```

替换 \[CommandListSetButtonContent\] 中的所有内容为应用解析对应的按钮数据（$Button_SetText中内容只在勾选字体时才添加），    
```
[CommandListSetButtonContent]
if $Button_number == 1
    ;设置按钮功能
    if $Button_SetCondition
        if $earring < 2
            $earring = $earring + 1
        else
            $earring = 1
        endif
    endif
    ;设置按钮图标：Earrings
    if $Button_SetIcon
        ps-t100 = ResourceButton_Icon1
    endif
    ;按钮文本：耳环
    if $Button_SetText
        ps-t100 = ResourceButton_Text1
    endif
    ...
endif
```

替换 ;引入按钮图标资源 至 下一个非空内容中的所有内容为\[ResourceButton_图片文件名\]filename = res/icons/图片文件名.文件类型，    
```
;引入按钮图标资源
[ResourceButton_Icon1]
filename = res/icons/Icon1.png
...
```

如果勾选字体将同时添加 ;引入按钮文本资源 至 下一个非空内容中的所有内容为\[ResourceButton_图片文件名\]filename = res/texts/图片文件名.文件类型，    
```
;引入按钮文本资源
[ResourceButton_Text1]
filename = res/texts/Text1.png
...
```

对比旧的UIBlock.ini文件中的内容和修改后的内容是否一致，一致则不做文件操作，否则备份旧的UIBlock.ini文件，将修改后的内容写入新的UIBlock.ini文件；    

### res文件操作

首先打开应用时会读取一次应用根目录config/res/icons/目录下的所有图片文件，加入应用图标列表中；

其次应用中有个刷新按钮，点击也会重新读取一次config/res/icons/目录下的所有图片文件，加入应用图标列表中；

点击生成菜单按钮后：

所有ini写入操作后，会复制应用根目录下config/res文件夹除icons文件夹外所有的文件到MOD目录/res下，

然后根据应用中的按钮图标数据和文本数据，

复制对应图标文件到MOD目录中res/icons/文件夹下

生成对应文本图片文件到MOD目录中res/texts/文件夹下

***那么知道MAMT的所有文件操作后，就可以进行一些进阶行为了***

例如：可以修改res/icons文件夹中的所有图标为你想要的任意图标，MAMT会自动读取，甚至res/文件夹下除了icons文件夹外的所有文件都可以修改为你想要的图片文件

再例如：修改config/UIConfig.ini文件中的内容，自行设计一个UI代码，只需要保留\[CommandListSetButtonContent\] （既按钮功能和图标及文本块）中的格式，UI样式都可以自定义，MAMT会自动生成\[CommandListSetButtonContent\]中的按钮内容

UI代码可以参考： [UI代码配置教学](UIConfig.md)    

***注意：请尽量不要修改注释中的内容***


## 声明

本软件仅用于学习交流，禁止用于商业用途，否则后果自负。








