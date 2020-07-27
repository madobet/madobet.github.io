Yocto 工程一些通用结构。不同厂商可能根据需要剪裁，但整体结构及存放内容大体一致。

-   /
    -   bitbake/
        bitbake 工具目录。
        bitbake 是一种元数据（metadata）解释器，读取元数据并执行定义的任务（task）。
        执行 bitbake 命令实际执行的是 bitbake/bin/ 下面的文件
    -   build/ 用户配置文件和工程构建输出目录。build 目录在建立环境变量时创建并配置文件初始化。
        -   conf/
            -   local.conf
                用户配置文件，包含所有定制化配置。
                该文件配置的变量覆盖所有其他文件对应变量的软赋值（?= 形式的赋值，不覆盖 = 形式的硬赋值）
            -   bblayers.conf
                定义 BBLAYERS，BBLAYERS 决定哪些路径下的模块需要构建，给 BitBake 用
            -   sanity_info 可用性信息，不用关注
        -   downloads 构建过程中下载的所有源码。可将该目录放到公共目录下，提高每次的编译效率
        -   sstate-cache 构建过程中的构建状态缓存。可将该目录放到公共目录下，提高每次的编译效率
        -   tmp/ 构建产生的所有输出
            -   buildstats 构建统计信息，每次构建，都在该目录下生成一个日期目录
            -   cache BitBake 解析 metedata(包括 recipes 和 config 文件)后，将解析的结果缓存在该目录，以提高后续效率
            -   deploy 部署文件目录，最终需要的文件（boot rootfs image 等）都在该目录中
                -   deb       构建产生的所有 deb 安装包
                -   rpm       构建产生的所有 rpm 安装包
                -   ipk       构建产生的所有 ipk 安装包
                -   licenses 用到的各种软件许可信息
                -   images   存放 boot rootfs image 等文件
                -   sdk       工具链安装脚本
            -   sstate-control   状态跟踪文件
            -   sysroots-components   制作 sysroots 前需要额外添加的一些组件
            -   sysroots         构建出的根文件系统内容
            -   stamps           记录 BitBake 跟踪 task 执行时间的一些信息
            -   log             日志信息
            -   work             包含和 CPU 架构相关的工作目录
            -   work-shared 工作信息缓存，为了提高效率
    -   documentation 说明文件
    -   meta/             OE Core 的 Metedata,包括 recipes,comon classes 等
        -   classes               包含所有的 \*.bbclass。class 文件是抽象的公共代码，给各个 package 使用。
        -   conf                 配置文件（.conf）的核心集合。比如所有的 bblayers 的配置文件都是从该目录下的 bitbake.conf 文件中衍生的。
            -   machine         machine 的配置文件
            -   distro           发行信息的配置文件
            -   machine-sdk     制定 sdk 是 32 位还是 64 位。
        -   files/               包含一些 licence 文件和系统构建所需要的一些其他文件
        -   lib/                 系统构建过程中需要的一些 Python 库文件
        -   recipes-bsp          uboot 等硬件相关的配置信息
        -   recipes-connectivity 包含和其他设备通信相关的库和应用
        -   recipes-core         构建基本的 linux image 所需要的依赖
        -   recipes-devtools     主机构建时需要的 tools，这些工具在目标板上同样能够使用。
        -   recipes-extended     一些不重要的应用
        -   recipes-gnome        GTK+框架相关的应用
        -   recipes-graphics     绘图相关的库
        -   recipes-kernel       kernel 以及内核所依赖的库
        -   recipes-lsb4         支持 Linux Standard Base (LSB) version 4.x 所需要的
        -   recipes-multimedia   多媒体支持，图片、声音、视频
        -   recipes-rt           支持 PREEMPT_RT 所需要的 recipes 和包
        -   recipes-sato/        sato demo
        -   recipes-support       其他 recipes 包含的一些通用的 recipes
        -   site                 不同的架构下的缓存结果存放
        -   recipes.txt           说明文件
    -   meta-poky        poky 发行版本的配置数据
    -   meta-yocto-bsp   yocto 工程包含的一些参考的 BSP 配置，通常厂商自己会增加自己的 bsp 目录。
    -   meta-selftest    OE 自测的 recipes 和 append 文件
    -   meta-skeleton    BSP 和 kernel 开发用的一些临时 recipes
    -   scripts           脚本文件，用来提供一些特性的功能。该路径会被添加到环境变量中。
    -   oe-init-build-env   构建 OE 的环境

**i.MX Yocto 项目镜像表**

| Image name             | Target                                                                               | Provided by layer     |
| ---------------------- | ------------------------------------------------------------------------------------ | --------------------- |
| demo-image-origin      | 随板附带的原始系统镜像                                                               | -                     |
| core-image-minimal        | 能启动设备的最小镜像                                                                   | Poky                  |
| core-image-base        | 支持目标设备所有硬件，但只有控制台（界面）的镜像                                     | Poky                  |
| core-image-sato        | 含有 Sato 主题和 Pimlico 应用的镜像，包含终端、编辑器和文件管理器                    | Poky                  |
| imx-image-core         | 含有针对 Wayland 后端的测试用应用的镜像，用于我们的日常核心测试          | meta-imx/meta-sdk     |
| fsl-image-machine-test | 一个 FSL 社区的 i.MX 控制台环境的核心镜像                                            | meta-freescale-distro |
| imx-image-multimedia   | 带 GUI 但是不带 Qt 的镜像                                                            | meta-imx/meta-sdk     |
| imx-image-full         | i.MX 完全体！包含 Qt5 和机器学习支持。这种镜像只支持带图形硬件的 SoC（比如 8QM） | meta-imx/meta-sdk     |

