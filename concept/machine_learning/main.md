<!-- 西瓜书为主 -->
# 绪论

## 引言

- 如果计算机科学是研究关于“算法”的学问，那么ML是研究关于“学习算法”的学问
- 机器学习（下称ML）：研究如何通过计算的手段，利用经验改善系统自身的性能的学科
- 特别的，信息系统中，“经验”通常以“数据”形式存在，因此，
  ML研究的主要内容：“学习算法”（learning algorithm）=从数据中产生模型（model）的算法。
- 模型（model）：泛指从数据中学得的结果。或者说就是学习算法在给定数据和参数空间上的结果？
  有文献用“模型”指全局性结果（如一棵决策树），“模式”指局部性结果（如一条规则）。

## 基本术语

ML 的“数据”相关的术语（可以类比类的定义和类的实例的关系）：
- 数据集（data set）：一组记录的集合
- 示例（instance）/样本（sample）：就是记录，这个记录是关于一个事件或对象的描述
- 属性（attribute）/特征（feature）：反应事件或对象在某方面的表现或性质的事项。其取值自然称为属性值（attribute value）。
- 属性空间（attribute space）/样本空间（sample space）/输入空间：属性/特征张成的空间
  通常假设在样本空间中全体样本服从一未知分布（distribution），
  每个样本都独立同分布（independent and identically distributed 简称 i.i.d.）
- 特征向量（feature vector）：自然，每个样本可以对应样本空间一点，也就是一个坐标向量，因此可将一个示例/样本称特征向量
- 样本的维数和样本空间的维数：字面意思
- 标记/标签（label）：要学习预测，自然的需要样本的标签（监督学习限定？）
- 标记空间（label space）/输出空间：
- 样例（example）：sample + label
- 测试样本（testing sample）：测试中被预测的样本。如习得 f 后，对测试例 x 得预测标记 y=f(x)

ML 的？
- 学习（learning）/训练（training）：从数据中习得模型的过程
- 训练数据（training data）：训练过程使用的数据，其中每个样本称训练样本（training sample）
- 训练集（training set）：训练 example 组成集合
- 假设（hypothesis）：从训练集学得模型对应了关于数据的某种潜在规律
- 真相/真实（ground-truth）：潜在规律自身（学习过程就是为了找出或逼近真相）
- 学习器（learner）：模型的别称，可看作学习算法在给定数据和参数空间上的实例化
- 学习任务类别：
  - 监督学习（supervised learning）
    - 分类（classification）：预测的是离散值
      对只涉及两类别的二分类（binary classification），
      通常称一个正类（positive class），另一个反类（negative class）
      对涉及多类别，称多分类（multi-class classification）
    - 回归（regression）：预测的是连续值
  - 无监督学习（unsupervised learning）
    - 聚类（clustering）：将训练集中样例分为若干组，每组称一簇（cluster），这些自动形成的簇可能对应一些潜在概念划分。

一般，预测任务希望通过对训练集学习得到样本空间 -> 标记空间的映射（所以说这个模型也就是映射？）

- 测试（testing）：习得模型后，进行预测的过程
- 泛化（generalization）：习得模型应用于新样本，或者说将模型用于整个样本空间。
  训练集通常只是样本空间小采样，仍希望其很好反映样本空间特性，
  否则很难期望训练集上习得的模型在整体样本空间上工作良好。
  显然的，一般训练样本越多，得到样本空间分布信息越多，习得模型泛化能力自然强

形式化描述 -> 略

## 假设空间

科学推理两大基本手段：
- 归纳（induction）：从特殊到一般的 generalization，即从具体的事实归结出一般性规律
- 演绎（deduction）：从一般到特殊的 specialization，即从基础原理推演出具体状况

“从样例中学习”显然是一归纳过程，因此亦称“归纳学习”（inductive learning），分为：
- 广义的归纳学习：大体=从 example 中学习
- 狭义的归纳学习：训练数据中习得概念（concept），又叫概念学习、概念形成。
  目前，概念学习研究、应用均少，因为要学得泛化好且语义明确的概念很困难，现实常用技术大多“黑箱”模型。
  对概念学习的了解有助理解机器学习的一些基础思想。
  - 布尔概念学习：对“是”、“不是”这种可表示为 0/1 布尔值的目标概念的学习。是最基本的概念学习。

可将学习过程看作一在所有假设（hypothesis）组成空间中搜索过程，
搜索目标是找到与训练集“匹配”（fit）的假设，
即能将训练集中 example 判断正确的假设。
假设的表示一旦确定，假设空间及其规模大小就确定了。

结合 p5 的例子和页面边的注解看，理解：
- 空集 表示的意思
- 假设空间如何被表示成一棵树
- 对假设空间有哪些搜索策略：自顶向下、从一般到特殊、自底向上、从特殊到一般，...

现实常面临很大假设空间，而学习过程基于有限样本训练集，因此可能有多假设与训练集一致，
即存在一与训练集一致的“假设集合”，称“版本空间”（version space）。

