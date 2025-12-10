
# UI代码配置教学：

#### 设置按钮：
```
;设置按钮总数
global $Button_amount = 4
;设置横向最大按钮数
global $Button_horizontal_max = 10
;设置纵向最大按钮数
global $Button_vertical_max = 0
```
\$Button_amount为要设置的按钮总数

\$Button_horizontal_max为横向能显示的最大按钮数量，超出此数量的按钮会自动换行到下一行

\$Button_vertical_max为纵向能显示的最大按钮数量，超出此数量时会自动分页到下一页

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
	;设置按钮图标：Hair
	if $Button_SetIcon
		ps-t100 = ResourceButton_Icon1
	endif
	;按钮文本：发型
	...
endif
```
if  \$Button_number中为对应序号按钮的内容

if \$Button_SetCondition中为点击对应序号按钮执行的操作

if \$Button_SetIcon中为设置对应序号按钮的图标

如上示例中\$Button_number == 1中为按钮1的内容：
\$Button_SetCondition中为设置按钮1功能，每点击一次执行一次其中内容，示例中为切换变量\$hair从0→1→2→3→4，对应快捷键设置中的\$hair = 0,1,2,3,4

\$Button_SetIcon中为设置按钮1图标为ResourceButton_Icon1

***注意：同时也需要设置[ResourceButton_Icon1]引入资源***
```
;引入按钮图标资源
[ResourceButton_Icon1]
filename = res/icons/Icon1.png
```
对应MOD目录下res文件夹下icons文件夹中的Icon1.png文件

#### 设置快捷键：
```
[KeyToggleUI]
condition = $active
key = CTRL ALT
type = hold
$menu = 1
...
```

示例中为快捷键按住Ctrl+Alt呼出UI界面，鼠标左键点击切换

#### 设置\$active：
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
```
***注意：\$active必须设置！！！***

设置\$active的目的是对应角色在场时才能激活对应菜单，因为\$active默认为0既非激活状态，如果不设置就算按住快捷键也不会显示菜单

需要像如上示例在MOD本身ini文件中角色的某个hash内将\$active设置为1