# i.MX8 Yocto 工程简介分析

按照 NXP 官方网站说法，i.MX8 源码都发布在 Yocto Project Freescale i.MX6* release 工程里。\_The FSL Yocto Project Community BSP* ([_freescale.github.io_](https://blog.csdn.net/ligordon/article/details/freescale.github.io)) 是一个社区驱动的在*Yocto Project*里提供相关*i.MX6*单板支持和维*BoardSupport Package_metalayer 社区。使用\_OpenEmbedded-Core* 和 *Poky Yocto*版本，提供如下主要 3 个主要 meta layer：

-   [**meta-freescale:**](http://git.yoctoproject.org/cgit/cgit.cgi/meta-freescale) 提供基本 BSP 支持
-   [**meta-freescale-3rdparty:**](https://github.com/Freescale/meta-freescale-3rdparty) 第三方和合作伙伴板级支持
-   [**meta-freescale-distro:**](https://github.com/Freescale/meta-freescale-distro) 提供和版本发布、包管理相关的支持

该社区最近发布的版本为 2.0 版本*Jethro*(对于*imx*-4.0)、2.1 版本*Krogoth* (对于*imx*-4.1) 和 2.2 版本*Morty* (对于*imx*-4.2)。我们选用*imx*-4.1.15-2.0.0 这个稳定分支。

***1、YoctoProject*简介**

术语 _yocto_ 是最小的 _SI_ 单元*。作为一个前缀，yocto 表示 10^-24。YoctoProject*是一个开源的协作软件，提供模板、工具和方法帮你创建定制的 _Linux_ 系统和嵌入式产品，而无需关心硬件体系，支持*ARM*, _PPC_, _MIPS_,_x86_ (32 & 64 bit) 硬件体系架构。适合嵌入式 Linux 开发人员使用。查看[_Yocto Project Quick Start_](http://www.yoctoproject.org/docs/current/yocto-project-qs/yocto-project-qs.html)。

在整个*Yocto Project*中，这些部分被称为项目，包括构建工具、称为核心配方的构建指令元数据、库、实用程序和图形用户界面 (_GUI_)。

*Poky*是*YoctoProjec_t 的参考发布版本。它包括\_OpenEmbedded*构建系统 (_BitBake_ and _OpenEmbedded Core_) 和一系列*metadata*，帮助开发者构建自己的*distro*。_Poky_ 这一名称也指使用参考构建系统得到的默认 _Linux_ 发行版，它可能极其小 (_core-image-minimal_)，也可能是带有 _GUI_ 的整个*Linux* 系统 (_core-image-sato_)，它是一个关于搭建编译你自己制定的*Linux*发布版本的一个源代码用例。

_BitBake_ 是一个构建引擎，像所有的*build*工具一样 (比如*make*，_ant_，_jam_) 控制如何去构建系统并且解决构建依赖。*BitBake*不是基于固定依赖关系的*makefile*，而是收集和管理大量没有依赖关系的描述文件 (称为包的配方*recipes*)，然后自动按照正确的顺序进行构建。它读取*recipes*配方并通过获取程序包来密切关注它们、构建它们并将结果纳入可引导映像。_BitBake_ 由 _Yocto Project_ 和*OpenEmbedded* 项目共同维护。

_ OpenEmbedded_，简称*OE*，它用来构建和管理嵌入式开发系统（交叉编译、安装、打包）*。\_2004 年 10 月 7 日 ChrisLarson 把\_OE*分成了两个项目。一个是*BitBake*（构建任务的执行者），一个是*OpenEmbedded*（实际上是为*BitBake*提供元数据）*。YoctoProjec_t 使用的\_OE*称为*OpenEmbedded-Core，*是一些脚本 (*shell*和*Python*脚本) 和用来交叉编译、安装和打包的*metadata*(元数据) 构成的自动构建系统。

*metadata*元数据集按层进行排列，每一层都可以为下面的层提供单独的功能。基层是 _OpenEmbedded-Core_ 或*oe-core*，提供了所有构建项目所必需的常见配方、类和相关功能。然后可以通过在 _oe-core_ 之上添加新层来定制构建。_OpenEmbedded-Core_ 由 Yocto Project 和 _OpenEmbedded_ 项目共同维护。将 _Yocto Project_ 与 _OpenEmbedded_ 分开的层是*meta-yocto* 层，该层提供了 _Poky_ 发行版配置和一组核心的参考 _BSP_。

*metadata*元数据集包含如下部分：

_recipes_(配方)：(_.bb/.bbappend_) 组件的逻辑单元的构建规范，用来获取源代码、构建和打包组件；

_class_：(._bbclass_) 包括各个*recipes*之间共享的相同的功能；

_configuration_：(._conf_) 定义*Poky*如何的各种配置文件；

_layers_：一系列相同的*recipes*，就像*meta-fsl-arm*。

板卡支持包*BSP*含为特定板卡或架构构建 _Linux_ 必备的基本程序包和驱动程序。这通常由生产板卡的硬件制造商维护。

***2、Freescalei.MX6 Yocto Project*搭建**

_a_) 基本软硬件环境要求

虽然按照《_i.MX Yocto Project User's Guide_》中所说*Ubuntu* 12.04 和 14.04 版本均可，但是为了以后升级和维护的便利，强烈建议使用 14.04 版本！内存要*2G*以上 (注意不是包括*2G*，因为内存太小编译可能有问题)，磁盘空间至少*80G*以上，推荐*120G*，*CPU*至少双核。强烈不推荐虚拟机的方式，直接在硬盘上安装*Ubuntu，*除非你的磁盘性能很高。

_b_) 建立*Ubuntu* 14.04 所需要的包

建立*Ubuntu* 14.04 开发包之前，最好把*Ubuntu*在*SoftwareUpdater*里更新到最新。

sudo apt-get update

sudo apt-get install gawk wget git-corediffstat unzip texinfo gcc-multilib \\

build-essential chrpath socatlibsdl1.2-dev

sudo apt-get install libsdl1.2-devxterm sed cvs subversion coreutils texi2html \\

docbook-utils python-pysqlite2 help2manmake gcc g++ desktop-file-utils \\

libgl1-mesa-dev libglu1-mesa-devmercurial autoconf automake groff curl lzop asciidoc

sudo apt-get install u-boot-tools

_c_) 下载*repo*

mkdir ~/bin (this step may not beneeded if the bin folder already exists)

curl [http://commondatastorage.googleapis.com/git-repo-downloads/repo>](http://commondatastorage.googleapis.com/git-repo-downloads/repo>) ~/bin/repo

参考文档 1 给出的地址需要翻墙才能下载，所以换个地址：

curl[http://php.webtutor.pl/en/wp-content/uploads/2011/09/repo](http://php.webtutor.pl/en/wp-content/uploads/2011/09/repo) > ~/bin/repo

chmod a+x ~/bin/repo

_vi ~/.bashrc_ 在尾部加：

export PATH=~/bin:\$PATH

_d_) 配置*git*

git config --global user.name"Your Name"

git config --global user.email"Your Email"

git config --list

_e_) _Yocto Project Setup_

cd ~

mkdir imx6 && cd imx6

mkdir fsl-release-bsp && cdfsl-release-bsp

repo init -ugit://git.freescale.com/imx/fsl-arm-yocto-bsp.git -b imx-4.1-krogoth –m imx-4.1.15-2.0.0.xml --repo-url=[https://gerrit-google.tuna.tsinghua.edu.cn/git-repo](https://gerrit-google.tuna.tsinghua.edu.cn/git-repo)

//repo 可能找不到，export PATH=~/bin:\$PATH 下，要是不行，可使用 Ubuntu 的提示：sudo apt-get installphablet-tools

repo sync // 时间可能比较长，依赖于你的网络。

**_3、ImageBuild_**

**_a)Build configurations_**

*Freescale*提供了一个脚本*fsl-setup-release.sh*，能大大简化构建配置。

DISTRO=&lt;_distro name_> MACHINE=&lt;_machinename_> _source fsl-setup-release.sh_ -b &lt;_build dir_>

*<distroname>*指定要生成的*distribution*，固定为以下内容的一个：

_fsl-imx-x11_ 只支持*X11 graphics*

_fsl-imx-wayland_ 只支持*Waylandweston graphics*

_fsl-imx-xwayland_ 支持 _Waylandgraphics_ 和*X11*

_fsl-imx-fb_ 只支持*Frame Buffer graphics* ，不支持*X11*和*Wayland*

*<machinename>*指定板子型号，可在 sources/meta-fsl-arm/conf/machine 看到所有的支持型号，*fsl-setup-release.sh*脚本会根据*MACHINE*指定的内容从*sources/meta-fsl-arm/conf/machine*里面的文件选择对应的*.conf*进行编译，有下面的值：

imx23evk
imx28evk
imx51evk
imx53ard

imx53qsb

imx6dlsabreauto

imx6dlsabresd

imx6qdlsolo

imx6qpsabreauto

imx6qpsabresd

imx6qsabreauto

imx6qsabresd

imx6slevk

imx6sll_all

imx6sllevk

imx6slllpddr2arm2

imx6slllpddr3arm2

imx6solosabreauto

imx6solosabresd

imx6sx14x14arm2

imx6sx17x17arm2

imx6sx19x19ddr3arm2

imx6sx19x19lpddr2arm2

imx6sx_all

imx6sxsabreauto

imx6sxsabresd

imx6ul14x14ddr3arm2

imx6ul14x14lpddr2arm2

imx6ul7d

imx6ul9x9evk

imx6ulevk

imx6ull14x14ddr3arm2

imx6ull14x14evk

imx6ull9x9evk

imx7d12x12ddr3arm2

imx7d12x12lpddr3arm2

imx7d19x19ddr3arm2

imx7d19x19lpddr2arm2

imx7d19x19lpddr3arm2

imx7dsabresd

ls1021atwr

twr-vf65gs10

&lt;_build dir_>是编译的目录，我们可以任意指定一个目录名，编译的时候将在当前目录下新建这个目录。

当执行该脚本之后，会在 &lt;_build dir_>目录下生成配置文件。在 &lt;_builddir_>*/conf/local.conf*会指定*DL_DIR*的内容，该路径用于下载并保存编译所需要的包。在*bitbake*在编译的时候会先去该路径查看有没有所需的包，如果没有，就从网上下载到该目录下。一般情况下这些包都是固定的，在团队开发中可由一人先下载，之后共享出来，然后每个人将*DL_DIR*指定到该共享文件夹就可以省去网上下载的麻烦。

*<build dir>/conf/bblayers.conf*会指定所需要的*layers*。*bitbake*在启动时会执行*bitbake.conf*，*bitbake.conf*会装载用户提供的*local.conf*。然后根据用户在*local.conf*中定义的硬件平台*MACHINE*和发布目标*DISTRO*装载*machine*子目录和*distro*子目录的配置文件。*machine*子目录里是硬件平台相关的配置文件。*distro*子目录里是与发布目标相关的配置文件。配置文件负责设置*bitbake*内部使用的环境变量。这些变量会影响整个构建过程。

每次新打开一个窗口，都要进行一次 source 操作。

\#_sourcesetup-environment <build-dir>_

我们使用的是

**DISTRO=_fsl-imx-x11_ MACHINE= imx6qsabresd _source fsl-setup-release.sh_–b _build-x11_**

**_b_) 选择一个镜像编译**

可供选择的镜像名字如下表格：

\|

**Image name**

\|

**Target**

\|

**Provided by layer**

\|
\|

core-image-minimal

\|

A small image that only allows a device to boot.

\|

poky

\|
\|

core-image-base

\|

A console-only image that fully supports the target device hardware.

\|

poky

\|
\|

core-image-sato

\|

An image with Sato, a mobile environment and visual style for mobile devices. The image supports X11 with a Sato theme and uses Pimlico applications. It contains a terminal, an editor and a file manager.

\|

poky

\|
\|

fsl-image-machine-test

\|

An FSL Community i.MX core image with console environment - no GUI interface.

\|

meta-fsl-demos

\|
\|

fsl-image-gui

\|

Builds a Freescale image with a GUI without any Qt content.

\|

meta-fsl-bsp-release/imx/meta-sdk

\|
\|

fsl-image-qt5

\|

Builds an opensource Qt 5 image. These images are only supported for i.MX SoC with hardware graphics. They are not supported on the i.MX 6UltraLite, i.MX 6UltraLiteLite,and i.MX 7Dual.

\|

meta-fsl-bsp-release/imx/meta-sdk

\|

我们一般使用*core-image-base*和*fsl-image-gui*吧。

**_c_) 编译镜像**

