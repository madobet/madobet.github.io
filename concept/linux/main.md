# 历史和概述

当时 Unix 安装在 PDP-11 供大家使用。有一天大伙儿发现这家伙总是可以得到最高权限进入他们的账户。要知道，贝尔实验室个个都不是等闲之辈，这还能忍？于是若干人花了大把精力仔细分析了 Unix 的代码，找到后门，再重新编译整个 Unix，就在大家觉得从此安静美好的时候，却发现这家伙还是像"狗皮膏药"一样，又轻松的取得了他们的账户权限。为此大家郁闷不已。直到多年后 Ken 才道出了其中的原委，原来代码里面确实存在后门，不过不在 Unix 源码中，而是隐藏在编译器里，并且这个编译器在每次编译的时候，自动加上后门，不是这样就完了，它还会智能地销毁证据，导致几乎不可能找到后门。这也是 Ken 给我们的一个好的示例：计算机技术🐂🍺，就可以为所欲为吗？，sorry，计算机技术牛啤，是真的可以为所欲为！！！用 Linux之父的话来说就是 👇👇👇

在电脑世界中，你就是创世者，你对所发生的一切拥有最终的控制。如果你功力深厚，你可以是上帝――在一个较小的层面上。

<p style="text-align: right">-- Linus Benedict Torvalds</p>

Ref: http://blog.itpub.net/31545820/viewspace-2644148/

Linux 启动过程可分五阶段：
1. 内核引导
2. 运行 init
3. 系统初始化
4. 建立终端
5. 用户登录

