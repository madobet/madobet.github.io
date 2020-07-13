<h1 style="text-align:center">TEMPLATE MATCHING TECHNIQUES IN COMPUTER VISION -- THEORY AND PRACTICE</h1>
<p style="text-align:right">Roberto Brunelli</p>

# Preface

Detection and recognition of objects from their images, irrespective of their orientation,  scale, and view, is a very important research subject in computer vision, if not computer  vision itself. This book focuses on a subset of the object recognition techniques proposed  so far by the computer vision community, those employing the idea of projection to match  image patterns, and on a specific class of target objects, faces, to illustrate general object  recognition approaches. Face recognition and interpretation is a critical task for people, and  one at which they excel. Over the last two decadesit has received increasing attention from the  computer vision community for a variety of reasons, ranging from the possibility of creating  computational models of interesting human recognition tasks, to the development of practical  biometric systems and interactive, emotion-aware, and capable human–machine interfaces.

无论图像的方向，比例和视图如何，从图像中检测和识别对象都是计算机视觉中非常重要的研究主题，即使不是计算机视觉本身。 本书着重介绍了计算机视觉社区迄今为止提出的对象识别技术的子集，这些技术采用投影的思想来匹配图像模式，并着眼于特定类别的目标对象面部，以说明一般的对象识别方法。 人脸识别和解释是人们的一项关键任务，也是他们擅长的一项任务。 在过去的二十年中，由于各种原因，它已经引起了计算机视觉界的越来越多的关注，包括从创建有趣的人类识别任务的计算模型的可能性到实用的生物识别系统以及交互式，情感感知和能力强大的开发。 人机界面。

The topics covered in this book have been investigated over a period of about 30 years by  the image processing community, providing increasingly better computer vision solutions to  the problem of automatic object location and recognition. While many books on computer  vision are currently available that touch upon some of the topics addressed in the present  book, none of them, to the best of the author’s knowledge, provides a coherent, in-depth coverage of template matching, presenting a varied set of techniques from a common perspective.  The methods considered present both theoretical and practical interest by themselves as well  as enabling techniques for more complex vision systems (stereo vision, robot navigation,  image registration, multimedia retrieval, target tracking, landmark detection, just to mention  a few). The book contains many photographs and diagrams that help the user grasp qualitative  and quantitative aspects of the material presented. The software available on the book’s web  site provides a high-level image processing environment and image datasets to explore the  techniques presented in the book.

本书涉及的主题已经由图像处理社区进行了大约30年的研究，为自动对象定位和识别的问题提供了越来越好的计算机视觉解决方案。虽然目前有许多关于计算机视觉的书涉及到本书中涉及的一些主题，但据作者所知，没有一本书提供了模板匹配的连贯，深入的介绍，并提供了多种内容。从一个共同的角度看技术。所考虑的方法本身就具有理论和实践意义，也为更复杂的视觉系统（立体视觉，机器人导航，图像配准，多媒体检索，目标跟踪，地标检测，仅举几例）提供了使能技术。本书包含许多照片和图表，可帮助用户掌握所展示材料的定性和定量方面。本书网站上提供的软件可提供高级图像处理环境和图像数据集，以探索本书中介绍的技术。

Knowledge of basic calculus, statistics, and probability theory is a prerequisite for the  reader. The material covered in the book is at the level of (advanced) undergraduate students  or introductory Ph.D. courses and will prove useful to researchers and developers of computer  vision systems addressing a variety of tasks, from robotic vision to quality control and  biometric systems. It may be used for a special topics course on image analysis at the  graduate level. Another expected use is as a supporting textbook for an intensive short  course on template matching, with the possibility of choosing between a theoretical and an  application-oriented bias. The techniques are discussed at a level that makes them useful also  for the experienced researcher and make the book an essential learning kit for practitioners in  academia and industry.

读者需要基本的微积分，统计和概率论知识。 本书涵盖的材料是高年级本科生或博士学位的入门级。 这些课程对计算机视觉系统的研究人员和开发人员很有用，可以解决从机器人视觉到质量控制和生物识别系统的各种任务。 它可以用于研究生级别的图像分析专题课程。 另一个预期用途是作为模板匹配的短期密集课程的辅助教科书，可以在理论偏差和面向应用的偏差之间进行选择。 在一定程度上讨论了这些技术，使它们也对经验丰富的研究人员有用，并使该书成为学术界和工业界从业人员必不可少的学习工具。

Rarely, if ever, does a book owe its existence to the sole author, and this one certainly  does not. First a tribute to the open source software community, for providing the many tools  necessary to describe ideas and making them operational. To Jaime Vives Piqueres and to  Matthias Baas, my gratitude for providing me with technical help on the rendering of the  three-dimensional models appearing in the book. To Andrew Beatty at Singular Inversions,  appreciation for providing me with a free copy of their programs for the generation of threedimensional head models. A blossomy ‘whoa’ to Filippo Brunelli, for using these programs  to generate the many virtual heads popping up in the figures of the book and feeding some of  the algorithms described. To Carla Maria Modena, a lot of thanks for helping in the revision  of the manuscript. And, finally, very huge thanks indeed to Tomaso Poggio, the best colleague  I ever had, and the main culprit for the appearance of this book, as the first epigraph in the  book tells you.