注：“记住”训练样本，即所谓“机械学习”（Cohen and Feigenbaum, 1983），或称死记硬背式学习

## 归纳偏好

语境：习得的模型对应了假设空间中一个假设。但是因为上面所说，这可能只是版本空间中一个假设，
而版本空间中会有多个可用假设，从而如果采用了不同假设，面对新样本会产生不同输出

# 其他

MNIST 算得上是机器学习界的 Hello World
由 Yann LeCun 等人建立的 手写字符数据集

MNIST 数据集包含的文件：
train-images-idx3-ubyte.gz 9.45 MB  训练图像数据
train-labels-idx1-ubyte.gz 0.03 MB  训练图像的标签
t10k-images-idx3-ubyte.gz 1.57 MB  测试图像数据

《Deep Learning with Python》
ML 繁荣于 1990s，然后快速成为 AI 最流行和最成功的子领域。

Machine learning is tightly related to mathematical statistics, but it differs from statistics in several important ways. Unlike statistics, machine learning tends to deal with large, complex datasets (such as a dataset of millions of images, each consisting of tens of thousands of pixels) for which classical statistical analysis such as Bayesian analysis would be impractical. As a result, machine learning, and especially deep learning, exhibits comparatively little mathematical theory—maybe too little—and is engineering oriented.

机器学习与数学统计紧密相关，但是它与统计有一些重要的区别：与统计不同，机器学习倾向于处理大型，复杂的数据集（例如数百万个图像的数据集，每个数据集由数万个像素组成）。 诸如贝叶斯分析之类的经典统计分析将是不切实际的。 结果，机器学习，尤其是深度学习，展示的数学理论相对较少（可能太少），并且是面向工程的。


机器学习做什么？I just stated that machine learning discovers rules to execute a data-processing task, given examples of what’s expected. So, to do machine learning, we need three things:
输入数据点
期望输出的实例
衡量结果

A machine-learning model transforms its input data into meaningful outputs, a process that is “learned” from exposure to known examples of inputs and outputs. There-fore, the central problem in machine learning and deep learning is to meaningfully transform data: in other words, to learn useful representations of the input data at hand—representations that get us closer to the expected output. Before we go any further: what’s a representation? At its core, it’s a different way to look at data—to rep-resent or encode data. For instance, a color image can be encoded in the RGB format(red-green-blue) or in the HSV format (hue-saturation-value): these are two different representations of the same data. Some tasks that may be difficult with one representation can become easy with another. For example, the task “select all red pixels in the image” is simpler in the RG format, whereas “make the image less saturated” is simpler in the HSV format. Machine-learning models are all about finding appropriate representations for their input data—transformations of the data that make it more amenable to the task at hand, such as a classification task.
(P30)

So that’s what machine learning is, technically: searching for useful representations of some input data, within a predefined space of possibilities, using guidance from a feedback signal.
P31

The deep in deep learning isn’t a reference to any kind of deeper understanding achieved by the approach; rather, it stands for this idea of successive layers of representations. How many layers contribute to a model of the data is called the depth of the model.

Deep learning 的其他名字：
layered representations learning
hierarchical representations learning

现代模型通常包含十层甚至上百表示层

Meanwhile, other approaches to machine learning tend to focus on learning only one or two layers of representations of the data; hence, they’re sometimes called shallow learning.

DL 中，这种层化的表示几乎全都是用神经网络模型学习而来

although some of the central concepts in deep learning were developed in part by drawing inspiration from our understanding of the brain, deep-learning models are not models of the brain. There’s no evidence that the brain implements anything like the learning mechanisms used in modern deep-learning models.
尽管 DL 中的一些核心概念来自于我们对大脑的理解，但 DL 模型不是大脑模型。没有证据表明大脑实现了任何类似现代 DL 模型的学习机制。

pop-science 流行科学
proclaiming 宣称
modeled after brain 模仿大脑
,but that isn't the case. 但事实并非如此

It would be confusing and counterproductive for new-comers to the field to think of deep learning as being in any way related to neurobiology; you don’t need that shroud of “just like our minds” mystique and mystery, and you may as well forget anything you may have read about hypothetical links between deep learning and biology.

multistage information-distillation operation 多级信息蒸馏操作

successive 连续的

So that’s what deep learning is, technically: a multistage way to learn data representations. It’s a simple idea—but, as it turns out, very simple mechanisms, sufficiently scaled, can end up looking like magic.

The specification of what a layer does to its input data is stored in the layer’s weights, which in essence are a bunch of numbers. In technical terms, we’d say that the transformation implemented by a layer is parameterized by its weights.

那么什么是 learning:
Learning means finding a set of values for the weights of all layers in a network, such that the network will correctly map example inputs to their associated targets. But here’s the thing: a deep neural network can contain tens of millions of 数以千万的 parameters. Finding the correct value for all of them may seem like a daunting task, especially given that modifying the value of one parameter will affect the behavior of all the others!
