# MAMT (Mod Add Menu Tool)
MOD菜单添加工具

## 目录
- [使用说明](#使用说明)
- [config配置](#config配置)
- [进阶玩法](#进阶玩法)

## 使用说明
### 1\. 打开应用，界面如下

![打开应用](/images/pic1.png)   


### 2\. 点击选择目录，导入要添加菜单的MOD目录（文件夹），存在UIBlock.ini时会弹出是否加载已有配置的对话框     

如果点击确认，会加载UIBlock.ini中的已有配置     

如果点击取消，会加载MOD目录中的所有ini文件中的快捷键配置     

![弹出加载已有配置的对话框](/images/pic2.png)       

加载已有配置：

![加载已有配置](/images/pic3.png)    

加载默认配置：

![加载默认配置](/images/pic4.png)    

### 3\. 设置按钮内容，点击选中按钮调整对应按钮内容     

左侧为按钮对应代码区域：一般自动生成了内容，不需要修改    

中间为按钮操作区域：点击选中按钮；左键可拖动按钮调整顺序，按钮为选中状态时，右键点击为删除按钮    

右侧为图标列表区域：点击图标可以将中间区域选中的按钮修改为对应图标；   

![拖动按钮调整顺序](/images/pic5.png)

### 4\. 点击生成菜单，完成时弹出是否打开文件夹的对话框     

![弹出打开文件夹对话框](/images/pic6.png)    

### 5\. 点击确认时，自动打开MOD目录     
 
![打开MOD目录](/images/pic7.png)    


## config配置
一般不需要配置config内容，如果你有更多需求可以往下看

配置文件在应用根目录的config目录中结构如下：
```
├─ config  | 配置目录
│ ├─ UIconfig.ini | UI代码文件
│ └─ res | 资源文件夹
│   ├─ icons | 按钮图标文件夹
│   └─ ...
└─ ...
```


### UI代码配置说明：

#### 设置按钮：
```
;设置按钮总数
global $Button_amount = 4
;设置横向最大按钮数
global $Button_horizontal_max = 10
```
\$Button_amount为要设置的按钮总数

\$Button_horizontal_max为横向能显示的最大按钮数量，超出此数量的按钮会自动换行到下一行

#### 添加按钮：
```
;添加按钮
run = CommandListAddButton
run = CommandListAddButton
...
$Button_number = 0
```
CommandListAddButton为添加按钮

有多少个按钮就需要添加多少个run = CommandListAddButton

如上示例中为添加2个按钮

***注意：超出 \$Button_amount 数量的按钮不会显示，\$ Button_amount大于按钮数时，并不会显示\$Button_amount
数量的按钮，而是run = CommandListAddButton数的按钮，但依然会预留\$Button_amount数量的按钮空间***

#### 设置按钮内容：
```
[CommandListSetButtonContent]
if $Button_number == 1
	;设置按钮功能
	if $Button_SetCondition
		;示例 $hair = 0,1,2,3,4
		if $hair < 4
			$hair = $hair + 1
		else
			$hair = 0
		endif
	endif
	;设置按钮图标
	if $Button_SetIcon
		ps-t100 = ResourceButton_Hair
	endif
	....
endif
```
if  \$Button_number中为对应序号按钮的内容

if \$Button_SetCondition中为点击对应序号按钮执行的操作

if \$Button_SetIcon中为设置对应序号按钮的图标

如上示例中\$Button_number == 1中为按钮1的内容：
\$Button_SetCondition中为设置按钮1功能，每点击一次执行一次其中内容，示例中为切换变量\$hair从0→1→2→3→4，对应快捷键设置中的\$hair = 0,1,2,3,4

\$Button_SetIcon中为设置按钮1图标为ResourceButton_Hair

***注意：同时也需要设置[ResourceButton_Hair]引入资源***
```
;引入按钮图标资源
[ResourceButton_Hair]
filename = res/icons/Hair.png
```
对应MOD目录下res文件夹下icons文件夹中的Hair.png文件

#### 设置快捷键：
```
[KeyToggleUI]
condition = $ActiveCharacter
key = CTRL ALT
type = hold
$menu = 1

[KeyMouse]
condition = $menu
key = VK_LBUTTON
type = hold
$mouse_clicked = 1
$mouse_hold = 1
```

示例中为快捷键按住Ctrl+Alt呼出UI界面，鼠标左键点击切换

#### 设置\$ActiveCharacter：
```
;MARK:TextureOverrideVB----------------------------------------------------------
; a5eac582 ----------------------------
[TextureOverride_VB_a5eac582_上身_Position]
hash = e0269fbf
vb0 = Resourcea5eac582Position
vb2 = Resourcea5eac582Blend
handling = skip
draw = 14461, 0
$active = 1
$ActiveCharacter = 1
```
***注意：\$ActiveCharacter必须设置！！！***

设置\$ActiveCharacter的目的是对应角色在场时才能激活对应菜单，因为\$ActiveCharacter默认为0既非激活状态，如果不设置就算按住快捷键也不会显示菜单

需要像如上示例\$active一样在角色的某个hash内将\$ActiveCharacter设置为1

## 进阶玩法

***注意：请尽量不要修改注释中的内容***

先来说说MAMT各操作对文件都做了什么吧

### 读取ini

首先选择目录后MAMT会读取MOD目录中所有除DISABLED开头的.ini文件

如果存在UIBlock.ini会询问用户是否加载其中内容

如果选择确认：

MAMT就会读取UIBlock.ini文件中\[CommandListSetButtonContent\]中的内容，解析加载到应用中完成读取按钮功能和图标配置的操作

如果选择取消：

MAMT就将从MOD目录中读取到的所有文件路径添加到应用文件列表（先会剔除掉UIBlock.ini文件），同时搜索文件列表中所有文件中的快捷键内容，解析加载到应用数据中，同时会默认设置所有图标为图标列表中第一个图标

### 写入ini

点击生成菜单按钮后，先会判断文件列表中是否有UIBlock.ini文件

如果有：

MAMT会先读取应用config路径下的UIConfig.ini文件内容，

添加 namespace = 应用设置的内容或MOD目录路径，

替换 global \$Button_amount = 应用中的按钮总数，

替换 ;添加按钮 至 \$Button_number = 0 中的内容为按钮总数个对应个的run = CommandListAddButton，

替换 \[CommandListSetButtonContent\] 中的所有内容为应用解析对应的按钮数据，

替换 ;引入按钮图标资源 至 下一个非空内容中的所有内容为\[ResourceButton_图标文件名\]filename = res/icons/图标文件名.文件类型，

对比旧的UIBlock.ini文件中的内容和修改后的内容是否一致，一致则不做文件操作，否则备份旧的UIBlock.ini文件，将修改后的内容写入新的UIBlock.ini文件；

如果没有：

MAMT会先读取应用中文件列表下的所有ini文件，

添加或替换 namespace = 应用设置的内容或MOD目录路径，

添加 \$ActiveCharacter = 1 到搜索到的第一个 hash = ..... \$active = 1 之后，

对比旧的文件中的内容和修改后的内容是否一致，一致则不做文件操作，否则备份旧的文件，将修改后的内容写入新的对应文件

### res文件操作

首先打开应用时会读取一次config/res/icons/目录下的所有图片文件，加入应用图标列表中，

其次应用中有个刷新按钮，点击也会重新读取一次config/res/icons/目录下的所有图片文件，加入应用图标列表中

点击生成菜单按钮后，所有写入操作后，会复制res文件夹除icons文件夹外所有的文件到MOD目录下，再读取应用中的按钮图标数据，去重之后，将用到的所有图标路径对应路径下的图标文件，确认文件存在后，复制到MOD目录中res/icons/文件夹下

***那么知道MAMT的所有文件操作后，就可以进行一些进阶行为了***

例如：可以修改res/icons文件夹中的所有图标为你想要的任意图标，MAMT会自动读取，甚至res/文件夹下除了icons文件夹外的所有文件都可以修改为你想要的图标文件

再例如：修改config/UIConfig.ini文件中的内容，自行设计一个UI代码，只需要保留\[CommandListSetButtonContent\] （既按钮功能和图标块）中的格式，UI样式都可以自定义