很少（如果有的话）要归功于唯一的作者，而这本书肯定不是。首先，向开源软件社区致敬，他们提供了描述想法并使之可行所需的许多工具。感谢Jaime Vives Piqueres和Matthias Baas，感谢我为我提供有关书中出现的三维模型的渲染的技术帮助。感谢Singular Inversions的Andrew Beatty，感谢我向我免费提供了他们的用于生成三维头部模型的程序副本。费利波·布鲁内利（Filippo Brunelli）的花朵，向他们致意，他使用这些程序生成了许多虚拟头像，这些虚拟头像突然出现在书中，并提供了上述算法。对于卡拉·玛丽亚·摩德纳（Carla Maria Modena），非常感谢您对稿件的修改提供了帮助。最后，非常感谢Tomaso Poggio，他是我有史以来最好的同事，也是本书出现的主要罪魁祸首，正如书中的第一篇题词告诉您的那样。

<p style="text-align:right">Roberto Brunelli</p>
<p style="text-align:right">Trento, Italy</p>

# 1 INTRODUCTION

Computer vision is a wide research field that aims at creating machines that see, not in  the limited meaning that they are able to sense the world by optical means, but in the  more general meaning that they are able to understand its perceivable structure. Template  matching techniques, as now available, have proven to be a very useful tool for this intelligent  perception process and have led machines to superhuman performance in tasks such as face  recognition. This introductory chapter sets the stage for the rest of the book, where template  matching techniques for monochromatic images are discussed.

计算机视觉是一个广泛的研究领域，旨在创造一种机器，这些机器不仅能够以光学手段感知世界，而且具有能够理解其可感知结构的广义意义。 如今，模板匹配技术已被证明是用于这种智能感知过程的非常有用的工具，并且已使机器在诸如人脸识别等任务中表现出超人的性能。 本介绍性章节为本书的其余部分奠定了基础，其中讨论了单色图像的模板匹配技术。

1.1. Template Matching and Computer Vision

The whole book is dedicated to the problem of template matching in computer vision. While  template matching is often considered to be a very basic, limited approach to the most  interesting problems of computer vision, it touches upon many old and new techniques in  the field.

整本书专门讨论计算机视觉中的模板匹配问题。 尽管模板匹配通常被认为是解决计算机视觉最有趣的问题的一种非常基本的有限方法，但它涉及了该领域的许多新旧技术。

两个术语 模板 和 匹配，定义：

**template/pattern**
1. Anything fashioned, shaped, or designed to serve as a model from which
something is to be made: a model, design, plan, outline.
可以用作制作模型的任何形式，形状或设计的东西：可以是，模型，设计，计划，轮廓等
2. Something formed after a model or prototype, a copy; a likeness, a similitude.
样板在模型或原型之后形成的东西; 一种 likeness 或 similitude
1. An example, an instance; esp. a typical model or a representative instance.
例子或实例 —— 尤其是 典型模型 或 代表性实例。

**matching**
1. Comparing in respect of similarity; to examine the likeness or difference of.
比较对应的相似性，或检查相似性及差异性

Yet another form of variability  derives from intrinsic variability across physical object instances that causes variability  of the corresponding image patterns: consider the many variations of faces, all of them  sharing a basic structure, but also exhibiting marked differences. Another important source of  variability stems from the temporal evolution of a single object, an interesting example being  the mouth during speech. Many tasks of our everyday life require that we identify classes  of objects in order to take appropriate actions in spite of the significant variations that these  objects may exhibit. The purpose of this book is to present a set of techniques by which  a computer can perform some of these identifications. The techniques presented share two  common features:

模板可能还具有某些可变性（variability）：并非所有 instances 都 exactly equal（参见图1.1）。关于模板可变性一个简单例子是附加噪声（additive noise）的破坏（corrupted），另一个重要例子是从不同角度观察同一物体（意思就是会得到不同的 instance？）。照明（illumination），imaging sensor 或传感器配置的变化也可能导致重大变化（significant variations）。可变性的另一种形式源自物理对象实例之间的内在可变性，该可变性导致相应图像模式的可变性：考虑面部的多种变化，它们都共享基本结构，但也表现出明显的差异。可变性的另一个重要来源来自单个对象的时间演变，一个有趣的例子是语音中的嘴巴。日常生活中的许多任务要求我们识别对象的类别，以便尽管这些对象可能表现出很大的差异，也要采取适当的措施。本书的目的是介绍计算机可以用来执行其中一些标识的一组技术。提出的技术具有两个共同的特征：
