![](http://uploadimg2.moore.ren/images/news/2017-07-24/101208.jpg)

来源：半导体[](http://www.moore.ren/job/list-new/93/)[](http://www.moore.ren/job/list-new/305/)[设备](http://www.moore.ren/job/list-new/211/)工程师

# 概述

## 概念

- IC 产业 = 半导体产业
- 电子设计自动化（EDA, Electronic design automation）
- IP：
  Intellectual Property
- IP core：
  Intellectual Property core，IP核，
  将一些数字电路中常用但比较复杂的功能块，
  如FIR滤波器、SDRAM控制器、PCI接口等设计成可修改参数的模块。
  随CPLD/FPGA的规模越来越大，设计越来越复杂（IC的复杂度以每年55%的速率递增，而设计能力每年仅提高21%），
  设计者的主要任务是在规定的时间周期内完成复杂的设计。
  调用IP核能避免重复劳动，减轻工程师负担，大大缩短产品上市时间。
- Fabless：
  即 Fabrication-less 无工厂模式指 “没有制造业务、只专注于设计” 的 IC 设计运作模式，
  也指代未拥有芯片制造工厂的 IC 设计公司（IC design house），经常简称“无晶圆厂”；
  通常 IC 设计公司即 Fabless。
- Foundry：
  在 IC 领域指专门负责生产、制造芯片的厂家。
  Foundry 原意铸造工厂、翻砂车间、玻璃熔铸车间，而硅集成电路制造也与“玻璃”和“砂”有关
- OSAT：
  封装测试公司
- Chipless：
  类似 ARM 这种，既不生产 IC 也不设计 IC，出售 IP core


## IC 产业由三环节构成

- 设计
- [制造](http://www.moore.ren/job/list-new/209/)
- 封测

如全球首屈一指[芯片设计](http://www.moore.ren/job/list-new/1/)公司高通以 “无晶圆厂” 模式闻名。
高通设计芯片后交由其他晶圆厂（如台积电、三星）代工，
再转交封测厂（如日月光）进行
- [封装](http://www.moore.ren/job/list-new/78/)
- [测试](http://www.moore.ren/job/list-new/78/)

无晶圆厂模式让[芯片设计](http://www.moore.ren/job/list-new/1/)公司省掉大笔
晶圆厂[运营](http://www.moore.ren/job/list-new/203/)及建造[成本](http://www.moore.ren/job/list-new/155/)。

在 IC 产业链中各大半导体厂商都扮演的角色

# 两种业务模式

IC 产业目前主要有两种业务模式：
- 整合元件[制造](http://www.moore.ren/job/list-new/209/)商（IDM, Integrated device manufacturer）
- 垂直分工，即 IP core + Fabless + Foundry + [封装](http://www.moore.ren/job/list-new/78/)[测试](http://www.moore.ren/job/list-new/78/)厂

台积电未成立前，世界上只有 IDM 模式，台积电诞生使 IC W产业走向分工模式。

## IDM 模式

IDM 有晶圆厂，可完成从
IC 设计、芯片制造、芯片封装、测试，甚至下游电子终端的全部流程。
目前全球有一大批 Fabless 和 Foundry，但 IDM 仍占主要地位。

### 常见 IDM

- 国外：
  - 英特尔（Intel）
  - SK 海力士
  - 镁光
  - 恩智普（NXP）
  - 英飞凌
  - 索尼（Sony）
  - 德州仪器（TI）
  - 三星（Samsung）
  - 东芝（Toshiba）
  - 意法半导体（ST）
  - ...
- 大陆：
  - 华润微电子
  - 士兰微
  - 扬杰科技
  - 苏州固锝
  - 上海贝岭
  - ...
- 台湾：
  - 旺宏
  - 华邦
  - ...

### IDM 模式缺点

- **[成本](http://www.moore.ren/job/list-new/155/)高：**
  一般 IDM 需要雄厚[运营](http://www.moore.ren/job/list-new/203/)资本才能支撑，
  故目前仅有极少数的企业能维持
  总体上 IDM 资本支出与 Foundry 相当，却远高于 Fabless；IDM 的研发投入占[销售](http://www.moore.ren/job/list-new/328/)收入比重比 Fabless 低，却要远高于 Foundry。所以，一个成功的 IDM 所需投入巨大。
  如三星虽有晶圆厂、能制造自己设计的芯片，然建厂及维护产线成本高，
  故同时也为 Apple 的 iPhone、iPad 的处理器提供代工服务，
  就连 Intel 也有转向[晶圆代工](http://www.moore.ren/job/list-new/250/)厂的趋势。
- **对[市场](http://www.moore.ren/job/list-new/109/)反应迟钝：**
  IDM 企业的 “体量” 大，所以 “惯性” 也大，因此对市场反应速度慢

### IDM 模式优点

作为目前全球最为主流的一种半导体模式，IDM 优势依然明显。

利润率高，技术领先

- IDM 厂可整合内部资源。
  IC 设计到完成制造所的时间短，即新[产品](http://www.moore.ren/job/list-new/361/)面市时间短，主要原因：
  - 不需要硅[验证](http://www.moore.ren/job/list-new/3/)（SiliconProven）
  - 不存在[](http://www.moore.ren/job/list-new/303/)[工艺](http://www.moore.ren/job/list-new/210/)流程对接问题

  垂直分工模式中，由于 Fabless 在开发新[产品](http://www.moore.ren/job/list-new/361/)时，
  难以及时与 Foundry 的[](http://www.moore.ren/job/list-new/303/)[工艺](http://www.moore.ren/job/list-new/210/)流程对接，造成一个芯片从设计公司到代工企业的流片（晶圆[](http://www.moore.ren/job/list-new/303/)[光刻](http://www.moore.ren/job/list-new/305/)的工艺过程）完成往往需要 6－9 个月，延缓了产品的上市时间。

其次，IDM 厂利润率高。
在整个 IC 产业链，最前端的产品设计、开发与最末端的[品牌](http://www.moore.ren/job/list-new/147/)、[营销](http://www.moore.ren/job/list-new/328/)利润率最高，中间的制造、封装测试环节利润率较低。譬如，在美国上市的 IDM 企业平均毛利率是 44%，净利率是 9.3%，远远高于 Foundry 的 15% 和 0.3% 以及封装测试企业的 22.6% 和 1.9%。
最后，IDM 厂拥有绝对领先的技术优势。
大多数 IDM 都有自己的 IP（Intellectual Property，[知识产权](http://www.moore.ren/job/list-new/169/)）开发部门，经过长期的研发与积累，企业技术储备比较充足，技术开发能力很强，具有绝对领先的技术优势。

IP 核模式及其厂商

IP（[知识产权](http://www.moore.ren/job/list-new/169/)）的供应商处于半导体产业的最上游，由于现在的 IC 设计已步入 SoC（系统级芯片）时代，所以一款 SoC 设计的芯片内可能会包含 CPU、DSP、Memory、以及各类 I/O 接口等，而这些内部单元都是以 IP 的形式集成在一起。

由于大多数 Fabless 没有足够的精力和时间单独开发 IP，必须借助于 IP 供应商的 IP 来加快产品设计和缩短面市时间，所以最近几年 IP 供应商成长很快。

目前，全球各大 IP 供应商主要靠授权费和版税来挣钱，设计公司一般会先购买 IP 技术授权费，在芯片设计完成并[销售](http://www.moore.ren/job/list-new/328/)后，再按照芯片销售的平均价格向 IP 供应商支付一定比例的版税。

不过由于设计成本变得日益昂贵，许多 IP 厂开始进行商业模式变革，将由一些设计用[仿真](http://www.moore.ren/job/list-new/293/)模型组成的设计套件部分（DesignKit）授权给设计公司，将 GDSII 部分（硬核）授权给 Foundry 厂商，以减轻设计公司的授权成本。

有些 IP 厂商还免费提供部分设计套件，设计公司前期不用花一分钱就可以完成[前端设计](http://www.moore.ren/job/list-new/2/)[仿真](http://www.moore.ren/job/list-new/293/)甚至[后端](http://www.moore.ren/job/list-new/4/)布局布线工作，直到设计接近完成时再考虑是否需要取得商业授权来完成设计并量产，以降低设计公司的风险。

全球领先的半导体 IP 核供应商：ARM（被软银收购，全球最大的 IP 核供应商）、Synopsys、Imagination Technologies（收购 MIPS 科技公司） 、Cadence、Silicon Image、Ceva、Sonic、Rambus、eMemory、Vivante Corporation 等。

IP 供应商的困境

一般情况下，真正拥有出色或独特 IP 的小型 IP 厂商，最终都以被并购收场。例如，MIPS 收购 Chipidea、ARM 收购 Artisan，而 Imagination Technologies 最终又吃下了 MIPS，这些 IP 厂大多都被系统厂商或者规模比自己更庞大的 IP 公司收购。


而且，IP 供应商的营业收入仅占 IP 所产生的真实价值的一小部分，相当大的一部分 IP 收入，均流向了 Intel（英特尔）、Qualcomm（高通）、TI（德州仪器）等拥有内部 IP 部门的半导体公司，他们才是真正掌握核心技术的巨头。


除此之外，大部分专业 IP 厂商只能掌握中低端的 IP，多数 IP 因为数量巨大而很难卖出高价。


Fabless 模式及其厂商

Fabless，也就是 IC 设计公司，没有自己的加工厂和封测厂，IC 产品的[生产](http://www.moore.ren/job/list-new/209/)只能依靠专门的[代工厂](http://www.moore.ren/job/list-new/333/)（Foundry）和封装测试厂商。当然，除了进行 IC 设计还要负责 IC 产品的销售。某些 Fabless 具有强大的研发实力，也拥有顶尖的 IP 核产品，IP 授权费和版税成为其重要的收入来源，如芯片[专利](http://www.moore.ren/job/list-new/167/)巨头 Qualcomm。


国外 Fabless 有：高通、博通、英伟达、AMD、美满电子、赛灵思、Dialog、Altera 等。
中国顶尖的 Fabless 有：联发科（台湾）、海思、展讯、晨星半导体（台湾）、联咏科技（台湾）、瑞昱半导体（台湾）等。


Foundry 模式及其厂商

Foundry（[代工厂](http://www.moore.ren/job/list-new/333/)）即无芯片设计能力，但有晶圆[生产](http://www.moore.ren/job/list-new/209/)技术的厂商。目前，全球 Foundry 模式的厂商大多聚集在亚洲，尤以中国大陆、台湾、新加坡、日本和韩国最为著名。
一般来说，Foundry 只专注于 IC 制造环节，不涉足设计和封测，不推出自己的产品，只为 Fabless 和 IDM （委外订单）提供代工服务，并收取一定比例的代工费。
Foundry 可以同时为多家设计公司提供代工，获利相对稳定，但仰赖实体资产，[投资](http://www.moore.ren/job/list-new/165/)规模较大，且维持产线运作的费用高，从这方面来说，Foundry 的进入门槛非常之高。
Foundry 的客户主要有两类：一类是 Fabless 公司，例如 Qualcomm、Nvidia、Xilinx、AMD 等。另一类是 IDM 厂商，例如 Intel，ON，ST，TI，Toshiba 等。
全球顶尖的 Foundry 有：台积电、格罗方德、联华电子、中芯国际、力晶、华虹半导体、towejazz（以色列）、dongbu hitek（韩国）等。


封装测试厂

一块芯片的诞生大致会经历如下几个环节：设计 -[晶圆制造](http://www.moore.ren/job/list-new/250/)- 封装 - 测试。封装，顾名思义就是把裸片（die）用塑料封起来，外部只留接触的 pin 脚。而测试，也可叫 FT（final [test](http://www.moore.ren/job/list-new/322/)），目的是最后出厂时保证你这个产品的性能可满足设计要求。
封装测试企业只专注于封测环节，为 Fabless 或者 IDM 提供封测服务，并收取一定比例的加工费。
目前，台湾封测厂无论是技术还是产能均雄踞全球之首。譬如，排名世界第一的封测大厂日月光，以及名列前茅的矽品、力成、南茂、欣邦、京元电子等均出自台湾。
不过，近年大陆本土封测厂凭借一系列并购动作，地位也迅速攀升。2014 年，长电科技一举吃下了曾排名第四的新加坡封测大厂星科金朋，通富微电也于 2015 年收购 AMD 苏州和 AMD 槟城两家封测工厂各 85% 股份。
大陆 3 大封测巨头：长电科技、华天科技以及通富微电

长电科技：通过收购星科金朋，获取了 SiP、FoWLP 等一系列先进封装技术，借此抢占未来五年先进封装技术的先机，能够为国际顶级客户和高端客户提供下世代领先的封装服务。
收购了星科金朋后，长电科技一跃晋升 2016 年全球前 10 大委外封测厂第三位，业务覆盖国际、国内全部高端客户，包括高通、博通、SanDisk、Marvell、海思、展讯、锐迪科等。
华天科技：在昆山、西安、天水三地均有全面布局，指纹识别、RF-PA、MEMS、FC、SiP 等先进封装产量不断提高，产品[结构](http://www.moore.ren/job/list-new/327/)不断优化，已具备为客户提供领先一站式封装的能力，2017 年公司的先进封装产能有望逐步得到释放。
其中，昆山厂主攻高端技术，深化国际战略布局。昆山厂目前主营晶圆级高端封装，订单量最大的是 CIS 封装，Bumping 封装也开始逐步小批量的生产。
西安厂立足中端封装，突破手机客户，以基本封装产品为主，定位于指纹识别、RF、PA 和 MEMS，MEMS 产量已经突破 1000 万只 / 月，而指纹识别的产能也开始释放。
天水厂定位以中低端引线[框架](http://www.moore.ren/job/list-new/25/)封装与 LED 封装为主，是公司此前营收的主要来源，未来随着天水厂的扩产计划逐步完成并经历产能爬坡后，生产经营将逐步步入稳定状态，营收能力也有望实现较大幅度的提升。
而从技术上来看，华天科技 2016 年发展的最大亮点要数指纹识别产品的封装技术，公司针对不同的需求而开发出了适合的指纹识别封装工艺，尤其是为瑞典 FPC 和汇顶开发的 “TSV+SiP” 指纹识别封装产品已经成功应用于华为系列手机。
通富微电：收购的 AMD 苏州、槟城两厂主要从事高端集成电路封测业务，产品包括 CPU（中央处理器）、GPU（图形处理器）、APU（加速处理器）以及 Gaming Console Chip（游戏主机处理器）等，封装形式包括 FCBGA、FCPGA、FCLGA 以及 MCM 等，先进封装产品占比 100%。
通过该次收购，通富微电实现了两厂先进的倒装芯片封测技术和公司原有技术互补的目的，公司先进封装销售收入占比也因此超过了七成。