**_bitbake image-name_**

我们使用的是**_bitbake fsl-image-gui_**

**然后漫长的等待，因为要下载 7000 + 个源码包，并把它们编译完全。**

***4、*编译完成后源码目录粗略分析**

├── build-x11 **// 编译目录**

│ ├── cache **// 编译缓存**

│ ├── conf **// 配置**

│ ├── sstate-cache **// 保存状态，如果没有改变下次不再重新编译包**

│ │ └── Ubuntu-14.04

│ └── tmp **// 镜像，代码**

│ ├── buildstats **// 编译时状态记录，如果中断可以续编**

│ │ ├── 20171116021902

│ │ └── 20171116063407

│ ├── cache **// 编译过程中的缓存**

│ │ └── default-glibc

│ ├── deploy **// 生成的镜像、文件系统及安装插件**

│ │ ├── images

│ │ ├── licenses

│ │ └── rpm

│ ├── log **// 编译生成的日志文件**

│ │ └── cooker

│ ├── sstate-control **// 编译完成的包会在这里建立文件以标识**

│ ├── stamps

│ │ ├── all-poky-linux

│ │ ├── cortexa9hf-neon-mx6qdl-poky-linux-gnueabi

│ │ ├── cortexa9hf-neon-poky-linux-gnueabi

