# 2020 开源轻量 OD Net

过去几年 YOLOv3 流行，速度-精度完美协调，不需要依赖包（全部 C++ 实现），
作者 [Joseph Redmon](https://pjreddie.com) 因不能忍受 AI 算法用于军事和隐私窥探（何时？）宣布退出 CV 界

一个训练 YOLOv3 的教程：https://blog.csdn.net/USTCsunyue/article/details/93648307

## YOLO Nano

paper: [YOLO Nano: a Highly Compact You Only Look Once Convolutional Neural Network for Object Detection](https://arxiv.org/abs/1910.01271)

code:  [https://github.com/liux0614/yolo_nano/issues/5](https://github.com/liux0614/yolo_nano/issues/5)

研究者提出了名为 YOLO Nano 的网络。这一模型的大小在 4.0MB 左右，比 Tiny YOLOv2 和 Tiny YOLOv3 分别小了 15.1 倍和 8.3 倍。在计算上需要 4.57B 次推断运算，比后两个网络分别少了 34% 和 17%。在性能表现上，在 VOC2007 数据集取得了 69.1% 的 mAP，准确率比后两者分别提升了 12 个点和 10.7 个点。研究者还在 Jetson AGX Xavier 嵌入式模块上，用不同的能源预算进行了测试，进一步说明 YOLO Nano 非常适合边缘设备与移动端。
作者：滑铁卢大学 & DarwinAI

实验结果：

![](https://www.pianshen.com/images/372/3fd3225105ec0c6be42707072a8f0ad4.png)

-   ## Gaussian YOLOv3

paper: [Gaussian YOLOv3: An Accurate and Fast Object Detector Using Localization Uncertainty for Autonomo](https://arxiv.org/abs/1904.04620)

code:   [https://github.com/jwchoi384/Gaussian_YOLOv3](https://github.com/jwchoi384/Gaussian_YOLOv3)

在目标检测的落地项目中，实时性和精确性的 trade-off 至关重要，而 YOLOv3 是目前为止在这方面做得最好的算法。本文通过高斯分布的特性，改进 YOLOv3 使得网络能够输出每个检测框的不确定性，从而提升了网络的精度。YOLOv3 识别出的目标类别是有置信度的，但目标框只有位置而没有置信度，也就是说，从结果中无法预知当前目标框的可靠性。基于这一点，Gaussian-YOLOv3 利用 Gaussian 模型来对网络输出进行建模，在基本不改变 YOLOv3 网络结构和计算量的情况下，能够输出每个预测框的可靠性，并且在算法总体性能上提升了 3 个点的 mAP。

实验结果：

![](https://www.pianshen.com/images/909/4504bedbfd53f899da6244bcb22b5ed5.JPEG)

-   ## CSPNet

paper:[CSPNet: A New Backbone that can Enhance Learning Capability of CNN](https://link.zhihu.com/?target=https%3A//arxiv.org/pdf/1911.11929.pdf)

code: [github.com/WongKinYiu/CrossStagePartialNetworks](https://github.com/WongKinYiu/CrossStagePartialNetworks)

很棒的 backbone，在检测任务上性能优于 YOLOv3-tiny，CSPPeleeNet 在 Jetson TX2 速度高达 41FPS！现已开源

![](https://www.pianshen.com/images/170/e3e65999eef6d8bfeff3136deb7cf83a.png)

摘要：本文提出了跨阶段局部网络（CSPNet，Cross Stage Partial Network），以缓解以前的工作从网络体系结构角度出发需要大量推理计算的问题。我们将问题归因于网络优化中的重复梯度信息。提出的网络通过集成网络阶段开始和结束时的特征图来 respect 梯度的可变性，在我们的实验中，该过程将 ImageNet 数据集的计算量减少了 20％，具有同等甚至更高的准确性，并且明显优于状态 MS COCO 目标检测数据集中的 AP50 方面的最先进方法。CSPNet 易于实施，并且通用性足以应付基于 ResNet，ResNeXt 和 DenseNet 的体系结构。

实验结果：

![](https://www.pianshen.com/images/956/0649a99f1c76c636101d6dec5c298b54.png)

作者：中央研究院資訊科學研究所 & 台湾交通大学