init程序类型：
- SysV: init, CentOS 5之前, 配置文件： /etc/inittab。
- Upstart: init,CentOS 6, 配置文件： /etc/inittab, /etc/init/*.conf。
- Systemd： systemd, CentOS 7,配置文件： /usr/lib/systemd/system、 /etc/systemd/system。

# 推荐软件
- ParaView
- Bluefish (software)
- Emacs：一个能完整支持 Lisp 的操作系统（当然 Emacs 里装了 VIM（evil））
- Irssi：一个文本用户界面的IRC客户端程序，遵循GPL发布。 最初Irssi是为了运行在Unix-like操作系统上的，但也能运行于
- Microsoft Windows 上的 Cygwin。
  https://blog.hly0928.com/post/set-up-own-tiny-tiny-rss-service-using-hyperapp/#disqus_thread
  https://tt-rss.org/wiki/InstallationNotes
- Rocs 图论
- CDemu 光盘自动挂载（Arch Wiki）

homebrew 可安装 postgresql 但是安装 mariadb 会出问题,看样子是后者太大了，考虑 tt-rss 改用前者

Homebrew 安装的 zsh 似乎不能自动补全，是不是少了什么包

要怎么部署：
1. 根据屏幕的分辨率分别输出缩放因子
为什么要使用 linuxbrew，因为可以跨不同发行版，真正做到一次学习/部署，终身永久使用（当然，有些软件包还是需要系统级安装甚至自己编译）
为什么 linuxbrew 选择装在自己的home下而不是/home/linuxbrew，因为不一定所有的系统都能随时拿到管理员权限

写生成脚本的脚本时注意：
1. 如果两层 cat 嵌套，要写成 `\\\$`
2. 如果是“静态的”变量，尽量在元脚本层面就直接替换，减少在下层替换可能产生的错误

bdsup2sub 字幕转换工具
How to give a value to array: `v_SERVER_INFO=${_TELL_ME_ABOUT_MY_SERVERS_[@]}`
注意 cat 使用 heredoc 时会的两个特殊符号，分别是 `$` 和 `\` ，
如果想输出必须要转义成 `\$` `\\`，同时也要注意，输出一些配置文件时本身可能有特殊语法，从而本来想输出 `\$` `\\`，
结果 cat 以为是转义，输出到文件中只剩下了 `$` 和 `\`

Ref: https://www.nginx.com/resources/wiki/start/

Ref: https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls

For Debian user, read this first:
https://wiki.debian.org/Nginx/DirectoryStructure

关于网站根目录该放在哪里的问题：https://www.nginx.com/resources/wiki/start/topics/tutorials/config_pitfalls/#not-using-standard-document-root-locations

To easily display all the permissions on a path, you can use: namei -om /path/to/check

Minecraft 在 Arch Linux 上 forge 错误 无法启动：sudo archlinux-java set java-10-openjdk 切换成 10 或者 8 的 java就可以了，11以上太新了，启动器不兼容

移动硬盘通过 USB 3.0 连接 PC，把虚拟机部署在上面不好用，因为 USB 3.0 的速度不够
路由器无法承担 NAS 的重任，性能不够（内存和 CPU），同时其 USB 3.0 传输速度太低

设置两自启进程让服务器自动上报 IPv6 地址更新到我的 Conoha

Timeshift 可以通过增量快照来保护用户的系统数据，且可以按照日期恢复指定的快照，
类似于 Mac OS 中的 Time Machine 功能和 Windows 中的系统还原功能。

相关性比较大的脑区衡量-->带权中心度之类的？这几个脑区和哪几个相符合

```shell
./nnet-tools -n 'Aihara' -N 'brain-network' -P '0.15 0.4 10 2' -d 1 -t 10000 -a 5000 -F weight_folder -c 1 -v
```

三次文献

安装和管理 Perl Module 的两条命令 https://www.cpan.org/modules/INSTALL.html

不在系统上安装V2Ray，直接 pip3 安装 supervisord 管理本地 V2Ray，避开特权端口？用 Profile
https://gaomf.cn/2017/01/16/Terminal_Color/

从 SUSE Linux 上带来的 ~/.xim 配置文件似乎不是通用的，
在 SUSE Linux 上？/etc/X11/xim 通常用于启动默认输入法

`echo $TERM` 等效 `tset -q`

ncurses 库

掌握 VS Code 的终端 https://www.growingwiththeweb.com/2017/03/mastering-vscodes-terminal.html

可用 xorg-xprop 包中的 xprop 确定窗口 class, title, instance 等

当 bash 用 .bash_profile 启动时，并不会主动 source .bashrc，所以有两种解决办法：
1. 在 .bash_profile 里 source .bashrc
2. 如果 .bash_profile 包含了 .profile，则可在 .profile 中加入
   ```shell
   [ -n "$BASH_VERSION" ] && [ -s "$HOME/.bashrc" ] && . "$HOME/.bashrc"
   ```

掌上助理？
If you want to use a Palm device with Linux, uncomment the two lines below.
For some (older) Palm Pilots, might need to set a lower baud rate e.g. 57600 or 38400;
lowest is 9600 (very slow!)
```shell
export PILOTPORT=/dev/pilot PILOTRATE=38400
```

新闻组变量
for some news readers it makes sense to specify NEWSSERVER variable:
```shell
export NEWSSERVER=your.news.server
```

[关于 XDG 文件夹](https://wiki.archlinux.org/index.php/XDG_Base_Directory)

nano 的 资源文件 `$HOME/.nanorc`

一些应用读取 EDITOR 变量决定文本编辑器偏好

看一看 /usr/share/locale/locale.alias，
This overwrites the system default set in /etc/sysconfig/language in the variable RC_LANG.

手册页存储库曾经放在 /usr/man，现在存储位置已经改为 /usr/share/man 具体位置因 UNIX 版本而异，一些发行版会在 /usr 下建立到 /usr/share/man 的符号链接
为什么放弃使用 ZDOTDIR，因为 zsh 登录的时候总是要先索引一个根目录下的 zsh 配置文件（它会直接 pass .profile 文件），从而无论如何家目录下至少要放一个 .zprofile 或者 .zshenv 来 source .profile 或者 export ZDOTDIR。多少有点失去设置 ZDOTDIR 的意义了。而且专门给 zshell 增加一个存放目录管理也很头疼，还不如都丢在 HOME 下搜索起来也方便，reddit上面有关于这个的讨论
Zsh 变量索引顺序参见 Arch Wiki zsh 词条
若存在 `~/.bash_profile` 或 ~/.bash_login ，则 Bash 不读取 ~/.profile
Zsh 只读 ~/.zprofile 不读 ~/.profile
cp 如何把一个文件夹下的全拷过去（包括隐藏文件）而不会自动新建文件夹第一种是 -T 选项（例如 cp -rfLT "$_conf_d/user" "$HOME"），第二种是用 xxx/. 代替 xxx/*
Bash will never export an array to the environment (until maybe implemented someday, see the bugs section in the manpage). https://askubuntu.com/questions/295515/how-to-export-bash-arrays-any-workaround-tips
导出数组到文件 declare -p _kano_MODULE > "${_kano_RCMOD_FILE}"
对于 .profile ，似乎 export PATH=... 或者 PATH=... 都可以?
Linux dirs命令用于显示目录记录。显示目录堆叠中的记录。
Linux diff命令用于比较文件的差异。
diff 逐行比较文本文件异同。如果指定要比较目录，则 diff 会比较目录中相同文件名的文件，但不会比较其中子目录。
有一个类似的命令 cmp
Linux file命令用于辨识文件类型
Linux cksum命令用于检查文件的CRC是否正确
产生临时目录 _dir="$(mktemp -d 2>/dev/null || ensure mktemp -d -t rustup)"
引号扩起来的字符串折行必须用双引号，如果单引号则会把反斜杠也包含在字符串内，另外下一行字符串开始必须顶格，不然会把空格也带进去。
所以最好的办法是把跨行字符串拆成两个字符串（也不行，还是要顶格）
printf "[INFO]$(readlink -f ${0}): $(f_Info %s)" "${info}" 这句话是不可行的，因为 shell 会先进行替换和执行，然后才调用 printf 从而传递给 f_Info 的是 %s 而不是具体的字符串
Bash 可以用 export -f fun_name 导出函数到环境变量，但是导出的函数只能在 子Bash 中用；其他 Shell 如 Zsh 无法使用。POSIX 标准无此功能因此 dash 根本不支持
给变量取名时记得在shell里先echo一下看看系统里是不是已经在用了
即使用了local声明 但是一旦 export 出去，就是全局可访问的了，用完及时unset可以稍微补救一下。unset local A 和 unset A 有什么区别？好像没有区别无论一开始声明local还是不声明所有 A 都会被 unset ？

Shell 作为语言不是一门好语言，所以需要一定的设计模式思想，
单个脚本文件的长度 最好 不要超过 100 - 200 行，因为长脚本的调试十分困难还容易出错。当超过 200 行时往往说明：
1. 脚本里有冗余设计，过于复杂
2. 是时候用函数进行模块化了（最好从一开始就考虑）
3. 你应该拆分成多个文件 Make it simple and stupid 每个脚本做一件事，做到最好
4. 不排除不得不大量的情况
fd-find 进行搜索：fd-find 文件名 路径；如果开了 omz 的 fd-find 插件：fd 文件名 路径


Linux 文件基本属性 https://www.runoob.com/linux/linux-file-attr-permission.html

在Linux中第一个字符代表这个文件的类型：
- d 是目录
- \- 是文件
- l 表示链接文档(link file)
- b 表示设备文件中的可供储存的接口设备(可随机存取装置)；
- c 表示设备文件中的串行端口设备，例如键盘、鼠标(一次性读取装置)。

符号类型改变文件权限
还有一个改变权限的方法，从之前的介绍中我们可以发现，基本上就九个权限分别是：

(1)user
(2)group
(3)others
那么我们就可以使用 u, g, o 来代表三种身份的权限！

此外， a 则代表 all，即全部的身份。读写的权限可以写成 r, w, x，也就是可以使用下表的方式来看：

chmod u
g
o
a +(加入)
-(除去)
=(设定) r
w
x 文件或目录

tree -d 只列出目录
cp -i 覆盖文件前强制显示提示
mv -i 覆盖文件前强制显示提示
cat 对应原文 concatenate，-d 对非空输出行编号，-
n 对输出的所有行编号
Linux 有一 nl 命令和 cat -b 等效
more 分屏和 less 的区别
grep -n 显示行号 -v 反向匹配，即不包含匹配文本的行，-i 忽略大小写
shutdown 选项 时间，-r 表示重启，时间单位分钟，不指定默认 1 分钟，使用例：
```shell
shutdown -r now
shutdown now
shutdown 20:25
shutdown +10 # 10 分钟后关机
```

ifconfig 对应原文 configure a network interface
SSH 数据传输时是压缩的（必然？

scp 对应原文 secure copy 远程拷贝，地址格式同 ssh，例子：
```shell
# 拷贝到远程
scp -P 222 01.py user@remote:Desktop/01.py # 注意：: 后路径如不是绝对路径，则以登录时的工作目录？（一般为家目录）来处理
# 从远程拷贝
scp -P 233 user@remote:Desktop/01.py 01.py
# 拷贝文件夹到远程
scp -r demo user@remote:Desktop
# 从远程拷贝文件夹
scp -r user@remote:Desktop demo
# scp 只用于 Unix/Linux，Windows 下可用 PuTTY 的 pscp 代替
# scp 也可以和 ssh 一样使用配置文件和公钥登录/传输
```

```shell
ssh-keygen # 生成密钥对
ssh-copy-id -p 222 user@remote # 可以在远程机器上注册当前用户的公钥
```

目录的硬连接数的含义，和它可以间接的表达目录的层数/所含的目录数
硬连接数，通俗讲即有多少种方式壳访问当前目录/文件
Linux 用户/组名相同，但 uid 和 gid 不同时怎么处理（比如登录？）

su 对应原文 substitute user，即使用另一用户身份
su - 用户名：带着连字符在切换同时跳转到该用户家目录
sudo 默认 5 分钟超时

# 组管理
groupadd 组名：添加组
groupdel 组名：删除组
/etc/group 文件也分号隔开：
最后一行是属于该组的用户列表（逗号分开）
chgrp 组名 文件/目录：修改属组

# 用户管理
useradd -m -g 组 用户名：-m 建立家目录 -g 指定用户属组，否则自动建立同名组
passwd [用户名]：修改/设置密码
userdel -r 用户名：-r 同时删除家目录
/etc/passwd 文件中 6 个分号隔开 7 个信息：
1. 用户名
2. 密码（x，表示加密的密码）
3. UID（用户标识）
4. GID（组标识）
5. 用户全名或本地帐号
6. 家目录
7. 登录 Shell
id [用户名]：查看用户 UID 和 GID 信息
who：查看当前所有登录的用户列表
whoami：当前用户（我自己）的账户名

usermod 设置用户主组/附加组及登录 Shell
主组：/etc/passwd 第 4 列
附加组：用于指定用户附加权限
# 修改主组
usermod -g 组 用户名
# 修（添）改（加）附加组
usermod -G 组 用户名
# 修改登录 Shell
usermod -s /bin/zsh 用户名

which 和 command -v 的区别和联系？
FHS Filesystem Hierarchy Standard 文件系统层次结构标准
/sbin 系统管理员专用，用于系统管理
/usr/sbin 超级用户的一些管理程序

chmod 如何组合对应？u 用户/g 组/o 其他，例子：
777 -> u=rwx,g=rwx,o=rwx
755 -> u=rwx,g=rx,o=rx

时间日期 date/cal
磁盘目录空间 df/du （原文：disk free/disk usage）
进程管理 ps/top/kill（原文：process status）
ps aux：a 追加显示所有 tty 上（包括其他用户）的进程，u 追加显示详细状态，x 追加显示不含 controlling tty 的进程，即不是终端启动的进程

find 的好几个版本？
find [路径] -name "*.py"

软硬链接的说明，Linux 的文件名和文件数据分开存储。
文件名好比指向文件数据的指针，存储的“文件名”中包含文件数据的信息。

软链接是一种特殊的文件，它也有文件名和文件数据，软链接的文件名指向软链接的文件数据，而软链接的文件数据指向被链接的文件的“文件名”

与软链接不同，硬链接就是给当前文件数据增加一个别名，或者说增加一个新的文件名来“指向”该文件的文件数据。因此，其实可以把每个文件的文件名本身都看作是一种硬链接，于是，当一个文件的所有硬链接都被删除，文件数据就会丢失。

日常不太会去主动建立文件的硬链接

| 设备 | 对应文件 |
| --- | --- |
| SCSI/SATA/USB 硬盘    | /dev/sd[a-p] |
| USB 闪存              | /dev/sd[a-p]（同上） |
| VirtI/O 界面          | /dev/vd[a-p]（虚拟机） |
| 软驱                  | /dev/fd[0-7] |
| 打印机                | /dev/lp[0-2]（25 针打印机） /dev/usb/lp[0-15]（USB 界面） |
| 鼠标                  | /dev/input/mouse[0-15]（通用）/dev/psaux（PS/2 界面） /dev/mouse（当前鼠标） |
| CDROM/DVDROM          | /dev/scd[0-1]（通用）<br/> /dev/sr[0-1]（通用，CentOS 较常见）<br/> /dev/cdrom（当前 CDROM） |
| 磁带机                | /dev/ht0（IDE 界面） /dev/st0（SATA/SCSI 界面） /dev/tape（当前磁带） |
| IDE 硬盘 | /dev/hd[a-d] |


x86 Linux 上交叉编译面向 ARM64 的 ArmNN
https://github.com/ARM-software/armnn/blob/branches/armnn_20_05/BuildGuideCrossCompilation.md


md5sum：计算文件的 md5 可以确认文件改动与否
ldd：查看库文件依赖关系

如何修复破损的系统 python？（如把 /usr/lib/python3.x/ 删了）：因为 pacman 的数据库里还有包的信息，所以可以 sudo pacman -Sy $(pacman -Qsq python\-)

Linux 下录音和播放 https://zhuanlan.zhihu.com/p/58834651


NixOS

Wine
32-bit and 64-bit Support

On x86_64-linux, the wine package supports by default both 32- and 64-bit applications. On every other platform, the wine package supports by default only 32-bit applications.

These defaults can however be overwritten like this:

{
 environment.systemPackages = with pkgs; [
 # ...

 # support both 32- and 64-bit applications
 (wine.override { wineBuild = "wineWow"; })

 # support 32-bit only
 # (wine.override { wineBuild = "wine32"; })

 # support 64-bit only
 # (wine.override { wineBuild = "wine64"; })

 # wineStaging accepts the wineBuild argument, too
 # (wineStaging.override { wineBuild = "wineWow"; })
 ];
}

If you get the error wine: '/path/to/your/wineprefix' is a 64-bit installation, it cannot be used with a 32-bit wineserver., then you need the 64-bit ("wineWow") build.

The override method is mentioned in the manual.

buttercup-desktop
nix-env -iA nixos.iosevka-bin
nix-env -iA nixos.sarasa-gothic

好像可以传一个参数 $withFont 给这个表达式：
nix-env -iA nixos.nerdfonts

https://nixos.org/nixos/nix-pills/

https://github.com/rycee/home-manager

https://rycee.gitlab.io/home-manager/options.html

https://nixos.wiki/wiki/FAQ/How_can_I_install_a_proprietary_or_unfree_package%3F

要解决一个 Power Management 的问题


Shell/Terminal 技巧
- kitty 支持 ibus 但不支持 fcitx
- alacritty 支持 fcitx 但似乎不能 ibus
- urxvt 不支持 emoji
- 只有 Arch Linux 才有 fcitx-autostart
- ls 正则表达式匹配多个文件
- cd - 在两次工作目录间切换
- rm -f 强制删除时 会忽略不存在文件 无提示

i3 配置文件中 ! 不能用单引号！必须双引号！？

洋葱显示不出来 set $ws3 "3 﨩"

https://i.linuxtoy.org/docs/guide/ch02s02.html

## 前提

局域网已经有了一台打印机，IP 地址已知，
可直接通过 [http://IP:631](http://ip:631/) 这样的网页直接打开管理页面．
现在只是需要将其添加到 Arch Linux，这样打印的时候就可以直接使用了

## 安装 cups
CUPS (旧称 Common Unix Printing System) 的安装很简单的： 然后启动 `cups-browsed.service` 服务： ``` systemctl start cups-browsed.service systemctl enable cups-browsed.service ``` ## 添加网络打印机 浏览器打开 [http://localhost:631](http://localhost:631/)，进入 CUPS 的网页管理界面．Administration→Add Printer，根据提示输入用户名 root 和对应的密码．然后选择 Other Network Printers→Internet Printing Protocol (http)，输入你的打印机 IP 地址和端口，点 continue，根据需要设置一下 Name, Description, Location，点 continue，Make 那里选择打印机的厂商和星号，根据个人经验，这点可以随便选，似乎没什么区别，继续点 Add Printer．最后设置一下打印机的参数，一般只需要将纸张类型改为 A4，其他都不需要修改． 其实在 Add Printer 这一步的时候，也可以看到 cups 发现的局域网内的打印机，可以直接添加，但是后面在选择打印机型号的时候会遇到错误，只需要修改打印机型号即可．看起来添加网络打印机并不需要这里设置的型号与实际的型号一致． ## 添加虚拟打印机 此外还可以添加一个虚拟打印机，这样只要你打开的文档可以打印，它就可以直接打印为 PDF 文档，无需特别的转换．要使用虚拟打印机，我们需要安装 `cups-pdf` 包： 这个比起 Windows 下添加的各种虚拟打印机要简单多了吧．同样在 [http://localhost:631](http://localhost:631/) 中添加虚拟打印机即可


杂谈
在乐高（Lego）玩具发生的类似的情况正好阐述这种问题。试想下面的情景：

新用户（以下简称“新”）：我想要一个新玩具汽车，每个人都因乐高汽车的好玩而着了迷。所以我也买了它，但当我到家后我才发现，我的盒子里只有积木和齿轮！我的车子在哪里？
老用户（以下简称“老”）：你应该用积木组装一辆车，这才是乐高的真谛。
新：什么？？我不知道应怎样拼装这个车子。我不是个机械师。我该怎么知道如何组装它？
老：盒子里有使用手册。它上面写着拼装车子的步骤。你不用知道原理，只要按照按部就班就好。
新：好吧，我找到了说明。这得花多久啊！为什么他们不能装好了再卖给我，还得让我自己动手？？
老：并不是所有人都满足于将乐高做成玩具车。这些积木可以被我们组成万物。这才是游戏的真谛。
新：我仍旧不明白为什么厂商不能给我们这种想要车子的人一个成品，如果那些喜欢动手的人高兴可以自己拆了它阿。不管怎样，我还是将它组装起来了，尽管某些部件时不时地掉下来。我有什么方法可以解决吗？我能将它们粘起来吗？
老：这就是乐高。他就是用来拆装的。这才是游戏的真谛。
新：但我不希望总是拆拆装装，我仅仅希望一个玩具车而已！
老：呃，你到底是为什么要买乐高？


# Tips Collection

在 Archlinux 上安装 rpm-tools 的注意事项
```shell
:: Synchronizing package databases...
 core is up to date
 extra is up to date
 community                      5.1 MiB  3.95 MiB/s 00:01 [###############################] 100%
resolving dependencies...
looking for conflicting packages...

Packages (1) rpm-tools-4.15.1-2

Total Download Size:   0.93 MiB
Total Installed Size:  3.72 MiB

:: Proceed with installation? [Y/n]
:: Retrieving packages...
 rpm-tools-4.15.1-2-x86_64    956.9 KiB  10.4 MiB/s 00:00 [###############################] 100%
(1/1) checking keys in keyring                            [###############################] 100%
(1/1) checking package integrity                          [###############################] 100%
(1/1) loading package files                               [###############################] 100%
(1/1) checking for file conflicts                         [###############################] 100%
(1/1) checking available disk space                       [###############################] 100%
:: Processing package changes...
(1/1) installing rpm-tools                                [###############################] 100%
    rpm-tools installs RedHat package manager for you.
    It is useful for those who wants to create/modify RPM files.
    But do not use rpm-tools to install RedHat packages at your ArchLinux machine.
    It will break your system!
    You will need to go back to Arch wiki and read the installation guide again.
    You've been warned!
:: Running post-transaction hooks...
(1/1) Arming ConditionNeedsUpdate...
```

polybar 出现如下错误是因为 jsoncpp 每次更新会变动 .so 库的名称，因此需要重新更新（编译）对应的 ploybar，可见仓库内的 issue
```shell
error while loading shared libraries: libjsoncpp.so.22: cannot open shared object file: No such file or directory
```
