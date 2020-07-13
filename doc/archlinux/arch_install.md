<!-- Anchor -->

[x server]: https://wiki.archlinux.org/index.php/Category:X_server_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
[x org]: https://wiki.archlinux.org/index.php/Xorg_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)
[kiosk mode]: https://wiki.xfce.org/howto/kiosk_mode

# Play with Arch Linux

从裸机开始的 Arch Linux 安装教程

- [Play with Arch Linux](#play-with-arch-linux)
- [安装前的准备](#%e5%ae%89%e8%a3%85%e5%89%8d%e7%9a%84%e5%87%86%e5%a4%87)
  - [网络](#%e7%bd%91%e7%bb%9c)
    - [激活和连接](#%e6%bf%80%e6%b4%bb%e5%92%8c%e8%bf%9e%e6%8e%a5)
    - [关闭和禁用](#%e5%85%b3%e9%97%ad%e5%92%8c%e7%a6%81%e7%94%a8)
  - [更新系统时间](#%e6%9b%b4%e6%96%b0%e7%b3%bb%e7%bb%9f%e6%97%b6%e9%97%b4)
  - [分区](#%e5%88%86%e5%8c%ba)
    - [创建和格式化分区](#%e5%88%9b%e5%bb%ba%e5%92%8c%e6%a0%bc%e5%bc%8f%e5%8c%96%e5%88%86%e5%8c%ba)
    - [挂载分区](#%e6%8c%82%e8%bd%bd%e5%88%86%e5%8c%ba)
- [安装](#%e5%ae%89%e8%a3%85)
  - [Fstab](#fstab)
  - [Chroot](#chroot)
  - [网络](#%e7%bd%91%e7%bb%9c-1)
  - [Initramfs](#initramfs)
  - [安装 GRUB](#%e5%ae%89%e8%a3%85-grub)
    - [探测其他操作系统](#%e6%8e%a2%e6%b5%8b%e5%85%b6%e4%bb%96%e6%93%8d%e4%bd%9c%e7%b3%bb%e7%bb%9f)
    - [微码](#%e5%be%ae%e7%a0%81)
  - [重启](#%e9%87%8d%e5%90%af)
  - [时区和本地化](#%e6%97%b6%e5%8c%ba%e5%92%8c%e6%9c%ac%e5%9c%b0%e5%8c%96)
  - [创建用户](#%e5%88%9b%e5%bb%ba%e7%94%a8%e6%88%b7)
  - [缩短系统启动、停止会话的等待时间](#%e7%bc%a9%e7%9f%ad%e7%b3%bb%e7%bb%9f%e5%90%af%e5%8a%a8%e5%81%9c%e6%ad%a2%e4%bc%9a%e8%af%9d%e7%9a%84%e7%ad%89%e5%be%85%e6%97%b6%e9%97%b4)
  - [运行安装脚本](#%e8%bf%90%e8%a1%8c%e5%ae%89%e8%a3%85%e8%84%9a%e6%9c%ac)
- [图形界面](#%e5%9b%be%e5%bd%a2%e7%95%8c%e9%9d%a2)
  - [显卡驱动](#%e6%98%be%e5%8d%a1%e9%a9%b1%e5%8a%a8)
  - [桌面环境（以 Xfce 为例）](#%e6%a1%8c%e9%9d%a2%e7%8e%af%e5%a2%83%e4%bb%a5-xfce-%e4%b8%ba%e4%be%8b)
    - [桌面](#%e6%a1%8c%e9%9d%a2)
      - [图标文字的透明背景](#%e5%9b%be%e6%a0%87%e6%96%87%e5%ad%97%e7%9a%84%e9%80%8f%e6%98%8e%e8%83%8c%e6%99%af)
      - [从右键菜单中剔除 Thunar 选项](#%e4%bb%8e%e5%8f%b3%e9%94%ae%e8%8f%9c%e5%8d%95%e4%b8%ad%e5%89%94%e9%99%a4-thunar-%e9%80%89%e9%a1%b9)
          - [多显示器连续壁纸](#%e5%a4%9a%e6%98%be%e7%a4%ba%e5%99%a8%e8%bf%9e%e7%bb%ad%e5%a3%81%e7%ba%b8)
        - [会话](#%e4%bc%9a%e8%af%9d)
          - [锁定屏幕](#%e9%94%81%e5%ae%9a%e5%b1%8f%e5%b9%95)
          - [自启程序](#%e8%87%aa%e5%90%af%e7%a8%8b%e5%ba%8f)
          - [延迟应用程序启动](#%e5%bb%b6%e8%bf%9f%e5%ba%94%e7%94%a8%e7%a8%8b%e5%ba%8f%e5%90%af%e5%8a%a8)
          - [面板的锁定按钮](#%e9%9d%a2%e6%9d%bf%e7%9a%84%e9%94%81%e5%ae%9a%e6%8c%89%e9%92%ae)
          - [禁用保存的会话](#%e7%a6%81%e7%94%a8%e4%bf%9d%e5%ad%98%e7%9a%84%e4%bc%9a%e8%af%9d)
          - [默认窗口管理器](#%e9%bb%98%e8%ae%a4%e7%aa%97%e5%8f%a3%e7%ae%a1%e7%90%86%e5%99%a8)
        - [更换主题](#%e6%9b%b4%e6%8d%a2%e4%b8%bb%e9%a2%98)
        - [声音](#%e5%a3%b0%e9%9f%b3)
          - [声音主题](#%e5%a3%b0%e9%9f%b3%e4%b8%bb%e9%a2%98)
          - [键盘音量键](#%e9%94%ae%e7%9b%98%e9%9f%b3%e9%87%8f%e9%94%ae)
        - [键盘快捷键](#%e9%94%ae%e7%9b%98%e5%bf%ab%e6%8d%b7%e9%94%ae)
        - [Polkit 验证代理](#polkit-%e9%aa%8c%e8%af%81%e4%bb%a3%e7%90%86)
        - [Display blanking](#display-blanking)
      - [提示和小技巧](#%e6%8f%90%e7%a4%ba%e5%92%8c%e5%b0%8f%e6%8a%80%e5%b7%a7)
        - [从 thunar 和 xfdesktop 隐藏分区](#%e4%bb%8e-thunar-%e5%92%8c-xfdesktop-%e9%9a%90%e8%97%8f%e5%88%86%e5%8c%ba)
        - [屏幕截图](#%e5%b1%8f%e5%b9%95%e6%88%aa%e5%9b%be)
        - [禁用终端 F1 和 F11 快捷方式](#%e7%a6%81%e7%94%a8%e7%bb%88%e7%ab%af-f1-%e5%92%8c-f11-%e5%bf%ab%e6%8d%b7%e6%96%b9%e5%bc%8f)
          - [终端颜色主题和调色板](#%e7%bb%88%e7%ab%af%e9%a2%9c%e8%89%b2%e4%b8%bb%e9%a2%98%e5%92%8c%e8%b0%83%e8%89%b2%e6%9d%bf)
          - [修改默认颜色主题](#%e4%bf%ae%e6%94%b9%e9%bb%98%e8%ae%a4%e9%a2%9c%e8%89%b2%e4%b8%bb%e9%a2%98)
        - [终端之 Tango 主题](#%e7%bb%88%e7%ab%af%e4%b9%8b-tango-%e4%b8%bb%e9%a2%98)
        - [SSH 代理](#ssh-%e4%bb%a3%e7%90%86)
        - [滚动时不获得焦点](#%e6%bb%9a%e5%8a%a8%e6%97%b6%e4%b8%8d%e8%8e%b7%e5%be%97%e7%84%a6%e7%82%b9)
        - [修改窗口管理器 modifier](#%e4%bf%ae%e6%94%b9%e7%aa%97%e5%8f%a3%e7%ae%a1%e7%90%86%e5%99%a8-modifier)
      - [常见问题与解答](#%e5%b8%b8%e8%a7%81%e9%97%ae%e9%a2%98%e4%b8%8e%e8%a7%a3%e7%ad%94)
        - [右键菜单没有图标](#%e5%8f%b3%e9%94%ae%e8%8f%9c%e5%8d%95%e6%b2%a1%e6%9c%89%e5%9b%be%e6%a0%87)
        - [NVIDIA 和 xfce4-sensors-plugin](#nvidia-%e5%92%8c-xfce4-sensors-plugin)
        - [面板小程序挤在左边](#%e9%9d%a2%e6%9d%bf%e5%b0%8f%e7%a8%8b%e5%ba%8f%e6%8c%a4%e5%9c%a8%e5%b7%a6%e8%be%b9)
        - [首选应用程序没有效果](#%e9%a6%96%e9%80%89%e5%ba%94%e7%94%a8%e7%a8%8b%e5%ba%8f%e6%b2%a1%e6%9c%89%e6%95%88%e6%9e%9c)
        - [恢复默认设置](#%e6%81%a2%e5%a4%8d%e9%bb%98%e8%ae%a4%e8%ae%be%e7%bd%ae)
        - [会话失败](#%e4%bc%9a%e8%af%9d%e5%a4%b1%e8%b4%a5)
        - [标题栏字体使 xfce4-title 崩溃](#%e6%a0%87%e9%a2%98%e6%a0%8f%e5%ad%97%e4%bd%93%e4%bd%bf-xfce4-title-%e5%b4%a9%e6%ba%83)
        - [笔记本盖设置没有效果](#%e7%ac%94%e8%ae%b0%e6%9c%ac%e7%9b%96%e8%ae%be%e7%bd%ae%e6%b2%a1%e6%9c%89%e6%95%88%e6%9e%9c)
        - [电源管理插件显示剩余时间和百分比](#%e7%94%b5%e6%ba%90%e7%ae%a1%e7%90%86%e6%8f%92%e4%bb%b6%e6%98%be%e7%a4%ba%e5%89%a9%e4%bd%99%e6%97%b6%e9%97%b4%e5%92%8c%e7%99%be%e5%88%86%e6%af%94)
    - [Gnome](#gnome)
    - [KDE](#kde)
  - [窗口管理器](#%e7%aa%97%e5%8f%a3%e7%ae%a1%e7%90%86%e5%99%a8)
  - [显示管理器](#%e6%98%be%e7%a4%ba%e7%ae%a1%e7%90%86%e5%99%a8)
    - [显示管理器列表](#%e6%98%be%e7%a4%ba%e7%ae%a1%e7%90%86%e5%99%a8%e5%88%97%e8%a1%a8)
      - [控制台](#%e6%8e%a7%e5%88%b6%e5%8f%b0)
      - [图形界面](#%e5%9b%be%e5%bd%a2%e7%95%8c%e9%9d%a2-1)
    - [加载显示管理器](#%e5%8a%a0%e8%bd%bd%e6%98%be%e7%a4%ba%e7%ae%a1%e7%90%86%e5%99%a8)
      - [使用 systemd-logind](#%e4%bd%bf%e7%94%a8-systemd-logind)
    - [会话配置](#%e4%bc%9a%e8%af%9d%e9%85%8d%e7%bd%ae)
      - [运行 ~/.xinitrc 会话](#%e8%bf%90%e8%a1%8c-xinitrc-%e4%bc%9a%e8%af%9d)
      - [没有窗口管理启动应用程序](#%e6%b2%a1%e6%9c%89%e7%aa%97%e5%8f%a3%e7%ae%a1%e7%90%86%e5%90%af%e5%8a%a8%e5%ba%94%e7%94%a8%e7%a8%8b%e5%ba%8f)
    - [提示和技巧](#%e6%8f%90%e7%a4%ba%e5%92%8c%e6%8a%80%e5%b7%a7)
      - [自启动](#%e8%87%aa%e5%90%af%e5%8a%a8)
      - [设置语言](#%e8%ae%be%e7%bd%ae%e8%af%ad%e8%a8%80)
- [电源管理](#%e7%94%b5%e6%ba%90%e7%ae%a1%e7%90%86)
  - [ACPI 事件](#acpi-%e4%ba%8b%e4%bb%b6)
  - [CPU 频率调节](#cpu-%e9%a2%91%e7%8e%87%e8%b0%83%e8%8a%82)
  - [笔记本电脑](#%e7%ac%94%e8%ae%b0%e6%9c%ac%e7%94%b5%e8%84%91)
  - [待机和休眠](#%e5%be%85%e6%9c%ba%e5%92%8c%e4%bc%91%e7%9c%a0)
- [多媒体](#%e5%a4%9a%e5%aa%92%e4%bd%93)
  - [声音](#%e5%a3%b0%e9%9f%b3-1)
  - [浏览器插件](#%e6%b5%8f%e8%a7%88%e5%99%a8%e6%8f%92%e4%bb%b6)
    - [Falsh Player](#falsh-player)
      - [Adobe Flash Player](#adobe-flash-player)
        - [安装](#%e5%ae%89%e8%a3%85-1)
        - [更新](#%e6%9b%b4%e6%96%b0)
        - [配置](#%e9%85%8d%e7%bd%ae)
        - [多显示器全屏修复](#%e5%a4%9a%e6%98%be%e7%a4%ba%e5%99%a8%e5%85%a8%e5%b1%8f%e4%bf%ae%e5%a4%8d)
        - [播放受数字版权保护的内容](#%e6%92%ad%e6%94%be%e5%8f%97%e6%95%b0%e5%ad%97%e7%89%88%e6%9d%83%e4%bf%9d%e6%8a%a4%e7%9a%84%e5%86%85%e5%ae%b9)
      - [Shumway](#shumway)
      - [Gnash](#gnash)
      - [Lightspark](#lightspark)
    - [PDF 浏览器](#pdf-%e6%b5%8f%e8%a7%88%e5%99%a8)
      - [PDF.js](#pdfjs)
      - [外部 PDF viewers](#%e5%a4%96%e9%83%a8-pdf-viewers)
    - [中国的在线支付](#%e4%b8%ad%e5%9b%bd%e7%9a%84%e5%9c%a8%e7%ba%bf%e6%94%af%e4%bb%98)
    - [Citrix](#citrix)
    - [Java](#java)
    - [Pipelight](#pipelight)
    - [视频播放插件](#%e8%a7%86%e9%a2%91%e6%92%ad%e6%94%be%e6%8f%92%e4%bb%b6)
      - [其它插件](#%e5%85%b6%e5%ae%83%e6%8f%92%e4%bb%b6)
    - [其他](#%e5%85%b6%e4%bb%96)
      - [Hangouts](#hangouts)
      - [MozPlugger](#mozplugger)
    - [疑难解答](#%e7%96%91%e9%9a%be%e8%a7%a3%e7%ad%94)
      - [Flash 无声音](#flash-%e6%97%a0%e5%a3%b0%e9%9f%b3)
      - [Flash 独占了声音设备](#flash-%e7%8b%ac%e5%8d%a0%e4%ba%86%e5%a3%b0%e9%9f%b3%e8%ae%be%e5%a4%87)
      - [Flash 性能](#flash-%e6%80%a7%e8%83%bd)
      - [Flash 中 webcam 分辨率低](#flash-%e4%b8%ad-webcam-%e5%88%86%e8%be%a8%e7%8e%87%e4%bd%8e)
      - [黑条 in fullscreen video playback on multiheaded desktops](#%e9%bb%91%e6%9d%a1-in-fullscreen-video-playback-on-multiheaded-desktops)
      - [Flash Player: plugin version still shown older version after upgrade](#flash-player-plugin-version-still-shown-older-version-after-upgrade)
      - [插件安装后无法使用](#%e6%8f%92%e4%bb%b6%e5%ae%89%e8%a3%85%e5%90%8e%e6%97%a0%e6%b3%95%e4%bd%bf%e7%94%a8)
      - [Gecko Media Player 无法播放 Apple Trailers](#gecko-media-player-%e6%97%a0%e6%b3%95%e6%92%ad%e6%94%be-apple-trailers)
  - [解码器](#%e8%a7%a3%e7%a0%81%e5%99%a8)
- [网络](#%e7%bd%91%e7%bb%9c-2)
  - [时钟同步](#%e6%97%b6%e9%92%9f%e5%90%8c%e6%ad%a5)
  - [DNS 安全](#dns-%e5%ae%89%e5%85%a8)
  - [DNSSEC 验证](#dnssec-%e9%aa%8c%e8%af%81)
  - [配置防火墙](#%e9%85%8d%e7%bd%ae%e9%98%b2%e7%81%ab%e5%a2%99)
  - [资源共享](#%e8%b5%84%e6%ba%90%e5%85%b1%e4%ba%ab)
- [输入](#%e8%be%93%e5%85%a5)
- [性能优化](#%e6%80%a7%e8%83%bd%e4%bc%98%e5%8c%96)
  - [性能测试](#%e6%80%a7%e8%83%bd%e6%b5%8b%e8%af%95)
    - [独立工具](#%e7%8b%ac%e7%ab%8b%e5%b7%a5%e5%85%b7)
      - [glxgears](#glxgears)
      - [UnixBench](#unixbench)
      - [interbench](#interbench)
      - [ttcp](#ttcp)
      - [iperf](#iperf)
      - [time](#time)
      - [hdparm](#hdparm)
      - [Unigine 引擎](#unigine-%e5%bc%95%e6%93%8e)
      - [gnome-disks](#gnome-disks)
      - [systemd-analyze](#systemd-analyze)
      - [dd](#dd)
      - [dcfldd](#dcfldd)
    - [软件集](#%e8%bd%af%e4%bb%b6%e9%9b%86)
      - [Bonnie++](#bonnie)
      - [IOzone](#iozone)
      - [HardInfo](#hardinfo)
      - [Phoronix 测试集](#phoronix-%e6%b5%8b%e8%af%95%e9%9b%86)
      - [S](#s)
    - [闪存介质](#%e9%97%aa%e5%ad%98%e4%bb%8b%e8%b4%a8)
  - [性能最大化](#%e6%80%a7%e8%83%bd%e6%9c%80%e5%a4%a7%e5%8c%96)
    - [基础工作](#%e5%9f%ba%e7%a1%80%e5%b7%a5%e4%bd%9c)
      - [了解系统](#%e4%ba%86%e8%a7%a3%e7%b3%bb%e7%bb%9f)
      - [跑分](#%e8%b7%91%e5%88%86)
    - [存储设备](#%e5%ad%98%e5%82%a8%e8%ae%be%e5%a4%87)
      - [分散存储](#%e5%88%86%e6%95%a3%e5%ad%98%e5%82%a8)
      - [交换分区/文件](#%e4%ba%a4%e6%8d%a2%e5%88%86%e5%8c%ba%e6%96%87%e4%bb%b6)
      - [组 RAID (简体中文)](#%e7%bb%84-raid-%e7%ae%80%e4%bd%93%e4%b8%ad%e6%96%87)
      - [硬盘的连接方式](#%e7%a1%ac%e7%9b%98%e7%9a%84%e8%bf%9e%e6%8e%a5%e6%96%b9%e5%bc%8f)
      - [分区方案](#%e5%88%86%e5%8c%ba%e6%96%b9%e6%a1%88)
      - [文件系统](#%e6%96%87%e4%bb%b6%e7%b3%bb%e7%bb%9f)
        - [挂载选项](#%e6%8c%82%e8%bd%bd%e9%80%89%e9%a1%b9)
          - [atime 参数](#atime-%e5%8f%82%e6%95%b0)
        - [Reiserfs](#reiserfs)
        - [Btrfs](#btrfs)
          - [准备工作](#%e5%87%86%e5%a4%87%e5%b7%a5%e4%bd%9c)
      - [调整内核参数](#%e8%b0%83%e6%95%b4%e5%86%85%e6%a0%b8%e5%8f%82%e6%95%b0)
      - [Input/output schedulers](#inputoutput-schedulers)
        - [Background information](#background-information)
        - [The scheduling algorithms](#the-scheduling-algorithms)
        - [Kernel's I/O schedulers](#kernels-io-schedulers)
        - [Changing I/O scheduler](#changing-io-scheduler)
        - [Tuning I/O scheduler](#tuning-io-scheduler)
      - [优化 SSD](#%e4%bc%98%e5%8c%96-ssd)
      - [使用 RAM disks](#%e4%bd%bf%e7%94%a8-ram-disks)
    - [CPU](#cpu)
      - [超频](#%e8%b6%85%e9%a2%91)
      - [频率自动调整](#%e9%a2%91%e7%8e%87%e8%87%aa%e5%8a%a8%e8%b0%83%e6%95%b4)
      - [Real-time kernel](#real-time-kernel)
      - [Adjusting priorities of processes](#adjusting-priorities-of-processes)
        - [Ananicy](#ananicy)
        - [cgroups](#cgroups)
        - [Cpulimit](#cpulimit)
      - [irqbalance](#irqbalance)
    - [显卡](#%e6%98%be%e5%8d%a1)
      - [Xorg.conf 配置](#xorgconf-%e9%85%8d%e7%bd%ae)
      - [Driconf](#driconf)
      - [GPU 超频](#gpu-%e8%b6%85%e9%a2%91)
    - [内存及虚拟内存](#%e5%86%85%e5%ad%98%e5%8f%8a%e8%99%9a%e6%8b%9f%e5%86%85%e5%ad%98)
      - [将临时文件转移到 tmpfs](#%e5%b0%86%e4%b8%b4%e6%97%b6%e6%96%87%e4%bb%b6%e8%bd%ac%e7%a7%bb%e5%88%b0-tmpfs)
      - [Swappiness](#swappiness)
      - [Compcache/Zram](#compcachezram)
      - [使用显存](#%e4%bd%bf%e7%94%a8%e6%98%be%e5%ad%98)
      - [预读](#%e9%a2%84%e8%af%bb)
        - [Go-preload](#go-preload)
        - [Preload](#preload)
          - [安装](#%e5%ae%89%e8%a3%85-2)
          - [配置](#%e9%85%8d%e7%bd%ae-1)
    - [系统启动](#%e7%b3%bb%e7%bb%9f%e5%90%af%e5%8a%a8)
      - [待机](#%e5%be%85%e6%9c%ba)
      - [自己编译内核](#%e8%87%aa%e5%b7%b1%e7%bc%96%e8%af%91%e5%86%85%e6%a0%b8)
    - [网络](#%e7%bd%91%e7%bb%9c-3)
  - [固态硬盘](#%e5%9b%ba%e6%80%81%e7%a1%ac%e7%9b%98)
    - [最大化利用 SSD 的技巧](#%e6%9c%80%e5%a4%a7%e5%8c%96%e5%88%a9%e7%94%a8-ssd-%e7%9a%84%e6%8a%80%e5%b7%a7)
      - [分区对齐](#%e5%88%86%e5%8c%ba%e5%af%b9%e9%bd%90)
      - [TRIM](#trim)
        - [检验 TRIM 支持](#%e6%a3%80%e9%aa%8c-trim-%e6%94%af%e6%8c%81)
        - [通过挂载参数启用 TRIM](#%e9%80%9a%e8%bf%87%e6%8c%82%e8%bd%bd%e5%8f%82%e6%95%b0%e5%90%af%e7%94%a8-trim)
        - [通过 cron 应用 TRIM](#%e9%80%9a%e8%bf%87-cron-%e5%ba%94%e7%94%a8-trim)
        - [通过 systemd 服务应用 TRIM](#%e9%80%9a%e8%bf%87-systemd-%e6%9c%8d%e5%8a%a1%e5%ba%94%e7%94%a8-trim)
        - [用 tune2fs 启用 TRIM(不推荐)](#%e7%94%a8-tune2fs-%e5%90%af%e7%94%a8-trim%e4%b8%8d%e6%8e%a8%e8%8d%90)
        - [为 LVM 启用 TRIM](#%e4%b8%ba-lvm-%e5%90%af%e7%94%a8-trim)
        - [为 dm-crypt 启用 TRIM](#%e4%b8%ba-dm-crypt-%e5%90%af%e7%94%a8-trim)
      - [I/O 调度器](#io-%e8%b0%83%e5%ba%a6%e5%99%a8)
        - [内核参数(针对单个设备)](#%e5%86%85%e6%a0%b8%e5%8f%82%e6%95%b0%e9%92%88%e5%af%b9%e5%8d%95%e4%b8%aa%e8%ae%be%e5%a4%87)
        - [针对单个设备或者 HDD/SDD 混合情况使用 udev](#%e9%92%88%e5%af%b9%e5%8d%95%e4%b8%aa%e8%ae%be%e5%a4%87%e6%88%96%e8%80%85-hddsdd-%e6%b7%b7%e5%90%88%e6%83%85%e5%86%b5%e4%bd%bf%e7%94%a8-udev)
      - [SSD 上的交换空间](#ssd-%e4%b8%8a%e7%9a%84%e4%ba%a4%e6%8d%a2%e7%a9%ba%e9%97%b4)
      - [Hdparm 显示 "frozen" 状态](#hdparm-%e6%98%be%e7%a4%ba-%22frozen%22-%e7%8a%b6%e6%80%81)
      - [SSD 存储单元清除](#ssd-%e5%ad%98%e5%82%a8%e5%8d%95%e5%85%83%e6%b8%85%e9%99%a4)
      - [处理 NCQ 错误](#%e5%a4%84%e7%90%86-ncq-%e9%94%99%e8%af%af)
    - [最小化硬盘读写](#%e6%9c%80%e5%b0%8f%e5%8c%96%e7%a1%ac%e7%9b%98%e8%af%bb%e5%86%99)
      - [智能分区方案](#%e6%99%ba%e8%83%bd%e5%88%86%e5%8c%ba%e6%96%b9%e6%a1%88)
      - [noatime 挂载参数](#noatime-%e6%8c%82%e8%bd%bd%e5%8f%82%e6%95%b0)
      - [将频繁使用的文件置于内存](#%e5%b0%86%e9%a2%91%e7%b9%81%e4%bd%bf%e7%94%a8%e7%9a%84%e6%96%87%e4%bb%b6%e7%bd%ae%e4%ba%8e%e5%86%85%e5%ad%98)
        - [浏览器配置文件](#%e6%b5%8f%e8%a7%88%e5%99%a8%e9%85%8d%e7%bd%ae%e6%96%87%e4%bb%b6)
        - [其他](#%e5%85%b6%e4%bb%96-1)
      - [tmpfs 里编译](#tmpfs-%e9%87%8c%e7%bc%96%e8%af%91)
      - [文件系统上禁用日志](#%e6%96%87%e4%bb%b6%e7%b3%bb%e7%bb%9f%e4%b8%8a%e7%a6%81%e7%94%a8%e6%97%a5%e5%bf%97)
    - [文件系统选择](#%e6%96%87%e4%bb%b6%e7%b3%bb%e7%bb%9f%e9%80%89%e6%8b%a9)
      - [Btrfs](#btrfs-1)
      - [Ext4](#ext4)
      - [XFS](#xfs)
      - [JFS](#jfs)
      - [其他文件系统](#%e5%85%b6%e4%bb%96%e6%96%87%e4%bb%b6%e7%b3%bb%e7%bb%9f)
    - [固件升级](#%e5%9b%ba%e4%bb%b6%e5%8d%87%e7%ba%a7)
      - [ADATA](#adata)
      - [Crucial](#crucial)
      - [Kingston](#kingston)
      - [Mushkin](#mushkin)
      - [OCZ](#ocz)
      - [Samsung](#samsung)
      - [SanDisk](#sandisk)
- [系统服务](#%e7%b3%bb%e7%bb%9f%e6%9c%8d%e5%8a%a1)
  - [文件索引和搜索](#%e6%96%87%e4%bb%b6%e7%b4%a2%e5%bc%95%e5%92%8c%e6%90%9c%e7%b4%a2)
  - [打印](#%e6%89%93%e5%8d%b0)
  - [本地邮件交换](#%e6%9c%ac%e5%9c%b0%e9%82%ae%e4%bb%b6%e4%ba%a4%e6%8d%a2)
- [外观美化](#%e5%a4%96%e8%a7%82%e7%be%8e%e5%8c%96)
  - [字体](#%e5%ad%97%e4%bd%93)
    - [Font configuration](#font-configuration)
  - [GTK 和 Qt 主题](#gtk-%e5%92%8c-qt-%e4%b8%bb%e9%a2%98)
- [控制台优化](#%e6%8e%a7%e5%88%b6%e5%8f%b0%e4%bc%98%e5%8c%96)
  - [Tab 自动补全](#tab-%e8%87%aa%e5%8a%a8%e8%a1%a5%e5%85%a8)
  - [别名](#%e5%88%ab%e5%90%8d)
  - [命令别名](#%e5%91%bd%e4%bb%a4%e5%88%ab%e5%90%8d)
  - [其他 shells](#%e5%85%b6%e4%bb%96-shells)
  - [Bash 增强功能](#bash-%e5%a2%9e%e5%bc%ba%e5%8a%9f%e8%83%bd)
  - [彩色输出](#%e5%bd%a9%e8%89%b2%e8%be%93%e5%87%ba)
  - [压缩文件](#%e5%8e%8b%e7%bc%a9%e6%96%87%e4%bb%b6)
    - [控制台提示符](#%e6%8e%a7%e5%88%b6%e5%8f%b0%e6%8f%90%e7%a4%ba%e7%ac%a6)
    - [Emacs shell](#emacs-shell)
  - [鼠标支持](#%e9%bc%a0%e6%a0%87%e6%94%af%e6%8c%81)
    - [安装](#%e5%ae%89%e8%a3%85-3)
      - [台式机](#%e5%8f%b0%e5%bc%8f%e6%9c%ba)
      - [笔记本](#%e7%ac%94%e8%ae%b0%e6%9c%ac)
    - [配置](#%e9%85%8d%e7%bd%ae-2)
  - [页面回滚缓冲](#%e9%a1%b5%e9%9d%a2%e5%9b%9e%e6%bb%9a%e7%bc%93%e5%86%b2)
  - [会话管理](#%e4%bc%9a%e8%af%9d%e7%ae%a1%e7%90%86)
- [系统中文化](#%e7%b3%bb%e7%bb%9f%e4%b8%ad%e6%96%87%e5%8c%96)
- [中国大陆用户的推荐解决方案](#%e4%b8%ad%e5%9b%bd%e5%a4%a7%e9%99%86%e7%94%a8%e6%88%b7%e7%9a%84%e6%8e%a8%e8%8d%90%e8%a7%a3%e5%86%b3%e6%96%b9%e6%a1%88)
  - [办公](#%e5%8a%9e%e5%85%ac)
  - [中文输入法](#%e4%b8%ad%e6%96%87%e8%be%93%e5%85%a5%e6%b3%95)
  - [在线音乐](#%e5%9c%a8%e7%ba%bf%e9%9f%b3%e4%b9%90)
  - [代理](#%e4%bb%a3%e7%90%86)
  - [即时通讯工具](#%e5%8d%b3%e6%97%b6%e9%80%9a%e8%ae%af%e5%b7%a5%e5%85%b7)
  - [电子商务](#%e7%94%b5%e5%ad%90%e5%95%86%e5%8a%a1)
  - [校园网](#%e6%a0%a1%e5%9b%ad%e7%bd%91)
- [其他软件包](#%e5%85%b6%e4%bb%96%e8%bd%af%e4%bb%b6%e5%8c%85)
  - [实用工具](#%e5%ae%9e%e7%94%a8%e5%b7%a5%e5%85%b7)


# 安装前的准备

-   一台裸机
-   刻录好 Arch Linux 镜像的 CD 或 USB 驱动器

```shell
ls /sys/firmware/efi/efivars  # 验证系统以 EFI 模式启动
```

## 网络

### 激活和连接

```shell
ip link # 查看网络接口

# 激活有线网卡
ip link set 有线网卡接口名 up

# 激活无线网卡和连接（无线）网
ip link set 无线网卡接口名 up
wpa_supplicant -i 无线网卡接口名 -c <(wpa_passphrase SSID password)

# 使用 DHCP Client 获取动态 IP
dhcpcd wlan0

# 使用静态 IP
ip addr add 192.168.1.23/24 broadcast 192.168.1.255 dev wlan0
ip route add default via 192.168.1.1
```

### 关闭和禁用

```shell
ip link set dev 接口名 down  # 要关闭连接，可以禁用接口

# 禁用接口前，先刷新 IP 地址和网关
ip addr flush dev 接口名
ip route flush dev 接口名
```

## 更新系统时间

```shell

timedatectl set-ntp true  # 使用 timedatectl 命令确保系统时间准确
# 使用`-h`参数查看可使用的命令
timedatectl -h
# 检查服务状态
timedatectl status
```

## 分区

### 创建和格式化分区

```shell
fdisk -l  # 列出所有磁盘

fdisk /dev/sdX  # 对/dev/sdX 磁盘进行编辑

# 分别创建:
# - EFI 分区 /dev/sdX1
# - root 分区 /dev/sdX2
# - 交换分区 /dev/sdX3

# 分区创建完后，保存并退出 fdisk，在 shell 中进行分区格式化：

mkfs.fat -F32 /dev/sdX1 # EFI 分区，格式化为 FAT32，大小取 256MB～512MB ，比如 384MB

mkfs.btrfs -L 'root' /dev/sdX2  # root 分区，格式化为 BtrFS

mkswap /dev/sdX3  # 如果创建了交换分区（例如 /dev/sdX3），使用 mkswap 初始化
swapon /dev/sdX3  # 激活交换分区
```

### 挂载分区

```shell
mount /dev/sdX2 /mnt  # root 分区挂载到 /mnt

mkdir /mnt/efi  # 创建 efi 目录

mount /dev/sdX1 /mnt/efi  # EFI 分区挂载到 /mnt/efi
```

# 安装

```shell
vi /etc/pacman.d/mirrorlist # 有时需手动调整镜像顺序，保证下载速度

pacstrap /mnt base linux linux-firmware # 基本系统安装
```

## Fstab

```shell
genfstab -U /mnt >> /mnt/etc/fstab  # 生成 fstab 文件 (用 -U 或 -L 选项设置UUID 或卷标)

vi /mnt/etc/fstab # 生成后可根据个人需求对 fstab 进行修改，如固态硬盘在挂载选项中加上 noatime 和 discard 项
```

## Chroot

```shell
arch-chroot /mnt  # Change root 到新安装的系统，后面的操作均在新系统内完成
pacman -Syu base-devel reflector git # 基本软件
systemctl enable dhcpcd
systemctl enable sshd
```

## 网络

```shell

echo 'linux' > /etc/hostname # 创建 hostname 文件

# 添加对应的信息到 hosts
cat << EOF >> /etc/hosts
127.0.0.1	localhost
::1		localhost
127.0.1.1	linux.localdomain	linux
EOF
```

## Initramfs

```shell
# 一般执行 pacstrap 时已安装 linux，不需要创建 initramfs，mkinitcpio 会自动运行

mkinitcpio -p linux # 对于 LVM、system encryption 或 RAID，修改 mkinitcpio.conf 并重建 Initramfs
```

## 安装 GRUB

> **Note:**
> 需要 **grub** 软件包

```shell
# UEFI系统，自定义引导标识（这里是VRUB），--removable 选项把 GRUB 安装到 esp/EFI/BOOT/BOOTX64.EFI
grub-install --target=x86_64-efi --efi-directory=/efi --bootloader-id=VRUB --removable

# （使用 i386-efi 时是 `esp/EFI/BOOT/BOOTIA32.EFI`），
# 此时即使 EFI 变量重设或把当前驱动器接到其他电脑上，
# 仍可从这个驱动器上启动。
# 如果和 Windows 一起多系统启动，Windows 通常会在那里安装一个 EFI 可执行程序，
# 只是为了重建 Windows 的 UEFI 启动项。

# 编辑
vi /etc/default/grub
GRUB_THEME="/boot/grub/themes/starfiled/theme.txt"  # 指定主题文件位置
```

### 探测其他操作系统

想让 grub-mkconfig 探测并自动添加其他已安装系统到启动菜单中，
安装 **os-prober** 并挂载包含其它系统的磁盘分区。
然后重新运行 `grub-mkconfig`。

os-prober 通常自动发现包含 Windows 的分区，但有时因为载入默认 Linux 驱动，NTFS 分区不被探测到。
如果 GRUB 没能发现 NTFS 分区，尝试安装 **ntfs-3g**，然后重新挂载该分区。

加密 Windows 分区需要解密后挂载。对于 BitLocker，可使用 **dislocker**。

### 微码

grub-mkconfig 自动发现微码更新并更新 GRUB 配置信息。
安装微码软件包后，重新生成 GRUB 配置以激活更新：

```shell
`grub-mkconfig -o /boot/grub/grub.cfg`
```

## 重启

exit 或 <Ctrl+D> 退出 chroot 环境

> **Tip:**
> 用 umount -R /mnt 手动卸载分区可发现“繁忙”的分区，便于通过 fuser 排查。

## 时区和本地化

```shell
# 设置时区
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# 运行 hwclock(8) 生成 /etc/adjtime
hwclock --systohc
# 这个命令假定硬件时间已经被设置为 UTC 时间
# 详细信息请查看 System time#Time standard

vi /etc/locale.gen  # 修改 /etc/locale.gen 准备生成指定的本地化文件

en_US.UTF-8 UTF-8
ja_JP.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
zh_HK.UTF-8 UTF-8
zh_TW.UTF-8 UTF-8

locale-gen  # 执行 locale-gen 生成 locale 信息
echo 'LANG=en_US.UTF-8' > /etc/locale.conf  # 修改系统默认语言为 UTF-8 英语
```

## 创建用户

```shell

useradd -m -G wheel -s /bin/bash 用户名 # 用无密码 root 用户登录，新建一个用户
passwd 用户名 # 设置密码
visudo  # 允许 wheel 用户组使用 sudo

# man sudoers says:

#     Once a user has been authenticated, [...] the user may then use sudo without a password for a short period of time (5 minutes unless overridden by the timestamp_timeout option).

# To change the timeout, run, sudo visudo and add the line:

# Defaults        timestamp_timeout=30

# where 30 is the new timeout in minutes.

# To always require a password, set to 0. To set an infinite timeout, set the value to be negative.

# To totally disable the prompt for a password for user ravi:

# Defaults:ravi      !authenticate

passwd root # 给 root 用户指定一个强密码
exit  # 退出 root 以新用户身份登录
```

## 缩短系统启动、停止会话的等待时间

默认等待时间 90s 相对于现代很多电脑的性能来说太长了，修改为 20s
编辑 `/etc/systemd/system.conf` ,将 `DefaultTimeoutStartSec` 和 `DefaultTimeoutStopSec` 的值改为 20s 或更短

## 运行安装脚本

```
# 一键安装 Arch Linux

```

# 图形界面

参阅 [X server]

## 显卡驱动

```shell
### 通用设置
# Linux 内核包含开源视频驱动，支持硬件加速
# OpenGL 和 X11 的 2D 加速需要用户空间工具
sudo pacman -S xorg # 安装 Xorg

# 查询显卡类型
lspci | grep -e VGA -e 3D

# 安装对应驱动
# 查看所有开源驱动
sudo pacman -Ss xf86-video

# Xorg 按以下顺序自动搜索安装的驱动：
# 1.如无法找到设备在表中列出的驱动，首先查看是否安装 fbdev (xf86-video-fbdev).
# 2.如果依然没有找到，会搜索 vesa (xf86-video-vesa), 这是一个支持大部分显卡的通用驱动，不提供任何 2D 和 3D 加速功能。
# 3.如果没有找到 vesa，Xorg 会使用 kernel mode setting, 这个驱动提供了 GLAMOR 加速 (参考 modesetting(4)).
# 充分发挥显卡性能，请按[下表][X org]安装驱动程序。
# 推荐先使用开源驱动，这些驱动出问题的可能性较小。

# 默认 vesa 显卡驱动兼容大多数显卡，但通过为ATI ，Intel或NVIDIA产品安装适当驱动，
# 可明显改善性能并利用附加功能。
# 根据显卡制造商分别参见：ATI (简体中文)，Intel (简体中文)，NVIDIA (简体中文)

### ATI
# ATI/AMD显卡用户可选：
# - 官方的专有驱动(catalyst)
# - 开源驱动 (ATI 和 AMDGPU)。
# 本文主要介绍较旧显卡使用开源 ATI/Radeon 驱动。
# 选择正确的驱动参考Xorg#AMD
# 在很多显卡上开源驱动的性能几乎已经达到和闭源驱动一样的水平。
# （参见）同时开源驱动有不错的多显支持，
# 如果不确定该用哪种，尝试开源版的。
# 开源驱动满足大多数需要，一般来说遇到的麻烦也更少。
# 查看现在功能开发进展情况可访问 功能矩阵。
# 这个页面可以将市场名(例如 Radeon HD4330) 映射到芯片组名(例如 R700).

### Intel
# Intel 提供和支持 X.Org 开源驱动基本即插即用

### Nvidia
# 安装和配置 NVIDIA 专有 显卡驱动
# 想要了解开源驱动的信息，参见 Nouveau.
# 如果您使用基于 hybrid Intel/NVIDIA的双显卡笔记本,
# 参见 NVIDIA Optimus 内容。

# 如需 GPU 加速，安装下面三个 AUR 包中的一个

yay -Syu nvclock  # Nvidia
yay -Syu rovclock # ATI
yay -Syu gmabooster # Intel
```

## 桌面环境（以 Xfce 为例）

```shell
########## 桌面环境 ##########

# Xorg 只提供图形环境基本框架，完整用户体验需要其他组件。
# 桌面环境(DE): 在X之上并与其共同运作，提供完整的功能和动态图形界面。
# 通常提供图标、小程序（applets）、窗口、工具栏、文件夹、壁纸、应用程序和拖放等功能
# 常用：GNOME、KDE、LXDE、Xfce

########## Xfce4 ##########

# 1.安装

# 安装 xfce4 包组。有需要还可安装 xfce4-goodies 包组。
# 此包组提供了一些额外的插件和一些有用的工具，如 mousepad 编辑器
# xfce4-whiskermenu-plugin 一个非常好的可选应用启动器
# 安装完成后，可以替换掉面板1的第一个项目“应用程序菜单”：
# 设置/面板/项目 选择 添加Whisker菜单
#
# Xfce 默认使用 Xfwm 作为窗口管理器
#
sudo pacman -Syu xfce4 xfce4-goodies xorg-xprop light-locker xfce4-pulseaudio-plugin

# 2. 配置

# Xfce 把配置的选项保存到 Xfconf。通过以下方式修改这些选项：
# - 主菜单中，选择 设置和要自定义的类别
#   类别是通常位于 /usr/bin/xfce4-* 和 /usr/bin/xfdesktop-settings 中的程序
# - xfce4-settings-editors 查看和修改所有设置
#   修改的选项会立即生效
#   使用xfconf-query从命令行更改设置；文档有更多的细节
# - 设置保存 XML 文件中,
#   位于 ~/.config/xfce4/xfconf/ xfce-perchannel-xml/，
#   可手动修改，但不会立即生效。

# 2.1 编辑菜单项
# 许多图形工具可以实现此需求：
# MenuLibre — 一个高级的菜单编辑器，提供了一个纯粹、易用的界面
#yay -S menulibre
# Alacarte — GNOME的菜单编辑器。
sudo pacman -Syu alacarte

# 当然，也可以手动创建 ~/.config/menus/xfce-applications.menu
# Wiki 上有示例

# 2.2 桌面
# 2.2.1 关闭窗口快捷键
# Xfce没有关闭窗口的快捷键，程序假死时可能需要这样的快捷键
# 使用 xorg-xkill，xkill 可以交互关闭窗口。对于当前激活窗口，使用包 xdotool：
xdotool getwindowfocus windowkill
# 或
sh -c "xkill -id $(xprop -root -notype | sed -n '/^_NET_ACTIVE_WINDOW/ s/^.*# *\|\,.*$//g p')"

# 添加快捷键，使用 设置 > 键盘 或者使用应用程序，如 xbindkeys

```

### 桌面

#### 图标文字的透明背景

默认桌面图标文字白色背景，可以创建或修改 ~/.gtkrc-2.0 得到不一样的效果：

```
style "xfdesktop-icon-view" {
    XfdesktopIconView::label-alpha = 10
    base[NORMAL] = "#000000"
    base[SELECTED] = "#71B9FF"
    base[ACTIVE] = "#71B9FF"
    fg[NORMAL] = "#fcfcfc"
    fg[SELECTED] = "#ffffff"
    fg[ACTIVE] = "#ffffff"
}
widget_class "*XfdesktopIconView*" style "xfdesktop-icon-view"
```

#### 从右键菜单中剔除 Thunar 选项

使用如下的命令：

`xfconf-query -c xfce4-desktop -v --create -p /desktop-icons/style -t int -s 0`

###### 多显示器连续壁纸

打开 xfce4-settings-editor 创建如下的属性

```
Property: /backdrop/screen0/xinerama-stretch
Type: Boolean
Value: TRUE|1|Enabled
```

##### 会话

###### 锁定屏幕

要通过 xflock4 脚本锁定 Xfce4 会话，可以从下面软件列表中选择安装一个：xscreensaver, gnome-screensaver, slock 和 xlockmore。

或者，可以设置锁定命令：

`xfconf-query -c xfce4-session -p /general/LockCommand -s "light-locker-command -l" --create -t string`

更新命令可以使用：

`xfconf-query -c xfce4-session -p /general/LockCommand -s "light-locker-command -l"`

List of applications/Security#Screen lockers 包含一个全面的屏幕锁定程序列表。

> **Tip:**
> light-locker 是和 xfce4-power-manager 相整合的。
> 安装 light-locker 后,电源管理设定中会出现安全标签页。现有的系统休眠时锁定屏幕选项会集成到安全标签页中。

###### 自启程序

_程序 > 设置 > 设置管理器 > 会话和自启动_ 中点击应用程序自启动，设置 Xfce 自启动程序。
此处列出了所有自启动的程序。点击 _添加_ 按钮，指定可执行文件的路径，可以添加自定义自启任务。

当然也可将要执行的命令（包括设置环境变量）加入 xinitrc。如果使用 _显示管理器_，则加入 xprofile。

###### 延迟应用程序启动

延迟某应用程序启动有时可能很有用。在应用程序自启动中指定类似 `sleep 3 && command` 的命令不会起作用。作为一个解决办法，可以使用：

`sh -c "sleep 3 && command"`

###### 面板的锁定按钮

活动按钮面板的锁定按钮直接执行 /usr/bin/xflock4，就忽略了上面的 /general/LockCommand 设置和这里阐述的设置别名的方法。

**使用 light-locker 两种方法**：

-   编辑 /usr/bin/xflock4 来直接执行 `light-locker-command -l`。
    不应该用于多用户系统，而且更新软件包的时候不能覆写。
-   用自定义启动器替换活动按钮提供的锁定按钮。
    在活动按钮设置里移除锁定按钮，向面板中添加一个启动器，
    把 Command 设置为 `light-locker-command -l`，
    把图标设置成 system-lock-screen。

###### 禁用保存的会话

通过下面命令禁用某用户已保存的会话：

`xfconf-query -t bool -c xfce4-session -p /general/SaveOnExit -s false`

然后进入 _应用程序 -> 设置 -> 会话和启动 -> 会话_ 点击 _清除已保存的会话_ 。

> **Tip:**
> 如果上面命令无法持久生效，可以使用：
>
> `xfconf-query -c xfce4-session -p /general/SaveOnExit -n -t bool -s false`

Xfce [kiosk 模式][kiosk mode] 可用来彻底禁用对话保存。
要禁用对话，创建或者编辑 /etc/xdg/xfce4/kiosk/kioskrc 加入如下内容：

```
\[xfce4-session\]
SaveSession=NONE
```

如果 kiosk 模式不起作用，可以给会话目录设置只读权限：

`rm ~/.cache/sessions/* && chmod 500 ~/.cache/sessions`

此操作防止 Xfce 保存所有的会话，即使任何别的设置允许保存会话。

###### 默认窗口管理器

> **Note:**
> 要使更改生效，需清除保存的会话，并确保在首次注销时禁用会话保存。
> 一旦选择的窗口管理器正在运行，可以再次启用会话保存。

窗口管理器的设定保存在：

-   /etc/xdg/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml - 系统设置
-   ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-session.xml - 用户设置

单个用户的默认窗口管理器可以用 xfconf-query 命令设置：

`xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -sa wm_name`

如使用命令行选项启动窗口管理器：

`xfconf-query -c xfce4-session -p /sessions/Failsafe/Client0_Command -t string -t string -s wm_name -s --wm-option`

如需更多命令行选项，只需向其中添加更多 `-t string` 和 `-s --wm-option` 参数。

如需更改整个系统的默认窗口管理器，手动编辑上面指定的文件，
将 xfwm4 改为首选窗口管理器，并添加更多选项（如果需要）。

要更改窗口管理器，还可以设置 `wm_name --replace` 自启动，或者在终端中运行 `wm_name --replace &` 并确保在注销时保存会话。

> **Note:**
> 该方法并没有真正地更改默认窗口管理器，而只是每次开机时将其替换掉。
> 如果你使用自动启动工具，应该禁用保存的会话，因为这可能导致新的窗口管理器在默认窗口管理器之后启动两次。

##### 更换主题

在 xfce-look.org 上有不少 XFCE 的主题。
Xfwm 的主题保存在 /usr/share/themes/xfce4,
在 _设置 > 窗口管理器_ 中可更改主题。
而 GTK+ 主题在 _设置 > 外观_ 设置。

如果想要使所有的应用能有一个统一的外观,
参见 [Uniform look for Qt and GTK applications][unilook] 获得更多的信息。

另参见 [Cursor themes][cursortheme], [Icons][icons], 和 [Font configuration][fonts]。

[unilook]: https://wiki.archlinux.org/index.php/Uniform_look_for_Qt_and_GTK_applications
[cursortheme]: https://wiki.archlinux.org/index.php/Cursor_themes
[icons]: https://wiki.archlinux.org/index.php/Icons
[fonts]: https://wiki.archlinux.org/index.php/Font_configuration

##### 声音

###### 声音主题

XFCE4 支持 freedesktop system sounds，但需要配置。

启用声音主题：

安装 libcanberra 和 libcanberra-pulse 以提供 PulseAudio 支持。
"canberra-gtk-module" 应该在 GTK_MODULES 环境变量 （需要重新登陆）；
在 _设置管理器 → 外观 → 设置_ 选项卡 勾选 "启用事件声音"；
在 设置编辑器（Settings Editor） 设置 "xsettings/Net/SoundThemeName" 为一个在 /usr/share/sounds/ 下的声音主题；
在混声器里（比如 pavucontrol）打开系统声音（System Sounds）。
sound-theme-freedesktop 提供兼容的声音主题，但是不好用。推荐 sound-theme-smooth （上面的 SoundThemeName 设置为 "Smooth"）。

###### 键盘音量键

**xfce4-pulseaudio-plugin** 提供了一个面板小程序，它支持键盘音量控制和音量提示。或者，可以用不提供面板图标的 **xfce4-volumed-pulse**，还提供键绑定和通知控制。当同时使用 pasystray 进行更细微的控制时会很方便。

还可以用 xfce4-mixer，它同样提供面板小程序和键盘快捷键，并支持 Alsa。然而，请注意，它是基于已在 1.0 中放弃的 GStreamer 0.10 的功能。

List of applications#Volume managers[broken link: invalid section] 下有和特定桌面无关的选项替代。

> **快捷键**
> 如不使用控制音量键的小程序或守护程序，则可以使用 Xfce 的键盘设置手动将音量控制命令映射到音量键。对于您正在使用的音响系统，请参阅以下链接到相应命令的部分。
>
> -   ALSA: Advanced Linux Sound Architecture#Keyboard volume control.
> -   PulseAudio: PulseAudio#Keyboard volume control
> -   OSS: OSS#Using multimedia keys with OSS.

##### 键盘快捷键

键盘快捷键在两个地方设置： _设置 > 窗口管理器 > 键盘_ 和 _设置 > 键盘 > 快捷键_。

##### Polkit 验证代理

在安装 xfce4-session 时，会同时安装 polkit-gnome，并随系统自动启动;无需用户干预。更多信息请参见 Polkit#Authentication agents。

Xfce 可用的第三方 Polkit 身份认证代理，参见 xfce-polkit-git 和 xfce-polkit。

##### Display blanking

Note: There are some issues associated with blanking and resuming from blanking in some configurations. See [1][2].
Some programs that are commonly used with Xfce will control monitor blanking and DPMS (monitor powersaving) settings. They are discussed below.

Xfce Power Manager
Xfce Power Manager will control blanking and DPMS settings. These settings can be configured by running xfce4-power-manager-settings and clicking the Display tab. Note that unticking the Handle display power management option means that the Power Manager will disable DPMS - it does not mean that the Power Manager will relinquish control of DPMS. Also note that it will not disable screen blanking. To disable both blanking and DPMS, right click on the power manager system tray icon or left click on the panel applet and make sure that the option labelled Presentation mode is ticked.

XScreenSaver

> ![Tango-view-refresh-red](.git_images/Tango-view-refresh-red.png)
> This article or section is out of date.
>
> **Reason:** With xfce4-power-manager>1.5.1 the issue described below should in theory no longer apply. [3]
> (Discuss in Talk:Xfce (简体中文)#)
> ![Tango-view-refresh-red](.git_images/Tango-view-refresh-red.png)

See XScreenSaver#DPMS and blanking settings. Note that if XScreenSaver is running alongside Xfce Power Manager, it may not be entirely clear which application is in control of blanking and DPMS as both applications are competing for control of the same settings. Therefore, in a situation where it is important that the monitor not be blanked (when watching a film for instance), it is advisable to disable blanking and DPMS through both applications.

xset

If neither of the above applications are running, then blanking and DPMS settings can be controlled using the xset command, see DPMS#Modifying DPMS and screensaver settings using xset[broken link: invalid section].

#### 提示和小技巧

##### 从 thunar 和 xfdesktop 隐藏分区

如果你的系统分区在桌面和 Thunar 中被显示成已加载分区，可以安装 **gvfs** 试试。
在 Udisks#Hide selected partitions 参见更多的选项。

##### 屏幕截图

Xfce 自己的截图工具 **xfce4-screenshooter**。是 xfce4-goodies 包组的一部分。

到 应用程序 > 设置 > 键盘, 应用程序快捷方式. 添加 `xfce4-screenshooter -f` (或 -w 活动窗口截图)命令用 Print 键截屏

也可用其他独立截图程序如 scrot。

##### 禁用终端 F1 和 F11 快捷方式

XFCE 终端下 F1 和 F11 分别被绑定给帮助和全屏，给一些程序造成了冲突。
要禁用这些快捷方式，创建或修改下面的配置文件然后注销重新登录。F10 可以在设置里更改。

```shell
~/.config/xfce4/terminal/accels.scm
(gtk_accel_path "<Actions>/terminal-window/fullscreen" "")
(gtk_accel_path "<Actions>/terminal-window/contents" "")
```

###### 终端颜色主题和调色板

可以在首选项的外观标签下修改终端主题颜色和调色板。
这些色彩可用于多大数控制台程序如 Emacs，Vi 等。
它们的设置单独存储在每个用户的 ~/.config/xfce4/terminal/terminalrc 文件中。
还有更多主题可供选择。
论坛下 Terminal Colour Scheme Screenshots 有数百的更多终端配色方案。

###### 修改默认颜色主题

XFCE 的 extra/terminal 包使用了较暗的颜色使得文字在默认的黑色背景下很难阅读并会使人感到不适，请把以下文字写入到 terminalrc 文件中来使用一个较明亮的颜色主题, 它会在一直在较暗的终端背景下可见。

```shell
~/.config/xfce4/terminal/terminalrc
ColorPalette5=#38d0fcaaf3a9
ColorPalette4=#e013a0a1612f
ColorPalette2=#d456a81b7b42
ColorPalette6=#ffff7062ffff
ColorPalette3=#7ffff7bd7fff
ColorPalette13=#82108210ffff
```

##### 终端之 Tango 主题

用你喜欢的编辑器打开 ~/.config/xfce4/terminal/terminalrc 加入：

```
ColorForeground=White
ColorBackground=#323232323232
ColorPalette1=#2e2e34343636
ColorPalette2=#cccc00000000
ColorPalette3=#4e4e9a9a0606
ColorPalette4=#c4c4a0a00000
ColorPalette5=#34346565a4a4
ColorPalette6=#757550507b7b
ColorPalette7=#060698989a9a
ColorPalette8=#d3d3d7d7cfcf
ColorPalette9=#555557575353
ColorPalette10=#efef29292929
ColorPalette11=#8a8ae2e23434
ColorPalette12=#fcfce9e94f4f
ColorPalette13=#72729f9fcfcf
ColorPalette14=#adad7f7fa8a8
ColorPalette15=#3434e2e2e2e2
ColorPalette16=#eeeeeeeeecec
```

##### SSH 代理

默认 Xfce 4.10 会在会话启动时试着按顺序打开 gpg-agent 或 ssh-agent。
要禁用的话，运行如下命令：

`xfconf-query -c xfce4-session -p /startup/ssh-agent/enabled -n -t bool -s false`

若 gpg-agent 安装了也要启动 ssh-agent 的话运行：

`xfconf-query -c xfce4-session -p /startup/ssh-agent/type -n -t string -s ssh-agent`

要使用 GNOME Keyring，在设置里的会话和启动的高级页选中桌面启动时启动 GNOME 服务。
这还会禁止 gpg-agent 和 ssh-agent 的启动。

参见：http://docs.xfce.org/xfce/xfce4-session/advanced

##### 滚动时不获得焦点

在 _设置 > 窗口管理器微调 > 辅助功能_ 下取消 _按下任意鼠标按钮时提升窗口_。

##### 修改窗口管理器 modifier

默认的 modifier 是 Alt。可以用 xfconf-query 更改。
比如说下面的命令会将其改为 Super：

`xfconf-query -c xfwm4 -p /general/easy_click -n -t string -s "Super"`

严格地说，并不支持多 modifier。可是实际可以用 >< 把多个键分隔起来。比如下面的命令会把 modifier 改为 Ctrl+Alt：

`xfconf-query -c xfwm4 -p /general/easy_click -n -t string -s "Ctrl><Alt"`

#### 常见问题与解答

##### 右键菜单没有图标

> **Note:**
> GConf 已被不建议使用，但这个方法还有效。

有时一些程序，包括用 Qt 写的程序的右键菜单没有图标。
这个问题只发生在 Xfce 下。运行如下命令:

```shell
gconftool-2 --type boolean --set /desktop/gnome/interface/buttons_have_icons true
gconftool-2 --type boolean --set /desktop/gnome/interface/menus_have_icons true
```

##### NVIDIA 和 xfce4-sensors-plugin

要探测 NVIDIA gpu 的温度，需要安装 **libxnvctrl** 并且用 ABS 重新编译 **xfce4-sensors-plugin** 软件包。
或者改安装 **xfce4-sensors-plugin-nvidia**。

##### 面板小程序挤在左边

添加一个分割符并选中”扩展”属性。

##### 首选应用程序没有效果

大多数程序依赖 xdg-open 来用首选应用程序打开想要的文件和 URL。

让 xdg-open 和 xdg-settings 与 Xfce 桌面环境检测和整合，需要安装 **xorg-xprop** 包。

如果不这么做的话，在 exo-preferred-applications 设置的首选应用程序就没有效果。
安装后 xdg-open 会检测到你正在运行 Xfce，从而把调用全转交给 exo-open。
它会正常地使用你的首选应用程序设置。

确认 xdg-open 是否正常工作，询问 xdg-settings 默认浏览器的返回结果：

`xdg-settings get default-web-browser`

如果输出的是：

`xdg-settings: unknown desktop environment`

说明 xdg-open 没有检测出你的桌面环境。很可能是没有安装 xorg-xprop 包。

##### 恢复默认设置

如果出于某些愿意需要恢复默认设置，重命名 ~/.config/xfce4-session/ 和 ~/.config/xfce4/

$ mv ~/.config/xfce4-session/ ~/.config/xfce4-session-bak
$ mv ~/.config/xfce4/ ~/.config/xfce4-bak
重新登录后就会起效果。若登录时出现 Unable to load a failsafe session，见 #会话失败一节。

##### 会话失败

包括以下症状：

鼠标变成了叉号甚至没有鼠标
没有标题栏，无法关闭窗口
(xfwm4-settings) 不起动，报 These settings cannot work with your current window manager (unknown)
显示管理器 报错，例如 No window manager registered on screen 0。
Unable to load a failsafe session
Unable to load a failsafe session.
Unable to determine failsafe session name. Possible causes: xfconfd isn't running (D-Bus setup problem); environment variable \$XDG_CONFIG_DIRS is set incorrectly (must include "/etc"), or xfce4-session is installed incorrectly.
重启可能会解决问题，但原因在于错误的会话。删除会话目录：

$ rm -r ~/.cache/sessions/
还有就是保证 $HOME 的对应目录是被启动 xfce4 的用户所拥有的。见 Chown。

##### 标题栏字体使 xfce4-title 崩溃

安装 ttf-droid 和 ttf-dejavu。参见 FS#44382。

##### 笔记本盖设置没有效果

你可能会发现 Xfce4 电源管理器的合盖设置没有效果，不论什么设置合盖后总是挂起。
这是因为默认 logind 而非电源管理器接管了合盖的事件。要更改该行为，运行命令：

`xfconf-query -c xfce4-power-manager -p /xfce4-power-manager/logind-handle-lid-switch -s false`

注意: 有些情况下当你更改合盖动作和挂起时锁定的设置时 logind-handle-lid-switch 设置会又变成 true，详见 [6]。
你需要再手动把它设成 logind-handle-lid-switch false。

##### 电源管理插件显示剩余时间和百分比

版本 1.5.1 引进了新的显示一个标签的隐藏功能。
xfconf4 整数选项 show-panel-label 可以设置不同的标签类型：0（无标签），1（百分比），2（剩余时间）或 3（两方）。

参见：1.5.1 release notes

### Gnome

Gnome Shell 3 可定制性比较高的桌面环境，但是没有 KDE 窗口破碎的特效！
于是换用了 Plasma 5，最终选择是放弃这种包装太好的桌面环境。
桌面套件的配置很难做到完全可控，出了问题比较难排查，内部各组件之间的难免会有比较多的耦合和一些一开始不清楚的地方。

### KDE

## 窗口管理器

完整的桌面环境提供了完全的用户界面，但是通常占用不少系统资源。
希望系统性能最大化的用户可以只安装窗口管理器，然后加入需要的其他软件。
大部分的桌面环境都可以换用其它的窗口管理器。
动态, 堆栈式 和 平铺 窗口管理器处理窗口的方式各不相同。

窗口管理器（window manager，简称 WM）是图形用户界面的一部分。
用户可以选择安装桌面环境，它们通常已经提供了完整的用户界面，包括图标、窗口、工具栏、壁纸和桌面部件。

## 显示管理器

除了手动启动 X 的方法外，可以让图形界面自动启动，
显示管理器 介绍了启动管理器的使用方法。
Start X at Login 提供了直接从终端启动的轻量方法。

### 显示管理器列表

> **Note:**
> 如果使用 桌面环境,应该尽量使用对应的显示管理器。

#### 控制台

-   CDM — 控制台显示管理器
    https://github.com/ghost1227/cdm || cdm-git
-   Console TDM — 扩展自 xinit，由纯粹的 Bash 脚本编写的
    https://github.com/dopsi/console-tdm || console-tdm
-   nodm — 支持自动登录的简单显示管理器。
    https://github.com/spanezz/nodm || nodm
-   Ly — 实验阶段的 ncurses 显示管理器。
    https://github.com/cylgom/ly || ly-git

#### 图形界面

-   GDM: GNOME 显示管理器 。http://projects.gnome.org/gdm/gdm
    LightDM:跨桌面的显示管理器，可以使用各种前端写的任何工具。http://www.freedesktop.org/wiki/Software/LightDMlightdm||lightdm-bzr[broken link: package not found]
-   LXDM: LXDE 显示管理器 (独立于桌面环境) (lxdm)
-   MDM — 使用在 Linux Mint 中的显示管理器,GDM2 的分支项目。
    https://github.com/linuxmint/mdm || mdm-display-manager
-   SDDM：基于 QML 的显示管理器，替代 KDE4 的 KDM，推荐搭配 Plamsa5 或 LXQt 使用。https://github.com/sddm/sddmsddm
-   XDM — X 显示管理器支持 XDMCP（适合服务器的宿主机）.
    http://www.x.org/archive/X11R7.5/doc/man/man1/xdm.1.html || xorg-xdm

### 加载显示管理器

目前，Arch 提供了 GDM、SLiM、XDM、LXDM、LightDM 和 sddm 的 systemd 服务文件。
SDDM 为例，配置开机启动：

```shell
systemctl enable sddm.service
```

执行后，登录管理器应当能正常工作，否则可能是 default.target 没有指向 graphical.target。

启用 SDDM 后，/etc/systemd/system/ 应该创建 display-manager.service 软链接，可以用 --force 覆盖已有链接。

```shell
file /etc/systemd/system/display-manager.service
/etc/systemd/system/display-manager.service: symbolic link to /usr/lib/systemd/system/sddm.service
```

#### 使用 systemd-logind

`loginctl` 查看用户会话状态。所有 PolicyKit 操作，如挂起系统、挂载外部驱动器，无需配置即可使用。

```
loginctl show-session $XDG_SESSION_ID
```

### 会话配置

多数显示管理器读取 /usr/share/xsessions/ 目录已获取可用的会话列表，
此目录中包含各个 DM/WM 的标准 桌面文件。

新建会话，在 /usr/share/xsessions/ 中新建 .desktop 后缀的文件，文件示例：

```
[Desktop Entry]
Name=Openbox
Comment=Log in using the Openbox window manager (without a session manager)
Exec=/usr/bin/openbox-session
TryExec=/usr/bin/openbox-session
Icon=openbox.png
Type=Application
```

#### 运行 ~/.xinitrc 会话

安装 xinit-xsession 后会在显示管理器中提供一个运行 .xinitrc 会话的选项。在显示管理器中选择 xinitrc 作为会话，请确保 ~/.xinitrc 具有执行权限。

#### 没有窗口管理启动应用程序

您也可以启动没有窗口修饰、桌面或窗口管理器的会话。
例如启动 google-chrome，
在/usr/share/xsessions/中创建 web-browser.desktop：

```
[Desktop Entry]
Name=Web Browser
Comment=Use a web browser as your session
Exec=/usr/bin/google-chrome --auto-launch-at-startup
TryExec=/usr/bin/google-chrome --auto-launch-at-startup
Icon=google-chrome
Type=Application
```

登录后，程序立即执行 Exec 中的设定；关闭程序和退出登录一样，回到显示管理器。
大部分图形程序都不支持此环境，窗口无法移动或改变大小。

参阅 xinitrc#Starting applications without a window manager[broken link: invalid section].

### 提示和技巧

#### 自启动

许多显示管理器都查询配置文件 /etc/xprofile, ~/.xprofile 和/etc/X11/xinit/xinitrc.d/。
更多细节，见 xprofile。

#### 设置语言

使用 AccountsService 的显示管理器可以设置用户会话的 locale，
设置位置 /var/lib/AccountsService/users/\$USER:

```
[User]
Language=your_locale
your_locale 替换为locale变量, 如 en_GB.UTF-8 重启显示管理器使变更生效。
```

# 电源管理

本章对笔记本用户可能更为有用。
更多信息，参见: Category:Power management (简体中文)

## ACPI 事件

电源按键或者合上笔记本会发出 ACPI 事件，可以配置系统在收到这些事件时的相应。
推荐使用 systemd (简体中文) 方式。老的方法是 acpid ，不推荐。

systemd 能够处理某些电源相关的 ACPI 事件，通过 /etc/systemd/logind.conf 或 /etc/systemd/logind.conf.d/\*.conf 进行配置，请参考 logind.conf(5). 如果系统没有专门的电源管理程序，systemd 可以替换掉原本用来响应这些 ACPI 事件的 acpid。

事件的动作可以是 ignore, poweroff, reboot, halt, suspend, hibernate, hybrid-sleep, lock 或 kexec.
休眠或挂起动作需要被正确 设置. 如果没有配置事件动作，systemd 会使用默认动作。

| 事件处理程序          | 描述                                                                   | 默认动作  |
| --------------------- | ---------------------------------------------------------------------- | --------- |
| HandlePowerKey        | 按下电源键后的动作                                                     | poweroff  |
| HandleSuspendKey      | 按下挂起键后的动作                                                     | suspend   |
| HandleHibernateKey    | 按下休眠键后触发的动作                                                 | hibernate |
| HandleLidSwitch       | 笔记本翻盖后触发的动作，除了下面的情况                                 | suspend   |
| HandleLidSwitchDocked | 如果笔记本放到了扩展坞或连接了多个显示器时，笔记本翻盖合上时触发的动作 | ignore    |

修改后需要运行 systemctl restart systemd-logind 使上述更改生效。

> **Note:**
> systemd 无法处理交流电源和电池 ACPI 事件，
> 所以还得使用 Laptop Mode Tools 或 acpid 工具。

## CPU 频率调节

最新的 CPU 通常都有自动调节频率的功能。通过该功能可以有效节约电能、减少发热，提升硬件寿命。Cpufrequtils (简体中文)是配置该功能的工具集。

## 笔记本电脑

针对特定型号笔记本电脑的配置信息，参见：Category:Laptops (简体中文)。有关笔记本电脑文章的概览，参见： Laptop。

没有 XPS

## 待机和休眠

-   待机将当前状态保存内存，进入低能耗状态（仍然开机）。
-   休眠将当前状态保存硬盘，可以完全断电。
    参阅 Suspend and hibernate。

# 多媒体

Category:Multimedia 包含更多多媒体方面的资源

## 声音

内核声卡驱动提供了声音：

-   ALSA 是 Linux 内核组件，推荐使用。
    只需要解除静音,安装 alsa-utils 软件包，它包含了 alsamixer)工具，
    然后按照此文[broken link: invalid section]进行设置即可
-   如果 Alsa 不能工作，可以试试 OSS

另外，用户可能希望安装且配置一个 **sound server**，例如 PulseAudio. 对于高级声音需求, 可浏览 professional audio.

## 浏览器插件

安装 Adobe Acrobat Reader、Adobe Flash Player，Java 等浏览器插件，
使用更多的富媒体互联网资源。

根据插件 API 的不同，分为两种：

-   **Netscape plugin API (NPAPI)**
    可在一些小浏览器中使用 (仅支持 Flash Player 插件, Chromium and Opera 不支持这些插件)
-   **Pepper plugin API (PPAPI)**
    仅能在 Chromium，Chrome, Opera 和 Vivaldi 中使用

除非明确说明，本页中的插件都只支持 NPAPI。

### Falsh Player

#### Adobe Flash Player

##### 安装

NPAPI 插件可以通过软件包 flashplugin 进行 安装。
PPAPI 版本可以通过 pepper-flash 进行 安装。
Note:
某些时候文本显示不太正常，可能需要从 AUR 安装 ttf-ms-fonts|
freshplayerplugin-git| 软件包提供了 NPAPI 浏览器比如 Firefox 使用 pepper-flash 的测试版本。可以通过将 /usr/share/freshplayerplugin/freshwrapper.conf.example 复制到 /usr/share/freshplayerplugin/freshwrapper.conf 配置硬件加速。

##### 更新

如果使用 Firefox，请查阅 此处的说明.

##### 配置

To change the preferences (privacy settings, resource usage, etc.) of Flash Player, right click on any embedded Flash content (for instance adobe's flash home) and choose Settings from the menu.

You can also use the Flash settings file /etc/adobe/mms.cfg. Gentoo has an extensively commented example mms.cfg.

To enable video decoding with hardware video acceleration, add/uncomment the following line:

```
EnableLinuxHWVideoDecode = 1
```

It might also be required to add/uncomment the following line:

```
OverrideGPUValidation = 1
```

##### 多显示器全屏修复

When using a multiple monitor setup, or swapping between virtual desktops, it is possible to lose focus on a fullscreen flash window. In such a case, the adobe flash-plugin will automatically exit full-screen mode. This may not be to your liking.

Unfortunately, this behavior is hard coded into the binary. In order to change this behavior it is necessary to alter the binary.

Fixing this issue only works for the NPAPI plugin and this issue can be fixed via 2 ways.

-   Using the **flashplugin-focusfix**.
-   Patching manuallycw
    After the package has been installed, backup libflashplayer.so:

```shell
cp /usr/lib/mozilla/plugins/libflashplayer.so /usr/lib/mozilla/plugins/libflashplayer.so.backup
```

Then, you will need to alter that file using a hex editor like ghex. You must open it with root privileges obviously.

```shell
ghex /usr/lib/mozilla/plugins/libflashplayer.so
```

Using the hex editor find the string \_NET_ACTIVE_WINDOW. In ghex the readable string is on the right hand side of the window, and the hex is on the left, you are trying to locate the readable string. It should be easy to find using a search function.

Upon finding \_NET_ACTIVE_WINDOW rewrite the line, but do not change the length of the line, for example \_NET_ACTIVE_WINDOW becomes \_XET_ACTIVE_WINDOW.

Save the binary, and restart any processes using the plugin (as this will crash any instance of the plugin in use.)

##### 播放受数字版权保护的内容

See Flash DRM content.

#### Shumway

Shumway 尝试直接使用 HTML5 技术而不是本地代码处理和显示 SWF 文件，
已停止开发。

#### Gnash

Gnash 是 Adobe Flash Player 的自由软件替代。
可以作为单独播放器，也可以嵌入浏览器。
支持 SWF v7 和 80% 的 ActionScript 2.0。

可以通过软件包 **gnash**, **gnash-kde4**, **gnash-git**.

#### Lightspark

Lightspark is another attempt to provide a free alternative to Adobe Flash aimed at supporting newer Flash formats. Lightspark has the ability to fall back on Gnash for old content, which enables users to install both and enjoy wider coverage. Although it is still very much in development, it supports some popular sites.

Lightspark can be installed with the lightspark-git| package.

### PDF 浏览器

#### PDF.js

PDF.js is a PDF renderer created by Mozilla and built using HTML5 technologies.

It is included in Firefox.

For Chromium and Google Chrome it is available as extension in the Chrome Web Store.

#### 外部 PDF viewers

To use an external PDF viewer you need #MozPlugger.

If you want to use MozPlugger with Evince, for example, you have to find the lines containing pdf in the /etc/mozpluggerrc file and modify the corresponding line after GV() as below:

repeat noisy swallow(evince) fill: evince "\$file"
(replace evince with something else if it is not your viewer of choice).

If this is not enough, you may need to change 2 values in about:config:

Change pdfjs.disabled's value to true;
Change plugin.disable_full_page_plugin_for_types's value to an empty value.
Restart and it should work like a charm!

### 中国的在线支付

中国的第三方在线支付网站通常采用所谓的“安全插件”来输入密码。这些 NPAPI 插件在 Firefox 52+ 中已不再支持，可以尝试使用 **palemoon**

-   银联在线支付：upeditor
-   支付宝：aliedit

### Citrix

参见：Citrix

### Java

> **Note**
> Both Java plugins are NPAPI-only and thus do not work in Chromium and Opera.

To enable Java support in your browser, you have two options: the open-source OpenJDK (recommended) or Oracle's proprietary version. For details about why OpenJDK is recommended see this.

To use OpenJDK, you have to install the IcedTea browser plugin, icedtea-web.

If you want to use Oracle's JRE, install the jre| package.

See Java#OpenJDK for additional details and references.

Note: If you experience any problems with the Java plugin (e.g. it is not recognized by the browser), you can try this solution[broken link: invalid section].

### Pipelight

See Pipelight.

### 视频播放插件

很多浏览器支持通过 GStreamer 框架播放 HTML5 <audio> 和 <video>。安装时注意查看浏览器的可选依赖关系(或 webkitgtk|/webkitgtk2| 依赖关系)确认支持的 GStreamer 版本，可能是当前 gst-_ 版本或老的 gstreamer0.10-_ 版本。详情参考 GStreamer#Installation.

#### 其它插件

Gecko 媒体播放器 — Mozilla 处理网页多媒体的插件，使用 MPlayer.
https://sites.google.com/site/kdekorte2/gecko-mediaplayer || gecko-mediaplayer[broken link: package not found]
GNOME Videos 插件 — 基于 GNOME Videos 媒体播放器的插件，使用 GStreamer.
https://wiki.gnome.org/Apps/Videos || totem
Rosa Media Player Plugin — 基于 MPlayer 的 Qt 浏览器插件.
https://abf.rosalinux.ru/uxteam/ROSA_Media_Player || rosa-media-player-plugin|
VLC Plugin — NPAPI 接口，VLC 插件.
https://code.videolan.org/videolan/npapi-vlc || npapi-vlc|

### 其他

#### Hangouts

Hangouts plugin can be installed with the google-talkplugin| package. Installing this plugin is not necessary for fresh version of chromium browser. Hangouts is a messenger by Google, that allows you to make video call between 15 people simultaneously. While using "new" version, you can share your screen with others like in Skype, but if you switch to "old" version, it will be possible to do the following things together: watching YouTube, making diagrams, editing documents, playing games and other things.

#### MozPlugger

MozPlugger can be installed with the mozplugger| package.

MozPlugger is a Mozilla plugin which can show many types of multimedia inside your browser. To accomplish this, it uses external programs such as MPlayer, xine, Evince, OpenOffice, TiMidity, etc. To modify or add applications to be used by MozPlugger just modify the /etc/mozpluggerrc file.

For example, MozPlugger uses OpenOffice by default to open doc files. To change it to use LibreOffice instead, look for the OpenOffice section:

```
/etc/mozpluggerrc
...
### OpenOffice
define([OO],[swallow(VCLSalFrame) fill: ooffice2.0 -nologo -norestore -view $1 "$file"
    swallow(VCLSalFrame) fill: ooffice -nologo -norestore -view $1 "$file"
    swallow(VCLSalFrame) fill: soffice -nologo $1 "$file"])
...
```

and add LibreOffice at the beginning of the list:

```
/etc/mozpluggerrc
...
### LibreOffice/OpenOffice
define([OO],[swallow(VCLSalFrame) fill: libreoffice --nologo --norestore --view $1 "$file"
    swallow(VCLSalFrame) fill: ooffice2.0 -nologo -norestore -view $1 "$file"
    swallow(VCLSalFrame) fill: ooffice -nologo -norestore -view $1 "$file"
    swallow(VCLSalFrame) fill: soffice -nologo $1 "$file"])
...
```

> **Note**
> Be sure to also choose LibreOffice as your preferred application to open doc files.

As another simple example, if you want to open cpp files with your favorite text editor (we will use Kate) to get syntax highlighting, just add a new section to your mozpluggerrc file:

```
/etc/mozpluggerrc
text/x-c++:cpp:C++ Source File
text/x-c++:hpp:C++ Header File
    repeat noisy swallow(kate) fill: kate -b "$file"
```

To change the default of MPlayer so that mpv is used instead, change the appropriate lines such that:

```
/etc/mozpluggerrc
...
### MPlayer

#define(MP_CMD,[mplayer -really-quiet -nojoystick -nofs -zoom -vo xv,x11 -ao esd,alsa,oss,arts,null -osdlevel 0 $1 </dev/null])
define(MP_CMD,[mpv -really-quiet $1 </dev/null])

#define(MP_EMBED,[embed noisy ignore_errors: MP_CMD(-xy $width -wid $window $1)])
define(MP_EMBED,[embed noisy ignore_errors: MP_CMD(--autofit=$width -wid $window $1)])

#define(MP_NOEMBED,[noembed noisy ignore_errors maxaspect swallow(MPlayer): MP_CMD($1)])
define(MP_NOEMBED,[noembed noisy ignore_errors maxaspect swallow(mpv): MP_CMD($1)])

...

#define(MP_AUDIO,[mplayer -quiet -nojoystick $1 </dev/null])
define(MP_AUDIO,[mpv -really-quiet $1 </dev/null])

#define(MP_AUDIO_STREAM,[controls stream noisy ignore_errors: mplayer -quiet -nojoystick $1 "$file" </dev/null])
define(MP_AUDIO_STREAM,[controls stream noisy ignore_errors: mpv -really-quiet $1 "$file" </dev/null])
...
```

For a more complete list of MozPlugger options see this page.

### 疑难解答

#### Flash 无声音

Flash Player 只通过默认的 ALSA 设备输出音频（编号 0）。如果使用多个声音设备（比如，除了声卡外，使用了显卡的 HDMI 输出），可能你要使用的声音设备编号不是 0，从而导致 Flash 无声音。

例如：

```
$ aplay -l
**** List of PLAYBACK Hardware Devices ****
card 0: Generic [HD-Audio Generic], device 3: HDMI 0 [HDMI 0]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
card 1: DX [Xonar DX], device 0: Multichannel [Multichannel]
  Subdevices: 0/1
  Subdevice #0: subdevice #0
card 1: DX [Xonar DX], device 1: Digital [Digital]
  Subdevices: 1/1
  Subdevice #0: subdevice #0
```

示例中，HDMI 设备编号 0，而声卡编号 1。要将该声卡作为 ALSA 默认输入，创建~/.asoundrc，内容如下：

```
pcm.!default {
type hw
card 1
}

ctl.!default {
type hw
card 1
}
```

#### Flash 独占了声音设备

如果发现播放 Flash 时其他程序无法正常播放声音，那么可能是由于没有加载 snd_pcm_oss 模块：

```
lsmod | grep snd_pcm_oss
```

重新加载：

```
rmmod snd_pcm_oss
```

并重启浏览器即可。

#### Flash 性能

Adobe 的 Flash 插件有严重的性能问题，尤其是在 CPU 使用自动降频功能时。参见：cpufrequtils#Changing the ondemand governor's threshold[broken link: invalid section]。

#### Flash 中 webcam 分辨率低

尝试使用如下命令启动浏览器：

```
$ LD_PRELOAD=/usr/lib/libv4l/v4l1compat.so [broswer]
```

#### 黑条 in fullscreen video playback on multiheaded desktops

The Flash plugin has a known bug where the full screen mode does not really work when you have a multi-monitor setup. Apparently, it incorrectly determines the full screen resolution, so the full screen Flash Player fills the correct monitor but gets scaled as if the monitor had the resolution of the total display area.

To fix this, you can use the "hack" described here. Simply download the source from the link given on the page, and follow the instructions in the README.

> **Tip**
> The hack is available and can be installed with the fullscreenhack|[broken link: archived in aur-mirror] package.

> **Note**
> While the author mentions using NVDIA's TwinView,
> the hack should work for any multi-monitor setup.

#### Flash Player: plugin version still shown older version after upgrade

Solution for Firefox: delete file "pluginreg.dat" in user's profile directory.

-   Close firefox
-   Go to /home/<username>/.mozilla/firefox/<profile_folder>/
-   Delete file "pluginreg.dat"

Firefox will automatically rebuild this file once it is started again. Make sure to substitute <username> and <profile_folder> with the appropriate information.

#### 插件安装后无法使用

通常因为第一次安装插件后，用户未重登录，插件路径还未设置。测试如下变量：

```
echo $MOZ_PLUGIN_PATH
```

若未设置，请尝试重新登录, 或:

```
$ source /etc/profile.d/mozilla-common.sh && firefox
```

#### Gecko Media Player 无法播放 Apple Trailers

设置浏览器的用户代理（user agent）为：

```
QuickTime/7.6.2 (qtver=7.6.2;os=Windows NT 5.1Service Pack 3)
```

## 解码器

# 网络

## 时钟同步

## DNS 安全

## DNSSEC 验证

## 配置防火墙

## 资源共享

# 输入

# 性能优化

这一部分包含一些实用的性能优化技巧。通过使用这些技巧，可以有效提升程序性能。

## 性能测试

所谓基准测试，就是通过一个统一的流程来测试性能，
并将其结果和其它系统测到的结果或一个被广泛接受的标准相比较的行为。
这种计算系统性能的统一流程可以帮助解答一些问题，比如：

-   系统是否发挥正常？
-   应该用哪个版本的驱动以达到最佳性能？
-   系统是否能够胜任某任务？

许多工具可以测试系统性能，下面列出可用的工具。

### 独立工具

#### glxgears

#### UnixBench

#### interbench

#### ttcp

#### iperf

#### time

#### hdparm

#### Unigine 引擎

#### gnome-disks

#### systemd-analyze

#### dd

#### dcfldd

### 软件集

#### Bonnie++

#### IOzone

#### HardInfo

#### Phoronix 测试集

#### S

### 闪存介质

**iozone** 可以定量测试性能特点。
连续的读和写，常被用来做 I/O 压力测试，例如解压缩，以及系统更新写大量文件。
相关指标是小文件随机写的速度。

该示例调用测试使用 4K 记录大小操作 10M 文件：

## 性能最大化

本文将介绍关于系统性能诊断的基本知识，以及优化系统性能的具体步骤。

### 基础工作

#### 了解系统

性能优化的最佳方法是找到瓶颈，因为这个子系统是导致系统速度低下的主要原因。
查看系统配置表可以发现瓶颈，也可以通过以下方式寻找线索：

#### 跑分

为定量评估优化成果，可使用 benchmarking (简体中文)。

### 存储设备

#### 分散存储

如果你有多个存储设备，那么把操作系统的工作负荷均匀分摊到这些设备上，
将极大提升系统性能。

#### 交换分区/文件

把交换分区/文件放在系统盘以外，对提升速度也有所帮助，
尤其是系统频繁使用交换分区/文件时。

#### 组 RAID (简体中文)

如果你有多个硬盘，组一个软 RAID 或许有不小惊喜。
RAID 0 使存储系统的速度翻倍，但一旦某个硬盘故障，数据将有损失。
RAID 5 则是兼顾速度和数据安全的明智选择，但它至少需要 3 块硬盘。

#### 硬盘的连接方式

接口速度有差异，所以硬盘连接到主板的方式也将影响系统性能。
如固态硬盘接到 USB 接口，远不如接到 SATA 接口。
如果有很多个硬盘，而主板上接口有限，那你要充分利用可用的接口，并注意合理安排：

-   PCI/PCIe/SATA
-   将硬盘改装为网络存储设备，通过网卡连接
-   USB/Firewire

使用 USB 接口时还要注意**USB 接口是否为“衍生”**。
如果某两个 USB 接口正好出自同一个 USB 根 Hub，那么它俩同时使用时将彼此竞争速度。
以下命令将帮助你了解个接口的衍生情况：

```shell
# USB设备树
lsusb -tv

# PCI设备树
lspci -tv
```

#### 分区方案

对于机械硬盘，分区有可能影响系统性能，因为开头的分区靠近硬盘中心，转速较快。
类似的，小的分区可以减少磁盘头的移动，可以提升磁盘性能。
因此，建议将系统分区放在开始的部分，并且容量不必太大（10GB 左右，取决于具体的需要）

#### 文件系统

##### 挂载选项

noatime 选项可以提高文件系统的性能。其它选项和文件系统相关，请参考：

-   Ext3
-   Ext4#Improving performance
-   JFS Filesystem#Optimizations
-   XFS
-   Btrfs#Defragmentation, Btrfs#Compression 和 btrfs(5)
-   ZFS#Tuning

###### atime 参数

使用 noatime, nodiratime 或 relatime 可以提升 ext2， ext3 及 ext4 格式磁盘的性能。
Linux 在默认情况下使用 atime 选项，每次在磁盘上读取（或写入）数据时都会产生一个记录。
这是为服务器设计的，在桌面使用中意义不大。
默认的 atime 选项最大的问题在于即使从页面缓存读取文件(从内存而不是磁盘读取)，也会产生磁盘写操作！

使用 noatime 选项阻止读文件时的写操作。大部分应用程序都能很好工作。
只有少数程序如 Mutt 需要这些信息。
Mutt 的用户应该使用 relatime 选项。
使用 relatime 选项后，只有文件被修改时才会产生文件访问时间写操作。
nodiratime 选项仅对目录禁用了文件访问时间。
relatime 是比较好的折衷，Mutt 等程序还能工作，但是仍然能够通过减少访问时间更新提升系统性能。

> **Note:**
> noatime 已经包含了 nodiratime。不需要同时指定。

##### Reiserfs

挂载选项 data=writeback 可以提高速度，但是，死机或突然断电时将丢失数据。
挂载选项 notail 可以增加大约 5%的磁盘空间，并提升速度。你还可以将日志文件和数据文件分散在不同的磁盘，从而减少硬盘负荷。不过，要达到这个目的需要重新格式化：

```shell
mkreiserfs –j /dev/sda1 /dev/sdb1
# 其中 /dev/sda1 将保存日志，而 /dev/sdb1 将保存数据文件
# 请参考 Using ReiserFS and Linux
```

##### Btrfs

###### 准备工作

要使用一些用户空间工具的话，需要安装 不在 base 包组中的而且基础操作必须的 **btrfs-progs** 软件包。

如果你需要从 Btrfs 文件系统引导（比如说你的内核和内存盘在一个 Btrfs 的分区上），检查 启动引导器 是否支持 Btrfs。

#### 调整内核参数

高级玩法，以后再说

#### Input/output schedulers

##### Background information

##### The scheduling algorithms

##### Kernel's I/O schedulers

##### Changing I/O scheduler

##### Tuning I/O scheduler

#### 优化 SSD

参见 [固态硬盘](#%E5%9B%BA%E6%80%81%E7%A1%AC%E7%9B%98) 一节

#### 使用 RAM disks

参见 USB stick RAID 和 Combine RAM disk with disk in RAID。

### CPU

#### 超频

超频就是增加 CPU 的实际运行频率。
可是一项复杂而又有风险的操作，不建议盲目使用。超频的最佳手段是通过 BIOS。acpi_cpufreq 等工具常用工具无法读取 I5 或 I7 处理器超频后的频率。
用户需要改用 AUR 中的 i7z 工具。

#### 频率自动调整

请参考 CPU frequency scaling.

#### Real-time kernel

Some applications such as running a TV tuner card at full HD resolution (1080p) may benefit from using a realtime kernel.

#### Adjusting priorities of processes

See also nice(1) and renice(1).

##### Ananicy

Ananicy is a daemon, available in the ananicy-git package, for auto adjusting the nice levels of executables. The nice level represents the priority of the executable when allocating CPU resources.

##### cgroups

See cgroups.

##### Cpulimit

Cpulimit is a program to limit the CPU usage percentage of a specific process. After installing cpulimit, you may limit the CPU usage of a processes' PID using a scale of 0 to 100 times the number of CPU cores that the computer has. For example, with eight CPU cores the precentage range will be 0 to 800. Usage:

```shell
cpulimit -l 50 -p 5081
```

#### irqbalance

The purpose of irqbalance is distribute hardware interrupts across processors on a multiprocessor system in order to increase performance. It can be controlled by the provided irqbalance.service.

### 显卡

#### Xorg.conf 配置

显卡性能严重依赖于/etc/X11/xorg.conf，
请参阅 NVIDIA、ATI 以及 Intel 显卡的相关教程修改配置。
注意，不当的配置可能导致 Xorg 停止工作，所以，请审慎操作。

#### Driconf

driconf 是官方库中收录的小工具，它可以修改开源驱动的直接渲染设置。
启用 HyperZ 功能将显著改善性能。

#### GPU 超频

GPU 超频要比 CPU 超频简单得多，通过软件可以实时调整 GPU 时钟频率。

-   ATI 显卡可使用 **rovclock** 或 **amdoverdrivectrl**
-   NVIDIA 显卡可使用 **nvclock**
-   Intel 显卡可使用 GMABooster.com 出品的 **gmabooster**

超频设置可以保存到~/.xinitrc，每次 X 启动之后就能自动超频。当然，更安全的做法应该是按需设置。

### 内存及虚拟内存

#### 将临时文件转移到 tmpfs

如果内存充足，可将/tmp、/dev/shm 或者浏览器缓存文件等转移至 tmpfs，
这些文件将保存在内存中，从而加快软件的响应速度。
借助脚本帮助，可轻松实现：

-   同步浏览器缓存：Profile-sync-daemon
-   同步任意目录：Anything-sync-daemon

#### Swappiness

参阅 Swap#Swappiness。

#### Compcache/Zram

目前，Compcache 已被内核模块 zram 取代，它们在内存中开辟一个区域存储压缩过的交换文件。
如果系统频繁陷入交换状态，此法可以改善系统响应。
不过，Zram 目前仍在开发状态，尚未完全稳定，使用需谨慎。
AUR 中收录的 zramswap 包含了一个脚本进行自动设置，每个 CPU 核心对应一个 zram 设备，
总容量等于可用的内存。
通过 systemctl 启动 zramswap.service，可使得每次开机时自动应用这些配置。

> **Tip:**
> 该方法有利于减少由于交换空间造成的固态硬盘读写，延长固态硬盘寿命。

#### 使用显存

如果你的系统内存很小，而显存又过剩（这种奇葩系统还真少见），
请参阅 Swap on video RAM 的方法，将交换文件设置在显存上。

#### 预读

通过预读程序、库到内存中，能有效加快程序加载速度。
预读通常用于常用的程序，如浏览器。

##### Go-preload

gopreload-git 是来自 gentoo 的一个预读服务。安装后，通过下列命令采集预读信息：

```shell
gopreload-prepare program
```

运行需要预读的程序，收集结束后按回车键。

然后会生成一个预读列表：/usr/share/gopreload/enabled。在/etc/rc.conf 设置开机启动 gopreload，Go-preload 就会在每次开机时预读列表中的程序。要禁止预读某个程序，只需从/usr/share/gopreload/enabled 删除项目，或者移入/usr/share/gopreload/disabled。

##### Preload

比起 Go-preload，Preload 更自动化（尽管有违 KISS）：只需要在/etc/rc.conf 添加服务就完事了。

preload is a program written by Behdad Esfahbod which runs as a daemon and records statistics about usage of programs using Markov chains; files of more frequently-used programs are, during a computer's spare time, loaded into memory. This results in faster startup times as less data needs to be fetched from disk.

###### 安装

Install the **preload** package. You may now start the systemd service preload, and/or enable it in order to start at boot.

###### 配置

The configuration file is located in /etc/preload.conf, it contains default settings that should be suitable for regular users. The cycle option lets you configure how often to ping the preload system to update its model of which applications and libraries to cache.

### 系统启动

参见：[加速系统启动][boot_up]。

[boot_up]: https://wiki.archlinux.org/index.php/Improving_performance/Boot_process_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

#### 待机

想要加快系统启动，最好的方法就是不要关电脑，而选择待机。

#### 自己编译内核

自己编译内核，删除不需要的模块，可以减少引导时间和内存占用。
但通常这是个耗时、枯燥甚至令人厌烦的事情，
你可能面临各种错误——甚至最终节约的开机时间还不如你浪费的时间多。
但通过自己编译内核，可以学习到不少知识。参见：here。

### 网络

-   Kernel networking: see Sysctl#Improving performance
-   NIC: see Network configuration#Set device MTU and queue length
-   DNS: consider using a caching DNS resolver, see Domain name
-   resolution#Resolvers[broken link: invalid section]
-   Samba: see Samba#Improve throughput

## 固态硬盘

考虑以下问题时优先选择当代 SSD。

-   原生 TRIM 支持是一个很重要的功能，它既可以延长固态硬盘寿命，同时可以在长期减少写入性能下降。
-   购买正确容量的固态硬盘是关键。对于大多数文件系统，对所有的固态硬盘分区使用 <75 % 的容量可以确保被内核高效的使用。

### 最大化利用 SSD 的技巧

#### 分区对齐

见 Partitioning#Partition alignment。

#### TRIM

绝大多数 SSD 支持 ATA_TRIM 命令 以保持长期性能和损耗水平。
一些测试前后的有关内容，见这个 教程。

自 Linux 内核版本 3.7 起，以下文件系统支持 TRIM: Ext4, Btrfs, JFS, VFAT, XFS.

VFAT 只有挂载参数为'discard'(而不是 fstrim)时才支持 TRIM 。

##### 检验 TRIM 支持

```shell
hdparm -I /dev/sda | grep TRIM
        *    Data Set Management TRIM supported (limit 1 block)
```

需注意的是有几种 TRIM 支持的规格。因此，输出内容取决于驱动器支持什么。更多内容见 wikipedia:TRIM#ATA 。

##### 通过挂载参数启用 TRIM

在 /etc/fstab 里使用这个参数以启用 TRIM。

```shell
/dev/sda1  /       ext4   defaults,noatime,discard   0  1
/dev/sda2  /home   ext4   defaults,noatime,discard   0  2
```

> **Note:**
>
> -   TRIM 当在 SSD 上使用块设备加密时并非默认启用；更多内容见 Dm-crypt/TRIM support for SSD。
> -   如果你周期性运行 fstrim 的话没必要使用 discard 参数。
> -   在 ext3 的根分区上使用 discard 参数的话会导致它被挂载为只读模式。

> **Warn:**
> 用户试图以 discard 参数挂载分区前需确认你们的 SSD 支持 TRIM ，
> 否则会造成数据丢失！

##### 通过 cron 应用 TRIM

> **Note:**
> 此方法不适用于 VFAT 文件系统。

推荐在支持 TRIM 的 SSD 上启用。但有时会导致 SSD 删除文件时 运转缓慢 。
此时必须使用 fstrim 作为替代。

```shell
fstrim -v /
# 应用 fstrim 的分区必须已挂载，且须以挂载点指代
```

如果这个方法看起来是个更好的选择，以 cron 来时不时执行它也应是极好的。
为了执行每日计划任务， cron 软件包 (cronie)默认包含了一个默认设置用来执行每小时，每日，每周，每月的计划任务的 anacron 实现。
需注意 cronie systemd 服务 在新安装的 Arch 里并非默认启用。
要将其加入每日 cron 任务中，只需创建一个执行你想要行为的脚本并将其放入 /etc/cron.daily, /etc/cron.weekly 等中。
使用此种方法时， nice 和 ionice 值设为推荐值。
实现后，将 discard 选项从/etc/fstab 中移除。

> **Note:**
> 将 discard 挂载参数作为首选。常规启用 TRIM 方法之外再考虑这种方法。

##### 通过 systemd 服务应用 TRIM

**util-linux** 包提供了 fstrim.service 和 fstrim.timer systemd 的 unit 文件。 启用 计时器将每周激活这个服务来 trim 设备上所有已挂载的支持 discard 操作的文件系统。

##### 用 tune2fs 启用 TRIM(不推荐)

可用 tune2fs 来静态设置 trim 参数:

```shell
tune2fs -o discard /dev/sdXY
```

> **Warn:**
> 这种方法会导致 discard 选项在 mount 里 不出现。

##### 为 LVM 启用 TRIM

将 /etc/lvm/lvm.conf 中 issue_discards 选项值由 0 改为 1。

> **Note:**
> 启用该选项会使得当逻辑卷不再使用物理卷的空间(如 lvremove, lvreduce, 等等)时，
> 将 discard 发给逻辑卷的底层物理卷"
> (见 lvm.conf(5) 和/或 /etc/lvm/lvm.conf 中的注释内容)。
> 因此，它似乎并不需要为“常规”TRIM 请求（文件系统内的文件删除）来发挥作用。

##### 为 dm-crypt 启用 TRIM

> **Warn:**
> discard 选项允许丢弃通过加密的块设备传递的请求。
> 这提高了 SSD 的存储性能，但带来了安全隐患。
> 更多信息见 Dm-crypt/TRIM support for SSD 。

对非根文件系统，为 SSD 上的块设备配置 /etc/crypttab 来把 discard 加入到选项列表中
(见 Dm-crypt/System configuration#crypttab)。

对于根文件系统，遵循 Dm-crypt/TRIM support for SSD 的指示来将正确的内核参数加入到 bootloader 配置中。

#### I/O 调度器

考虑从默认 CFQ (Completely Fair Queuing)调度器切换到 NOOP 或 Deadline。
后两者为 SSD 提供了性能加速。
例如 NOOP 调度器，实现了一个对所有传入 I/O 请求的简单队列，
而无需重新排序和分组那些在物理磁盘上相近的。
SSD 的寻道时间对所有扇区都想同因此无效，需要重新排序基于它们的 I/O 队列。

在 Arch 上 CFQ 调度器默认是启用的。
查看 /sys/block/sdX/queue/scheduler 的内容来检查:

```shell
cat /sys/block/sdX/queue/scheduler
noop deadline [cfq]
# 当前使用的调度器是可用调度器中括号括起来的那一个
```

用户可随时更改而无需重启：

```shell
echo noop > /sys/block/sdX/queue/scheduler
# 或者
$ sudo tee /sys/block/sdX/queue/scheduler <<< noop
```

这种设置方法不持久 (例如，重启后变更撤销)。
再次查看文件的内容以及确认"noop"被括起来来确认更改。

##### 内核参数(针对单个设备)

如果在系统中是 SSD 是唯一的存储设备，
考虑通过 `elevator=noop` 内核参数对整个系统设置 I/O 调度器.

##### 针对单个设备或者 HDD/SDD 混合情况使用 udev

尽管上述方法无疑可行，并被认为是可靠的工作环境。
因此，若想使用首先对设备负责而不是实现调度器的系统的话，采用 udev。
为此只需一条简单的 udev 规则。
创建如下内容:

```shell
/etc/udev/rules.d/60-schedulers.rules
# set deadline scheduler for non-rotating disks
ACTION=="add|change", KERNEL=="sd[a-z]", ATTR{queue/rotational}=="0", ATTR{queue/scheduler}="deadline"
```

当然，将 Deadline/CFQ 设置为想要的调度器。变更在重启后生效。为检验变更成功:

```shell
cat /sys/block/sdX/queue/scheduler  # X是应用变更的设备
```

注意: 此例中选择编号 60 是因为 udev 使用该编号用于自身的永久命名规则。因此，块设备此刻似乎可修改，而这是对于该特定规则的安全位置。但是只要以.rules 结尾，规则可以随便命名。

#### SSD 上的交换空间

在 SSD 上可分配 swap 分区，但大多数配置 2G 以上内存的现代电脑几乎不用 swap。值得注意的是当系统启用休眠特性时例外。

要使用 SSD 上的 swap 分区，推荐将 swappiness 的值改得非常低 (比如 1)以避免对 swap 写入。

> **Note:**
> BTRFS 文件系统暂时不支持交换文件。
> 不注意此警告可能会导致文件系统损坏。
> 虽然在通过循环设备挂载时 Btrfs 上可能会使用交换文件，
> 但这会导致交换性能严重下降。

**笔记本使用 BtrFS 利用其压缩性能 不使用交换空间**

**台式机 SSD 也用 BtrFS，HDD 使用普通 ext4 文件系统，并建立[交换文件][swap]**

[swap]: https://wiki.archlinux.org/index.php/Swap_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

#### Hdparm 显示 "frozen" 状态

一些主板 BIOS 初始化时发送了"security freeze"命令给连接上的存储设备。
同样，一些 SSD(和 HDD) BIOS 在工厂已设置为"security freeze"。
二者都会导致设备的密码安全设置设为 frozen，如下面的输出:

```
hdparm -I /dev/sda
Security:
 	Master password revision code = 65534
 		supported
 	not	enabled
 	not	locked
 		frozen
 	not	expired: security count
 		supported: enhanced erase
 	4min for SECURITY ERASE UNIT. 2min for ENHANCED SECURITY ERASE UNIT.
```

如格式化设备或安装新系统之类的操作不受"security freeze"影响。

上面的输出显示了设备在启动时 not locked，而 frozen 状态保护设备免于间谍软件侵害。
它们试图在运行时设置密码来达到目的。

如果你想为"frozen"的设备设置密码，则必须要主板 BIOS 支持才可。许多笔记本都支持，
这是因为这是 硬件加密 所必需的，但并非台式机/服务器主板所必需。
例如，对于 Intel DH67CL/BL 主板，
必须用跳线设置为"maintenance mode"来查看设置 (见 [1], [2])。

> **Warn:**
> 不要试图用 hdparm 来改变上述的 lock 安全设置，除非你十分清楚自己在干什么。

如果你想擦除 SSD，见 Securely wipe disk#hdparm 以及 下文。

#### SSD 存储单元清除

有时希望重置 SSD 单元到刚安装时的纯净状态，使其恢复[出厂时写入性能][anandtech]。
因为即使是原生支持 TRIM 的 SSD，其写入性能也会随时间变差。
TRIM 只在文件删除时起作用，而不是如增量保存一样的替代保障措施。

重置按 wiki 文章 [SSD memory cell clearing][memory_cell_clearing] 指示，
三步之内即可轻松完成。

[anandtech]: https://www.anandtech.com/show/2738/8
[memory_cell_clearing]: https://wiki.archlinux.org/index.php/Solid_state_drive/Memory_cell_clearing

#### 处理 NCQ 错误

部分 SSD 和 SATA 芯片组并不在 Linux 的原生命令队列(NCQ)下正常工作。
dmesg 错误提示类似:

```
[ 9.115544] ata9: exception Emask 0x0 SAct 0xf SErr 0x0 action 0x10 frozen
[ 9.115550] ata9.00: failed command: READ FPDMA QUEUED
[ 9.115556] ata9.00: cmd 60/04:00:d4:82:85/00:00:1f:00:00/40 tag 0 ncq 2048 in
[ 9.115557] res 40/00:18:d3:82:85/00:00:1f:00:00/40 Emask 0x4 (timeout)
```

尝试如下方法:

-   更新 SSD 固件。Intelligent partition scheme
-   更新主板的 BIOS/UEFI 固件。见 [Flashing BIOS from Linux][flash_bios] 。
-   启动时禁止 NCQ。在 [Bootloader 配置][boot_process]的 kernel 行里添加 `libata.force=noncq` 。

如果仍未解决或产生新问题，请提交 bug。

[flash_bios]: https://wiki.archlinux.org/index.php/Flashing_BIOS_from_Linux
[boot_process]: https://wiki.archlinux.org/index.php/Arch_boot_process_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

### 最小化硬盘读写

在定位大量读写操作方面，“简化”是 SSD 使用中的重要主题。如此会延长 SSD 的使用寿命。
这主要是由于大的擦除块大小(某些情况下 512KB)；或是大量小写入等效于一次大写入。

> **Note:**
> 一个 32GB，10 倍中等的写入放大系数，标准的 10000 写入/擦除周期，
> 以及每日写入 10GB 数据的 SSD 预计会有 8 年寿命。
> 当考虑更大的 SSD，现代的控制器，以及小一点的写入放大系数时，表现会更好。
> 当决定是否限制硬盘写入时参考 \[[3][techreport]\] 来看是否确实需要。

[techreport]: https://techreport.com/review/25889/the-ssd-endurance-experiment-500tb-update

使用 **iotop** 包以及 sort 对硬盘写入排序来观察程序对硬盘写的量及频率。

> **Tip:**
> iotop 使用 -b 参数可在批处理模式而不是默认的交互模式下运行。
> -o 用于查看正在输入输出的程序， -qqq 用于废止字段名和 I/O 总览。
> 更多选项见 iotop(8)。
>
> ```shell
> iotop -boqqq
> ```

#### 智能分区方案

对于 SSD 和 HDD 同时使用的系统，考虑**把 /var 放在 HDD 上以减少 SDD 读写损耗**。

#### noatime 挂载参数

前面讲过了

#### 将频繁使用的文件置于内存

##### 浏览器配置文件

通过 tmpfs 把浏览器配置文件挂载入内存，
如 chromium, firefox, opera 等，
同时也使用 rsync，同步与基于硬盘的备份。
除了明显的速度的改进，用户也将节省他们的 SSD 读/写周期。
上有自动完成这些过程的软件，如 **profile-sync-daemon**。

##### 其他

同理频繁访问的目录如 /srv/http (如果正运行网页服务器)也可挂载入内存。 profile-sync-daemon 的姐妹项目是 **anything-sync-daemon**， 允许用户将**任意**目录使用相同的基本逻辑和安全防护措施同步入内存。

#### tmpfs 里编译

在 tmpfs 里编译是减少硬盘读写的好招数。更多详见 [Makepkg#Improving compile times][makepkg]。

[makepkg]: https://wiki.archlinux.org/index.php/Makepkg_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

#### 文件系统上禁用日志

在 SSD 上使用带日志功能的文件系统(如 ext4)**不打开**日志选项来减少硬盘读写。
其明显缺点是非正常卸载分区（即断电后，内核锁定等）会造成数据丢失。
Ted Tso 主张在大多数情况下日志可以以最小的多余的读/写周期被启用:
**以 noatime 参数挂载的 ext4 文件系统的写入数据总量 (MB 为单位)**。

| operation  | journal | w/o journal | percent change |
| :--------: | ------- | ----------- | -------------- |
| git clone  | 367.0   | 353.0       | 3.81 %         |
|    make    | 207.6   | 199.4       | 3.95 %         |
| make clean | 6.45    | 3.73        | 42.17 %        |

_"研究结果表明，重的元数据工作负载，如 make clean，确实造成了近两倍写入磁盘的数据量。
这是可以预料的，因为元数据块所有的改变都是第一次写日志和日志变更提交之前写入到磁盘上的最终位置。
然而，更常见的工作负载，如写数据以及修改文件系统元数据块，差异要小得多。"_

> **Note:**
> 上面表格中的 make clean 实例代表了在 tmpfs 中编译这个建议的重要性!

### 文件系统选择

#### Btrfs

Btrfs 在 Linux 主线版本 2.6.29 之后已支持。
有些人觉得它用于生产工作尚不成熟，也有人早就接纳。
参阅 Btrfs 以寻找更多信息。

#### Ext4

Ext4 是另一个支持 SSD 的文件系统。
自从 2.6.28 之后它就已经稳定并足够成熟来支持日常使用。
ext4 须用 discard 挂载参数，或 `tune2fs -o discard /dev/sdaX` 以明确启用 TRIM 支持。
更多信息见 official in kernel tree documentation.

#### XFS

XFS 也支持 TRIM。可用常规方法启用。
即，使用前文提到的 discard 选项，或者是 fstrim 命令。
更多信息见 XFS wiki.

#### JFS

自 Linux 内核 3.7 版以来，就加入了可用的 TRIM 支持。
目前为止有关此并没有太多讨论，都整理于 Linux news sites.
显然可通过 discard 挂载选项或者 fstrim 命令。

#### 其他文件系统

有些为 SSD 而特殊设计的 文件系统，例如 F2FS.

> **遗憾**
> GRUB 还没有支持 F2FS！代码已经添加，在尚未发布的 2.04 版以后会有

### 固件升级

#### ADATA

ADATA 在其支持页面上提供了 Linux (i686)版的工具。在选择型号之后会出现到最新固件的链接。最新的 Linux 上的升级工具打包有固件，并必须以 root 权限运行。必须首先给二进制文件设置合适的权限。

#### Crucial

Crucial 提供了以 ISO 镜像文件升级固件的选项。
镜像可在选择产品和下载"Manual Boot File"之后找到。
M4 Crucial 型号的用户须确认固件是否通过 smartctl 来升级。

```
smartctl --all /dev/sdX
==> WARNING: This drive may hang after 5184 hours of power-on time:
http://www.tomshardware.com/news/Crucial-m4-Firmware-BSOD,14544.html
See the following web pages for firmware updates:
http://www.crucial.com/support/firmware.aspx
http://www.micron.com/products/solid-state-storage/client-ssd#software
```

建议看见这个警告的用户备份所有重要数据并立即升级。

#### Kingston

Kingston 提供了基于 Sandforce 控制器的设备的 Linux 版升级工具: SSD support page.
点击页面上的图片来跳转到你的 SSD 的型号。特别地如 SH100S3 SSD 的支持可在此找到。

#### Mushkin

不怎么出名的 Mushkin 牌固态硬盘也使用 Sandforce 控制器，
提供了 Linux 版的升级工具 (和 Kingston 的几乎一样)。

#### OCZ

OCZ 在论坛上提供了 Linux (i686 and x86_64) 版的升级工具。

#### Samsung

Samsung 注意到使用他们的 Magician Software 是"不支持的"，但是是可能的。显然 Magician Software 可以把 USB 做成以升级固件启动。最简单的方式是使用他们提供的用于升级固件的可启动的 ISO 镜像。可从这里获取。

> **Note:**
> Samsung 根本不明确提供这些。
> 他们似乎有四个固件升级页面，每个页面要求做不同的事情。

用户更喜欢从 USB 的 live Linux 系统上升级固件
(而不是在 Microsoft Windows 下用三星的 "Magician" 软件)。参见[这里][samsung]。

[samsung]: https://www.samsung.com/semiconductor/minisite/ssd/download/tools/

#### SanDisk

SanDisk 制作 ISO 固件镜像来允许用户在 SanDisk SSD 工具包不支持的系统上升级。必须找到正确的 SSD 型号以及它的容量(例如 60GB, 或者 256GB)。烧制合适的 ISO 固件镜像之后，只需重启电脑启动到新创立的 CD/DVD 启动盘(也可以是 USB)。

ISO 镜像必须只包含一个 linux 内核和一个 initrd.解压到 /boot 分区并用 GRUB 或者 Syslinux 启动它来升级。

目前我找不到列出固件升级的单独页面(恕我直言网站简直一团糟)，但这里有一些相关链接:

SanDisk Extreme SSD Firmware Release notes and Manual Firmware update version R211

SanDisk Ultra SSD Firmware release notes and Manual Firmware update version 365A13F0

# 系统服务

## 文件索引和搜索

大部分发行版都提供了 locate 命令进行快速文件搜索，在 Arch 中建议安装软件包 mlocate。安装后请执行 updatedb 建立文件系统索引。

## 打印

CUPS 是苹果公司开发的、符合标准的开源打印系统。
特定型号打印机的配置信息，参见：打印机分类。

## 本地邮件交换

参见使用 Postfix 进行本地邮件交换简单配置邮件交换。
此外，用户还可以选择：SSMTP，Msmtp 和 fdm。

# 外观美化

本栏讨论 ArchLinux 界面的美化。更多信息请参考：Category:Eye candy (简体中文)。

## 字体

```shell
# 思源字体 Pan-CJK 字体家族
# 包含了 中越日韩和拉丁字母等 大量字体，一站式解决
sudo pacman -Sy adobe-source-han-sans-otc-fonts   # Sans
sudo pacman -Sy adobe-source-han-serif-otc-fonts  # Serif

# 文泉驿微米黑
sudo pacman -S wqy-microhei

# 微软字体
yay -Sy ttf-win7-fonts
```

访问 _字体配置_ 获取配置字体渲染的详细信息，
Fonts (简体中文) 提供了字体选择建议和安装方法。

对于经常使用虚拟终端的用户，可通过配置字体提高可读性，
参见：Fonts#Console fonts[broken link: invalid section]

### Font configuration

Fontconfig 是一个为应用程序提供可用 字体 的程序库，也可用来配置字体渲染效果，参见 fontconfig 软件包和 Wikipedia:Fontconfig。
Free type 库(freetype2 软件包)就是以此为配置基础来渲染字体。

尽管 Fontconfig 已经是当今 Linux 字体界的标准，但是仍有一部分应用使用更加原始的字体显示方法，X Logical Font Description。

Arch Linux 上的字体渲染包支持有字节码解释器(BCI)的 freetype2。
为了更好的字体渲染，特别是在 LCD 显示器上，一些补丁包也添加到库中，参见下面的 补丁包。
Infinality 包同时支持自动微调和亚像素渲染，允许在无须重新编译的情况下微调 LCD 滤光器，而且在粗体字下自动微调仍然表现良好。

字体路径位于 `/usr/share/fonts/` 和 `~/.local/share/fonts` (`/.fonts/` 已弃用)，把所有的字体文件放在该目录和子目录下。
Fontconfig 会递归访问这些目录，所以可以把不同的字体分门别类放置在不同文件夹下。

```shell
# 查看Fontconfig所包含的字体
fc-list : file
# 参见fc-list(1)以获得更多输出格式方面的信息

# 查看Xorg包含的字体，可以使用
xlsfonts
# 这个命令来自包 xorg-xlsfonts

# 通过考察Xorg的log文件来检查Xorg包含的字体路径
grep /fonts /var/log/Xorg.0.log

# 也可以通过命令
xset q
# 检查Xorg包含的字体路径
```

需要明确的是，Xorg 不会像 Fontconfig 一样递归搜索/usr/share/fonts/目录。
如果要增加一个目录，必须使用一个完整目录：

```shell
Section "Files"
    FontPath     "/usr/share/fonts/local/"
EndSection
```

添加下面的配置代码到文件~/.xinitrc，可将字体路径添加进或者移除出默认路径：

```shell
xset +fp /usr/share/fonts/local/          # Prepend a custom font path to Xorg's list of known font paths
xset -fp /usr/share/fonts/sucky_fonts/    # Remove the specified font path from Xorg's list of known font paths
```

通过对 `$XDG_CONFIG_HOME/fontconfig/fonts.conf` 的修改可以完成对某个用户的配置, 而对 `/etc/fonts/local.conf` 的修改则可以完成对每一位用户的配置． 如果用户的单独配置和全局配置不同，系统优先使用前者. 这些文件共用相同的语法.

旧的配置文件和目录 `~/.fonts.conf`, `~/.fonts.conf.d` 和 `~/.fontconfig/*.cache-*` 自 fontconfig 2.10.1 开始已废弃(upstream commit) 未来也不再默认读取这些文件，分别替以 `$XDG_CONFIG_HOME/fontconfig/fonts.conf`, `$XDG_CONFIG_HOME/fontconfig/conf.d` 和 `$XDG_CACHE_HOME/fontconfig/*.cache-*`。

Fontconfig 把所有的配置放在一个中心文件 `/etc/fonts/fonts.conf` ，这个文件在 fontconfig 更新时会被替换，不要编辑这个文件。
字体设置重要的程序引用这个文件获得当前字体配置和渲染配置。
这个文件是一系列配置规则的集合，包括全局配置 `/etc/fonts/local.conf`, 预设配置 `/etc/fonts/conf.d/`, 和用户配置 `$XDG_CONFIG_HOME/fontconfig/fonts.conf`。

> **Note:**
> 一些桌面环境 (如 GNOME 和 KDE) 中使用 Font Control Panel 会自动生成和重写用户字体配置文件。
> 最好配合已定义的字体配置来得到需要的显示效果。

配置文件是 XML 并需要一些格式头 (下文的配置示例省略了这些标签):

```shell
<?xml version="1.0"?>
<!DOCTYPE fontconfig SYSTEM "fonts.dtd">
<fontconfig>

  <!-- settings go here -->

</fontconfig>
```

## GTK 和 Qt 主题

Linux 下的图形界面基本都使用 GTK+ 或者 Qt 工具集。
这些文章和 [Uniform look for Qt and GTK applications][unilook] 提供了让程序更美观的方法。

# 控制台优化

本部分包括控制台的优化和微调方法。参阅 Category:Command shells.

## Tab 自动补全

建议参考所选 shell 的文档，立即设置增强的 Tab 自动补全

## 别名

给一个命令取别名, or a group thereof, 是使用控制台时的一种节省时间的方式。
这种方式对于重复的任务特别有用，这些任务的参数在多次执行期间不需要大的改变。
通常使用的省时的别名可以在这里找到 Bash#Aliases，这些别名也能很容易地移植到 zsh。

## 命令别名

用户可以[自定义常用命令的别名][core_utilities]方便使用。

[core_utilities]: https://wiki.archlinux.org/index.php/Core_utilities_(%E7%AE%80%E4%BD%93%E4%B8%AD%E6%96%87)

## 其他 shells

Bash 是 Arch 默认安装的 shell，而安装的时候使用的是 zsh 并使用 grml-zsh-config 插件。其它选择参阅 Command shell#List of shells。

## Bash 增强功能

Bash#Tips and tricks 介绍了些 Bash 的杂项设置，包括：命令补全，历史记录，宏等等。

## 彩色输出

参考 Color output in console。

## 压缩文件

压缩包，或称为归档，在 GNU/Linux 十分常用。
Tar 是最常用的归档工具，用户应该熟悉它的语法。
此外还有 Arch 软件包使用的 xz 压缩包。
参见：Core utilities#extract。

### 控制台提示符

控制台提示符可以通过 PS1 环境变量灵活定制，参见论坛帖子：What's your PS1?。
另见：Bash 彩色提示符（Zsh 用户参见：Zsh：提示符）。

### Emacs shell

Emacs 除用作编辑器，其高级功能更为出名，其中一项是把 Emacs 变成全功能 shell。
参见：Emacs 打开彩色输出后的乱码问题。

## 鼠标支持

控制台中使用鼠标复制粘贴比传统 GNU screen 操作方式方便许多。

### 安装

#### 台式机

用 pacman 安装 **gpm** 即可

`pacman -S gpm`

#### 笔记本

用 pacman 安装 **gpm** 和 **libinput** 即可

`pacman -S gpm libinput`

### 配置

`gpm -m /dev/psaux -t help`'

-   -m 参数表示预定义要使用的鼠标
-   -t 参数表示预处理您使用的鼠标类型
-   要得到能被-t 参数接受的类型的列表，用-t help 运行 gpm。

如果鼠标只有两个键，将参数 -2 传递给 GPM_ARGS，这样第二个键就可以完成粘贴功能。

gpm 软件包需要使用一些参数启动，
这些参数可以添加到 /etc/conf.d/gpm 或者直接在运行 gpm 时使用。

对于 PS/2 鼠标，用下面这行替代已有的一行：

`GPM_ARGS="-m /dev/psaux -t ps2"`

对于 USB 鼠标应该使用：

`GPM_ARGS="-m /dev/input/mice -t imps2"`

对于 IBM Trackpoints 使用：

`GPM_ARGS="-m /dev/input/mice -t ps2"`

配置好合适的选项之后，在/etc/rc.conf 文件中把 gpm 添加至 DAEMONS 行里面。例如：

`DAEMONS=(syslog-ng gpm network netfs crond)`

更多信息见 gpm(8)。

## 页面回滚缓冲

通过设置页面回滚缓冲节省显示空间。

## 会话管理

tmux 或 GNU screen 之类的终端复用器提供会话管理，
在其中运行的程序不会因杀死终端、关闭 X 或用户登出而终止，
只要终端复用器服务保持运行。随后，用户可以重新连接会话。

# 系统中文化

Arch Linux 中文化 页面包含了详尽的中文化指南

# 中国大陆用户的推荐解决方案

> **Note:**
> 本章节独立于原英文翻译

众所周知，中国大陆用户有别于国际上的特殊需求，此章节旨在提供解决方案。

## 办公

-   WPS Office (简体中文)
-   LibreOffice (简体中文)

一些在线办公套件网站可以提供基础的办公功能:

-   **Office Online：**
    Microsoft 的 Office 办公套件的网页版
-   **Google Docs, Sheets and Slides：**
    Google 的在线文字处理、电子制表和演示程序。

## 中文输入法

参见 Fcitx (简体中文)或 Ibus

## 在线音乐

-   网易云音乐 **netease-cloud-music**。
-   酷我音乐（第三方）**kwplayer**。

## 代理

即科学上网

-   Shadowsocks (简体中文)
-   Lantern（蓝灯）：安装 lantern（如安装有 archlinuxcn 源可直接使用 pacman -S lantern-bin 安装）即可。
-   XX-Net (简体中文)
-   更改 hosts： 获取可以科学上网的 hosts 文件，修改或替换/etc/hosts 即可。

示例：从[1]项目获取 hosts 文件，将其内容加入/etc/hosts（如原 hosts 文件无需使用，也可直接覆盖）即可。也可执行更新 hosts 文件：

`sudo wget https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts -O /etc/hosts`

为方便起见，可将其使用 alias 别名方式写入.bashrc，首先编辑~/.bashrc，在其中添加：

`alias hosts='sudo wget https://raw.githubusercontent.com/googlehosts/hosts/master/hosts-files/hosts -O /etc/hosts'`

然后执行:

`source ~/.bashrc`

以后更新 hosts 文件只需要执行

`hosts`

即可。

> **Tip:**
> 可使用 `crontab` 定时执行脚本 (root 身份运行或 sudo 免密码)

> **Tip:**
> 除 hosts 方法外，你可能还需要进行相应的代理设置，
> 如对程序单独设置代理或者使用工具设置临时代理（如使用 proxychains 工具）或全局代理（如桌面环境的设置中可能提供该选项），
> 可参考各工具的相应文档进行设置，
> 或参考 Proxy settings 一文。

## 即时通讯工具

-   QQ:请查阅 Tencent QQ (简体中文) 页面。
-   Telegram:Telegram Messenger 是一个跨平台的实时通信软件。
    请查阅 Telegram (简体中文) 页面。

## 电子商务

很可惜并没有现成的维基页面，
不过 Acgtyrant 用户在其博客上提供了 電子商務在 Arch Linux 下的簡易解決方案[broken link: invalid section](archive.org的存档)。

## 校园网

中国大陆众多高校采用各种客户端拨号上网，如城市热点 drcom，锐捷。一些学校提供有网页登录或者 linux 版客户端，可参照相关说明文档安装使用。对于未提供网页登录以及客户端者：

-   Drcom 用户可参考 Drcom，
    锐捷用户可参照 MentoHUST (简体中文) 指导您通过借助 MentoHUST 进行锐捷拨号。
-   借助 wine 尝试安装使用。
-   使用虚拟机运行，可在虚拟机中登录客户端上网，虚拟机开启桥接，
    安装 ssh 服务端，在 linux 下 ssh 登录虚拟机上网。

# 其他软件包

## 实用工具

-   bash-completion
-   vscode
-   deja dup 备份工具
-   meld
-   thunderbird
-   libreoffice
-   calibre
-   youtube-dl-gui
-   gimp
-   wireshark