│ │ ├── imx6qsabresd-poky-linux-gnueabi

│ │ ├── work-shared

│ │ └── x86_64-linux

│ ├── sysroots **// 缓存的工具连，但是用不了**

│ │ ├── imx6qsabresd

│ │ ├── imx6qsabresd-tcbootstrap

│ │ └── x86_64-linux

│ ├── work **// 代码都在这里**

│ │ ├── all-poky-linux

│ │ ├── cortexa9hf-neon-mx6qdl-poky-linux-gnueabi

│ │ ├── cortexa9hf-neon-poky-linux-gnueabi

│ │ ├── imx6qsabresd-poky-linux-gnueabi

│ │ └── x86_64-linux

│ └── work-shared

│ ├── gcc-5.3.0-r0

│ └── imx6qsabresd

└── sources **//repo 下载的 yocto**

├── base **//baseconfiguration for FSL Community BSP**

│ └── conf

├── meta-browser **// 浏览器支持**

│ ├── classes

│ ├── conf

│ ├── recipes-browser

│ │ └── chromium

│ ├── recipes-gnome

│ │ └── gnome-settings-daemon

│ ├── recipes-mozilla

│ │ ├── firefox

│ │ ├── firefox-addon

│ │ ├── firefox-l10n

│ │ └── mozilla-devscripts

│ └── scripts

├── meta-fsl-arm **//Freescale ARM 基础和 Freescale ARM 参考板支持**

│ ├── browser-layer

│ │ └── recipes-browser

│ ├── classes

│ ├── conf

│ │ └── machine

│ ├── efl-layer

│ │ └── recipes-efl

│ ├── filesystem-layer

│ │ └── recipes-fsl

│ ├── openembedded-layer

│ │ ├── recipes-benchmark

│ │ ├── recipes-kernel

│ │ └── recipes-support

│ ├── qt4-layer

│ │ └── recipes-qt4

│ ├── qt5-layer

│ │ └── recipes-qt

│ ├── recipes-bsp

│ │ ├── alsa-state

│ │ ├── apptrk

│ │ ├── barebox

│ │ ├── change-file-endianess

│ │ ├── elftosb

│ │ ├── firmware-imx

│ │ ├── formfactor

│ │ ├── imx-bootlets

│ │ ├── imx-kobs

│ │ ├── imx-lib

│ │ ├── imx-test

│ │ ├── imx-uuc

│ │ ├── imx-vpu

│ │ ├── mxsldr

│ │ ├── qe-ucode

│ │ ├── rcw

│ │ └── u-boot

│ ├── recipes-core

│ │ ├── packagegroup

│ │ └── udev

│ ├── recipes-devtools

│ │ ├── cst

│ │ ├── devregs

│ │ ├── imx-usb-loader

│ │ └── qemu

│ ├── recipes-fsl

│ │ ├── images

│ │ └── packagegroups

│ ├── recipes-graphics

│ │ ├── cairo

│ │ ├── clutter

│ │ ├── cogl

│ │ ├── drm

│ │ ├── eglinfo

│ │ ├── gtk+

│ │ ├── images

│ │ ├── imx-gpu-viv

│ │ ├── mesa

│ │ ├── piglit

│ │ ├── wayland

│ │ ├── xinput-calibrator

│ │ ├── xorg-driver

│ │ └── xorg-xserver

│ ├── recipes-kernel

│ │ ├── kernel-modules

│ │ └── linux

│ ├── recipes-multimedia

│ │ ├── alsa

│ │ ├── gstreamer

│ │ ├── imx-codec

│ │ ├── imx-parser

│ │ ├── imx-vpuwrap

│ │ ├── libimxvpuapi

│ │ └── pulseaudio

│ ├── SCR

│ │ └── imx

│ └── scripts

│ └── lib

├── meta-fsl-arm-extra **// 第三方和合作伙伴板级支持**

│ ├── conf

│ │ └── machine

│ ├── recipes-bsp

│ │ ├── barebox

│ │ ├── broadcom-nvram-config

│ │ ├── formfactor

│ │ ├── imx-bootlets

│ │ ├── libmcc

│ │ ├── libmcc2

│ │ ├── mqxboot

│ │ └── u-boot

│ ├── recipes-core

│ │ ├── init-ifupdown

│ │ └── net-persistent-mac

│ └── recipes-kernel

│ ├── kernel-module-mcc-toradex

│ ├── kernel-modules

│ ├── linux

│ └── linux-firmware

├── meta-fsl-bsp-release **// Freescale BSPrelease layer**

│ └── imx

│ ├── classes

│ ├── meta-bsp

│ ├── meta-sdk

│ └── tools

├── meta-fsl-demos **// 额外的协助开发和测试板载能力**

│ ├── conf

│ ├── recipes-fsl

│ │ ├── fsl-rc-local

│ │ ├── images

│ │ └── packagegroups

│ └── recipes-graphics

│ ├── devil

│ └── fsl-gpu-sdk

├── meta-openembedded **//OE 核心层**

│ ├── contrib

│ ├── meta-efl

│ │ ├── classes

│ │ ├── conf

│ │ ├── recipes-core

│ │ ├── recipes-devtools

│ │ ├── recipes-efl

│ │ ├── recipes-multimedia

│ │ └── recipes-navigation

│ ├── meta-filesystems

│ │ ├── conf

│ │ ├── recipes-filesystems

│ │ ├── recipes-support

│ │ └── recipes-utils

│ ├── meta-gnome

│ │ ├── conf

│ │ ├── recipes-apps

│ │ ├── recipes-connectivity

│ │ ├── recipes-devtools

│ │ ├── recipes-extended

│ │ ├── recipes-gnome

│ │ ├── recipes-support

│ │ └── site

│ ├── meta-gpe

│ │ ├── conf

│ │ ├── recipes-graphics

│ │ └── recipes-support

│ ├── meta-initramfs

│ │ ├── classes

│ │ ├── conf

│ │ ├── recipes-bsp

│ │ ├── recipes-devtools

│ │ └── recipes-kernel

│ ├── meta-multimedia

│ │ ├── conf

│ │ ├── recipes-connectivity

│ │ ├── recipes-dvb

│ │ ├── recipes-mediacentre

│ │ ├── recipes-mkv

│ │ ├── recipes-multimedia

│ │ └── recipes-support

│ ├── meta-networking

│ │ ├── classes

    │   │   ├── conf

│ │ ├── files

│ │ ├── licenses

│ │ ├── recipes-connectivity

│ │ ├── recipes-daemons

│ │ ├── recipes-extended

│ │ ├── recipes-filter

│ │ ├── recipes-irc

│ │ ├── recipes-kernel

│ │ ├── recipes-netkit

│ │ ├── recipes-protocols

│ │ └── recipes-support

│ ├── meta-oe

│ │ ├── classes

│ │ ├── conf

│ │ ├── licenses

│ │ ├── recipes-benchmark

│ │ ├── recipes-connectivity

│ │ ├── recipes-core

│ │ ├── recipes-devtools

│ │ ├── recipes-extended

│ │ ├── recipes-gnome

│ │ ├── recipes-graphics

│ │ ├── recipes-kernel

│ │ ├── recipes-multimedia

│ │ ├── recipes-navigation

│ │ ├── recipes-sato

│ │ ├── recipes-support

│ │ ├── recipes-test

│ │ └── site

│ ├── meta-perl

│ │ ├── conf

│ │ ├── recipes-extended

│ │ └── recipes-perl

│ ├── meta-python

│ │ ├── classes

│ │ ├── conf

│ │ ├── licenses

│ │ ├── recipes-connectivity

│ │ ├── recipes-devtools

│ │ └── recipes-extended

│ ├── meta-ruby

│ │ ├── classes

│ │ ├── conf

│ │ └── recipes-devtools

│ ├── meta-systemd

│ │ ├── conf

│ │ ├── oe-core

│ │ └── recipes-core

│ ├── meta-webserver

│ │ ├── conf

│ │ ├── licenses

│ │ ├── recipes-httpd

│ │ ├── recipes-php

│ │ ├── recipes-support

│ │ └── recipes-webadmin

│ └── meta-xfce

│ ├── classes

│ ├── conf

│ ├── recipes-apps

│ ├── recipes-art

│ ├── recipes-bindings

│ ├── recipes-core

│ ├── recipes-extended

│ ├── recipes-multimedia

│ ├── recipes-panel-plugins

│ ├── recipes-support

│ ├── recipes-thunar-plugins

│ └── recipes-xfce

├── meta-qt5 **//QT5 支持**

│ ├── classes

│ ├── conf

│ ├── files

│ ├── lib

│ │ └── recipetool

│ ├── licenses

│ ├── recipes-devtools

│ │ └── gdb

│ └── recipes-qt

│ ├── demo-extrafiles

│ ├── examples

│ ├── libconnman-qt

│ ├── maliit

│ ├── meta

│ ├── packagegroups

│ ├── qsiv

│ ├── qt5

│ ├── quazip

│ └── tufao

└── poky **// 基本 Yocto Project 的 Poky 版本**

       ├── bitbake

       │   ├── bin

       │   ├── contrib

       │   ├── doc

       │   └── lib

       ├── documentation

       │   ├── adt-manual

       │   ├── bsp-guide

       │   ├── dev-manual

       │   ├── kernel-dev

       │   ├── mega-manual

       │   ├── profile-manual

       │   ├── ref-manual

       │   ├── sdk-manual

       │   ├── template

       │   ├── toaster-manual

       │   ├── tools

       │   └── yocto-project-qs

       ├── meta

       │   ├── classes

       │   ├── conf

       │   ├── files

       │   ├── lib

       │   ├── recipes-bsp

       │   ├── recipes-connectivity

       │   ├── recipes-core

       │   ├── recipes-devtools

       │   ├── recipes-extended

       │   ├── recipes-gnome

       │   ├── recipes-graphics

       │   ├── recipes-kernel

       │   ├── recipes-lsb4

       │   ├── recipes-multimedia

       │   ├── recipes-rt

       │   ├── recipes-sato

       │   ├── recipes-support

       │   └── site

       ├── meta-poky

       │   ├── classes

       │   ├── conf

       │   └── recipes-core

       ├── meta-selftest

       │   ├── classes

       │   ├── conf

       │   ├── files

       │   ├── lib

       │   └── recipes-test

       ├── meta-skeleton

       │   ├── conf

       │   ├── recipes-core

       │   ├── recipes-kernel

       │   ├── recipes-multilib

       │   └── recipes-skeleton

       ├── meta-yocto

       │   └── conf

       ├── meta-yocto-bsp

       │   ├── conf

       │   ├── lib

       │   ├── recipes-bsp

       │   ├── recipes-core

       │   ├── recipes-graphics

       │   └── recipes-kernel

       └── scripts

            ├── contrib

            ├── lib

            ├── native-intercept

            ├── postinst-intercepts

            ├── pybootchartgui

            └── tiny

没有*downloads*目录是因为我把它设置到其他地方了。

***5、*可能存在的问题**

(1) *bitbake*编译时提示在*TMPDIR*或*SSTATE_DIR*创建一个长名文件失败

x@x:~/imx6/fsl-release-bsp/build-x11\$ bitbake fsl-image-gui

NOTE: Your conf/bblayers.conf has been automatically updated.

ERROR: OE-core's config sanity checker detected a potential misconfiguration.

Either fix the cause of this error or at your own risk disable the checker(see sanity.conf).

Following is the list of potential problems / advisories:

Failed to create a file with a long name in TMPDIR. Please use afilesystem that does not unreasonably limit filename length.

Failed to create a file with a long name in SSTATE_DIR. Please use afilesystem that does not unreasonably limit filename length.

问题可能原因：# Check thatTMPDIR isn't on a filesystem with limited filename length (eg. eCryptFS)

解决方法：把用户目录去掉加密。

去掉加密步骤：

1)、备份主目录 sudo cp -rp /home/x /home/xx

2)、启动 root 登录，sudo passwd

3)、root 登录进去新建一个账号 z，useradd z // 注意不用创建目录

4)、重启系统，用 z 账号 shell 登录进去，然后 su 切换到 root 账号

5)、root 账号下删除 x 用户目录 rm -rf /home/x

在 root 用户下删除主目录时失败，提示的资源文件忙，这时重启一下机器用 root 用户登录系统，在删除就没有问题了。

6)、重命名备份主目录 xx 为主目录 x：mv /home/xx /home/x

7)、root 账号下删除加密文件

rm -rf /home/.ecryptfs

rm -rf /home/x/.ecryptfs

rm -rf /home/x/.Private

8)、账号 x 下取消 root 账号登录：sudo passwd -l root

9)、账号 x 下删除 z 账号：sudo userdel -rf z

(2) *bitbake*编译 boost 时提示**virtual memory exhausted:**

Currently 1 running tasks (260 of 260):

0: boost-1.60.0-r0 do_compile (pid 8886)

boost-1.60.0-r0 do_compile: gcc.compile.c++ /home/x/imx6/fsl-release-bsp/build-x11/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/boost/1.60.0-r0/boost_1_60_0/arm-poky-linux-gnueabi/boost/bin.v2/libs/log/build/8208f58b5e252bb068de8fecdebc659d/settings_parser.o

"arm-poky-linux-gnueabi-g++" "-march=armv7-a""-mfpu=neon""-mfloat-abi=hard" "-mcpu=cortex-a9""-Wl,-O1""-Wl,--hash-style=gnu""-Wl,--as-needed""--sysroot=/home/x/imx6/fsl-release-bsp/build-x11/tmp/sysroots/imx6qsabresd" -ftemplate-depth-128 -O2 -pipe -g -feliminate-unused-debug-types-fdebug-prefix-map=/home/x/imx6/fsl-release-bsp/build-x11/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/boost/1.60.0-r0=/usr/src/debug/boost/1.60.0-r0-fdebug-prefix-map=/home/x/imx6/fsl-release-bsp/build-x11/tmp/sysroots/x86_64-linux=-fdebug-prefix-map=/home/x/imx6/fsl-release-bsp/build-x11/tmp/sysroots/imx6qsabresd= -fvisibility-inlines-hidden -O3-finline-functions -Wno-inline -Wall -pthread -fPIC -fno-strict-aliasing-ftemplate-depth-1024 -fvisibility=hidden -DBOOST_ALL_NO_LIB=1-DBOOST_ATOMIC_DYN_LINK=1 -DBOOST_CHRONO_DYN_LINK=1-DBOOST_DATE_TIME_DYN_LINK=1 -DBOOST_FILESYSTEM_DYN_LINK=1-DBOOST_LOG_DYN_LINK=1 -DBOOST_LOG_SETUP_BUILDING_THE_LIB=1-DBOOST_LOG_SETUP_DLL -DBOOST_LOG_USE_NATIVE_SYSLOG-DBOOST_LOG_WITHOUT_EVENT_LOG -DBOOST_SPIRIT_USE_PHOENIX_V3=1-DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_SYSTEM_NO_DEPRECATED-DBOOST_THREAD_BUILD_DLL=1 -DBOOST_THREAD_DONT_USE_CHRONO=1-DBOOST_THREAD_POSIX -DBOOST_THREAD_USE_DLL=1 -DDATE_TIME_INLINE -DNDEBUG-D_GNU_SOURCE=1 -D_XOPEN_SOURCE=600 -I"." -c -o "/home/x/imx6/fsl-release-bsp/build-x11/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/boost/1.60.0-r0/boost_1_60_0/arm-poky-linux-gnueabi/boost/bin.v2/libs/log/build/8208f58b5e252bb068de8fecdebc659d/settings_parser.o""libs/log/src/settings_parser.cpp"

**virtual memory exhausted:Cannot allocate memory**

Currently 1 running tasks (260 of 260):

0: boost-1.60.0-r0 do_compile (pid 8886)

boost-1.60.0-r0 do_compile: gcc.compile.c++ /home/x/imx6/fsl-release-bsp/build-x11/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/boost/1.60.0-r0/boost_1_60_0/arm-poky-linux-gnueabi/boost/bin.v2/libs/log/build/8208f58b5e252bb068de8fecdebc659d/init_from_settings.o

"arm-poky-linux-gnueabi-g++" "-march=armv7-a""-mfpu=neon""-mfloat-abi=hard" "-mcpu=cortex-a9""-Wl,-O1""-Wl,--hash-style=gnu""-Wl,--as-needed""--sysroot=/home/x/imx6/fsl-release-bsp/build-x11/tmp/sysroots/imx6qsabresd" -ftemplate-depth-128 -O2 -pipe -g -feliminate-unused-debug-types -fdebug-prefix-map=/home/x/imx6/fsl-release-bsp/build-x11/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/boost/1.60.0-r0=/usr/src/debug/boost/1.60.0-r0-fdebug-prefix-map=/home/x/imx6/fsl-release-bsp/build-x11/tmp/sysroots/x86_64-linux=-fdebug-prefix-map=/home/x/imx6/fsl-release-bsp/build-x11/tmp/sysroots/imx6qsabresd= -fvisibility-inlines-hidden -O3-finline-functions -Wno-inline -Wall -pthread -fPIC -fno-strict-aliasing-ftemplate-depth-1024 -fvisibility=hidden -DBOOST_ALL_NO_LIB=1-DBOOST_ATOMIC_DYN_LINK=1 -DBOOST_CHRONO_DYN_LINK=1-DBOOST_DATE_TIME_DYN_LINK=1 -DBOOST_FILESYSTEM_DYN_LINK=1-DBOOST_LOG_DYN_LINK=1 -DBOOST_LOG_SETUP_BUILDING_THE_LIB=1-DBOOST_LOG_SETUP_DLL -DBOOST_LOG_USE_NATIVE_SYSLOG-DBOOST_LOG_WITHOUT_EVENT_LOG -DBOOST_SPIRIT_USE_PHOENIX_V3=1-DBOOST_SYSTEM_DYN_LINK=1 -DBOOST_SYSTEM_NO_DEPRECATED-DBOOST_THREAD_BUILD_DLL=1 -DBOOST_THREAD_DONT_USE_CHRONO=1-DBOOST_THREAD_POSIX -DBOOST_THREAD_USE_DLL=1 -DDATE_TIME_INLINE -DNDEBUG-D_GNU_SOURCE=1 -D_XOPEN_SOURCE=600 -I"." -c -o "/home/x/imx6/fsl-release-bsp/build-x11/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/boost/1.60.0-r0/boost_1_60_0/arm-poky-linux-gnueabi/boost/bin.v2/libs/log/build/8208f58b5e252bb068de8fecdebc659d/init_from_settings.o""libs/log/src/init_from_settings.cpp"

In file included from ./boost/smart_ptr/detail/atomic_count.hpp:80:0,

from./boost/smart_ptr/intrusive_ref_counter.hpp:19,

from./boost/log/attributes/attribute.hpp:21,

from./boost/log/attributes/attribute_value_set.hpp:26,

from./boost/log/core/record.hpp:21,

from./boost/log/core/core.hpp:23,

from./boost/log/core.hpp:20,

fromlibs/log/src/init_from_settings.cpp:53:

./boost/smart_ptr/detail/atomic_count_sync.hpp: In member function 'longint boost::detail::atomic_count::operator++()':

./boost/smart_ptr/detail/atomic_count_sync.hpp:49:5: warning: no returnstatement in function returning non-void \[-Wreturn-type]

}

^

In file included from ./boost/asio/ip/impl/address_v4.ipp:21:0,

from./boost/asio/ip/address_v4.hpp:240,

from./boost/asio/ip/address.hpp:21,

fromlibs/log/src/init_from_settings.cpp:65:

./boost/asio/error.hpp: At global scope:

./boost/asio/error.hpp:258:45: warning:'boost::asio::error::system_category' defined but not used \[-Wunused-variable]

static constboost::system::error_category& system_category

^

./boost/asio/error.hpp:260:45: warning:'boost::asio::error::netdb_category' defined but not used \[-Wunused-variable]

static constboost::system::error_category& netdb_category

^

./boost/asio/error.hpp:262:45: warning: 'boost::asio::error::addrinfo_category'defined but not used \[-Wunused-variable]

static constboost::system::error_category& addrinfo_category

^

./boost/asio/error.hpp:264:45: warning:'boost::asio::error::misc_category' defined but not used \[-Wunused-variable]

static constboost::system::error_category& misc_category

^

Currently 1 running tasks (260 of 260):

0: boost-1.60.0-r0 do_compile (pid 8886)

boost-1.60.0-r0 do_compile: ...failed updating 1 target...

Currently 1 running tasks (260 of 260):

0: boost-1.60.0-r0 do_compile (pid 8886)

boost-1.60.0-r0 do_compile: + bb_exit_handler

\+ ret=1

\+ echo WARNING: exit code 1 from a shell command.

Currently 1 running tasks (260 of 260):

0: boost-1.60.0-r0 do_compile (pid 8886)

ERROR: boost-1.60.0-r0 do_compile: Function failed: do_compile (log fileis located at/home/x/imx6/fsl-release-bsp/build-x11/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/boost/1.60.0-r0/temp/log.do_compile.8886)

Currently 1 running tasks (260 of 260):

0: boost-1.60.0-r0 do_compile (pid 8886)

ERROR: Logfile of failure stored in:/home/x/imx6/fsl-release-bsp/build-x11/tmp/work/cortexa9hf-neon-poky-linux-gnueabi/boost/1.60.0-r0/temp/log.do_compile.8886

Log data follows:

问题原因不清楚，可能是因为虚拟机内存 (2GB) 太小导致，也可能是虚拟机本身导致的。换成 4GB 内存和非虚拟机方式，问题不在重新。

**6、参考文档：**

1、《_i.MX Yocto Project User's Guide_》

2、_FSL Community BSP_：[_http://freescale.github.io_](http://freescale.github.io/)

3、IBM _Jeffrey Osier-Mixon_：[使用*Yocto Project*构建自定义嵌入式*Linux*发行版](https://www.ibm.com/developerworks/cn/linux/l-yocto-linux/)。
