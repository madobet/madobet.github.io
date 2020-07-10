选自 dlib Blog

**参与：路雪、李泽南、蒋思源**

> dlib 是一个开源的 C++ 机器学习算法工具包，被广泛用于工业界和学术界，覆盖机器人、嵌入式设备、手机和大型高性能计算设备等环境。在最近一次更新（v19.8）中，其开发者引入了自动调优超参数的 LIPO 算法。据开发者称，这种方法超越了此前调整参数使用的各类方法。

**Dlib：全局优化算法**

所有机器学习开发者都会遇到同样一个问题：你有一些想要使用的机器学习算法，但其中填满了超参数——这些数字包括权重衰减率、高斯核函数宽度等等。算法本身并不会设置它们，你必须自己决定它们的数值。如果你调的参数不够「好」，那么算法是不会工作的。那么该如何是好？下面的列表是所有人都会做的事，按使用频率从高到低排列：

-   依靠经验：聆听自己的直觉，设置感觉上应该对的参数然后看看它是否工作，不断尝试直到累趴。
-   网格搜索：让计算机尝试一些在一定范围内均匀分布的数值。
-   随机搜索：让计算机尝试一些随机值，看看它们是否好用。
-   贝叶斯优化：使用类似 MATLAB bayesopt 的工具自动选取最佳参数——结果发现贝叶斯优化的超参数比你自己的机器学习算法还要多，累觉不爱，回到依靠经验和网格搜索方法上去。
-   从一个好的初始猜测开始局部优化：这是 MITIE 的思路，它使用 BOBYQA 算法和一些较好的初始点开始工作。因为 BOBYQA 只能找到最近的局部最优解，所以该方法的效果严重依赖一个好的起始点。在 MITIE 方法上我们知道好的开始是成功的大部分，但问题在于我们经常难以找到一个好的起始点。另一方面，这种类型的方法非常适用于寻找局部最优解。稍后我们会再谈到这个问题。

在调参时，绝大多数人只会凭经验进行猜测。这不是个好现象，我们需要更合理的方法。所有人都希望一些黑箱优化策略如贝叶斯优化变得实用化，但在我看来，如果你不把贝叶斯优化的超参数调对，它就无法展现专家级的调参能力。事实上，我认识的每个使用贝叶斯优化的人都有着相同的经验。最终，如果我认为手调参数更加方便，我就会转回到传统方法上去，这也是所有使用类似工具的人都会遇到的事。所以结果就是我们一般不会使用自动超参数选择工具——令人沮丧的结论。我们都希望出现一个无参数的全局优化器，其中的超参数选择是我们可以信任的。

所以在我看到 Cédric Malherbe 和 Nicolas Vayatis 在今年 ICML 大会上的论文《Global optimization of Lipschitz functions》时，我感到非常兴奋。在这篇论文中，研究人员提出了一个非常简单的无参数且可证明正确的方法来寻找令函数 f(x) 最大化的 x∈R^d，即使 f(x) 存在很多局部极大值。论文的核心思想在于保持 f(x) 的分段线性上界，随后使用它在每一步优化中决定 x 的估计值。所以如果你已经估计出了 x_1，x_2，……，x_t，你可以轻松地这样定义 f(x) 的分段上界：

其中 k 是 f(x) 的 Lipschitz 常数。因此，根据 Lipschitz 常数的定义，显然对于所有 x 有 U(x)≥f(x)。论文作者随后提出了一个名为 LIPO 的简单算法，它可以随机选点，检查新点的上界是否比已有的最优点更好，如果是的话将更新改点为新的最优值。例如，下图展示了一个简单的红色 f(x)，其上界 U(x) 为绿色。在这个例子中 U(x) 有四个点，由黑色方块表示。

![](http://5b0988e595225.cdn.sohucs.com/images/20180103/514a12090516426eb1c403b903b25204.png)

我们不需要想象上界是如何帮助我们评估最优点的。例如，如果你选择最大上界作为下一次迭代，你就已经非常接近全局极大值了。论文作者随后继续证明了这种方法的一些不错的属性。值得一提的是，他们是用数学方法证明的，同时也实践展示了这种方法在很多非常规情形下要比随机搜索要好——考虑到随机超参数搜索（Random Search for Hyper-Parameter Optimization，James Bergstra & Yoshua Bengio）的效果非常强大，这是一个强有力的声明。在论文中，研究人员也对贝叶斯优化等算法进行了比较，并展示了 LIPO 的竞争力。

此时此刻你或许会说：「等一下，我们并不知道 Lipschitz 常数 k 的值！」这不是一个大问题，因为它非常容易估计，例如，可以将 k 设置为每次迭代前观察到的 f(x) 的最大斜率。这相当于解决如下问题：

![](http://5b0988e595225.cdn.sohucs.com/images/20180103/7469ebc2e5994bab862aec09ca0bd04f.png)

Malherbe 等人测试了这种估算 k 的方法，并展示了它的优秀性能。

他们提出的 LIPO 全局优化方法既没有参数，也被证明优于随机搜索，而且非常简单。阅读这篇论文会给你一种「Duang」的感觉，让你后悔为何自己没有早一点想到这种方法——这就是一篇好论文的标志。所以我显然希望在 dlib 中加入某种形式的 LIPO 算法，并实现到了最新的 dlib v19.8 版本中。

不过，如果想要在实践中用到 LIPO，你还需要解决一些问题。本文的下半部分将讨论这些问题并解释 dlib 是如何实现并解决它们的。首先，如果 f(x) 是嘈杂或不连续的（甚至只有一点点），k 就会变成无限大，这种情况在现实世界中经常出现。例如，在评估二元分类器中的 0-1 损失函数时，任何样本在预测不同的类别都会有一点点不连续性。你或许会无视它继续运行 LIPO，但有很大风险会遇到两个 x 样本横跨不连续点，并导致 k 值爆炸。第二，并不是所有的超参数都同等重要，一些几乎没有意义，而另一些则对于 f(x) 的输出影响很大。所以每个超参数都有特定的 k 值就更好了。你可以通过这样定义上界 U(x) 来解决这些问题：

![](http://5b0988e595225.cdn.sohucs.com/images/20180103/17bcfe3107e2431c88cfd79dfa8e13c2.png)

现在，每个 f(x) 都有自己的噪声项σ\_i，它在大部分时间里应该是 0，除非 x_i 真的接近于不连续或存在一些随机性。在这里，K 是一个对角矩阵，包含「每个超参数的 Lipschitz k 项」。通过这个公式，可将每个σ设为 0，K = (k^2)I 会给出与 Malherbe 等人所提出的相同的 U(x)，如果我们让它们采用更加一般的值，则我们可以解决上面提到的问题。

和之前一样，我们可以通过求解一个最优化问题来寻找 U(x) 的参数：

![](http://5b0988e595225.cdn.sohucs.com/images/20180103/9b58cedc204c4adfaa30012dcaeff550.png)

σ^2 上的 10^6 罚项系数将导致大部分σ为零。整个算法对此处使用的特定罚项值并不敏感，只要罚项值足够大，σ 大部分情况下都会是 0，且 k 不会出现无穷大的情况，这正是我们希望看到的。我们还可以将其重写为大型二次规划问题，使用对偶坐标下降方法（dual coordinate descent method）解决。此处不详述过程，感兴趣的同学可以查看 dlib 代码。重点就是使用这个众所周知的方法可以很容易地解决问题，且解决了 k 的无穷大问题。

最后需要解决的问题是 LIPO 在局部极大值点区域中糟糕的收敛情况。尽管 LIPO 确实能够轻松到达 f(x) 最高峰，但到达之后它无法快速移动至最优位置（即峰值）。这是很多无导数优化算法的通病，包括 MATLAB 的贝叶斯优化工具。所幸，不是所有的方法都有这种局限性。Michael J. D. Powell 写了大量论文论述如何将经典的置信域方法应用到无导数优化算法中。这些方法拟合当前最优解的二次曲面，然后下一次迭代至与当前最优解有一定距离的二次曲面极大值点。因此，我们「相信」该局部二次模型在最优点的邻域内是准确的，所以该区域也叫「置信域」。上文提到的 BOBYQA 方法是这些方法其中之一，它可以很好地收敛至最近邻的局部最优解，在几步内轻松找到达到全浮点精度的局部最优解。

我们可以结合这两种方法来解决 LIPO 的收敛问题，LIPO 将探索 f(x)，快速找到最高峰上的点。然后 Powell 的置信域方法可以有效找到该峰的最大值点。结合二者最简单的方式是交替使用，这就是 dlib 所做的。在偶数迭代时，我们根据上界选取下一个 x；在奇数迭代时，我们根据置信域模型选取下一个 x。我还使用了与 LIPO 稍微不同的版本，我称之为 MaxLIPO。Malherbe et al. 建议选取任意上界大于当前最优目标值的点。但是，我发现在每次迭代时选取最大上界点稍好一些。该交替版本 MaxLIPO 就是 dlib 使用的版本。下图展示了这种 MaxLIPO 和置信域方法的混合方法的运行：

![](http://5b0988e595225.cdn.sohucs.com/images/20180103/d29e7e786ed64882bbd29b92c80764dd.jpeg)

上图中红线是待优化函数，我们试图寻找最大值点。我们注意到每一次算法从函数中采样一个点时都会出现一个小框。求解器的状态由全局上界 U(x) 和置信域方法使用的局部二次模型决定。因此，我们绘制出上界模型和当前的局部二次模型，这样你就可以看到它们随着优化过程所发生的进化。我们还用一条纵线表示目前见到的最佳点的位置。

你可以看到优化器根据二次模型在选取最大上界点和最大值点之间交替运行。随着优化的进展，上界逐渐变得更加准确，帮助我们找到最佳点，而二次模型不论处于什么位置都可以快速找到高精度极大值点。如视频结尾所示，二者使得优化器找到真正的全局高精度最大值点（在本示例中精度在 ±10^−9 范围内）。

![](http://5b0988e595225.cdn.sohucs.com/images/20180103/19e11a548bb849b39262ec39e829575f.jpeg)

现在我们来做一个实验，看看在默认设置下，MaxLIPO 和置信域方法（TR）相结合的混合方法与 MATLAB 的贝叶斯优化工具的对比结果。我在 Holder table 测试函数上将两个算法运行 100 次，并使用标准偏差误差带绘制平均误差。因此下图展示了 f(x\*)−f(x_i)，即真正的全局最优值和当前最优解的差。你可以看到 MATLAB 的贝叶斯优化在准确率 ±10^−3 时出现停滞，而我们的混合方法（MaxLIPO+TR）快速到达全浮点精度 ±10^−17。

![](http://5b0988e595225.cdn.sohucs.com/images/20180103/04aa9e73b01945cbbd8503b526332bae.jpeg)

我还对 LIPO 论文图 5 中的一些测试进行了重新测试，结果显示在下表中。在这些实验中，我比较了有或没有置信域求解器（LIPO+TR 和 LIPO）的 LIPO 性能。此外，为了验证 LIPO 优于纯随机搜索方法，我测试了在纯随机搜索方法和置信域求解器（PRS+TR）之间交替选择，而不是在 LIPO 方法与置信域求解器（LIPO+TR and MaxLIPO+TR）之间交替选择。我们将纯随机搜索（PRS）也包括在内以供参考。我在每次测试中运行 1000 次算法，并记录达到特定求解准确度的 f(x)，及其调用次数的均值与标准差。例如，ϵ=0.01 意味着 f(x\*)−f(x_i)≤0.01，而「target 99%」使用 Malherbe 论文中的「target」，对于大多数测试来说这对应于 ϵ>0.1。若测试的执行花费了太多时间，那么我将使用符号「-」。

这些结果的关键点是增加一个置信域以允许 LIPO 达到更高的求解准确率。因为 LIPO 通过使用 U(x) 的随机搜索，这会令算法运行得更快。因此，LIPO 对 U(x) 的调用数量至少与 PRS 在搜索 f(x) 时所需的一样多。此外，对于较小的 ϵ，执行 LIPO 将变得十分昂贵。例如，由于 LIPO 的执行时间太长，所以在任何测试问题上我们对 LIPO 的测试结果并不能达到 0.1 以上的准确度。但是，如果我们采用置信域的方法，那么组合的算法可以轻松实现高精度解。另一个重要的细节是，对于具有许多局部最优解的测试，结合 LIPO 与 TR 的所有方法都比 PRS+TR 的方法好。这在 ComplexHolder 上尤其突出，ComplexHolder 是 HolderTable 测试函数的一个版本，它具有额外的高频率正弦噪声，因此能显著增加局部最优解的数量。在 ComplexHolder 中，基于 LIPO 的方法要求 f(x) 的调用比 PRS + TR 少一个数量级，进一步证明了 Malherbe 等人的结论，即 LIPO 相对于纯随机搜索更有优势。

![](http://5b0988e595225.cdn.sohucs.com/images/20180103/7b4f2a33f11e4dfcb87433fc620674f7.jpeg)

dlib 中的新方法 MaxLIPO+TR 在我所有的测试中是最好的，这种方法最引人注目的地方就是它的简单性。特别是 MaxLIPO+TR 不存在任何超参数，因此它非常易于使用。我已经使用 dlib 工具一段时间了，现在使用它进行超参数优化效果也非常好。这是第一个我非常有信心的黑箱超参数优化算法，它真的可用来解决实际问题。

最后，下面是一个简单的案例，展示如何在 Python 中使用这个新的优化器。

1.  defholder_table(x0,x1):
2.  return-abs(sin(x0)\*cos(x1)\*exp(abs(1-sqrt(x0\*x0+x1\*x1)/pi)))

4.  x,y = dlib.find_min_global(holder_table,
5.  \[-10,-10], # Lower bound constraints on x0 and x1 respectively
6.  \[10,10], # Upper bound constraints on x0 and x1 respectively
7.  80) # The number of times find_min_global() will call holder_table()


9.  OrinC++11:
10. auto holder_table = \[](double x0, double x1) {return-abs(sin(x0)\*cos(x1)\*exp(abs(1-sqrt(x0\*x0+x1\*x1)/pi)));};


12. // obtain result.x andresult.y
13. auto result = find_min_global(holder_table,
14. {-10,-10}, // lower bounds
15. {10,10}, // upper bounds
16. max_function_calls(80));

这些方法都可以在约 0.1 秒内找到 holder_table 的全局最优解，且精度能达到 12 digits。C++ API 已经公开了多种调用求解器的方法，包括一次优化多个函数和添加整型约束。若读者希望了解更多的细节，请查看该工具的文档。

dlib 文档地址：[http://dlib.net/optimization.html#find\\\_max\\\_global](http://dlib.net/optimization.html#find_max_global)

原文地址：[http://blog.dlib.net/2017/12/a-global-optimization-algorithm-worth.html](http://blog.dlib.net/2017/12/a-global-optimization-algorithm-worth.html)



Dlib 图片格式转换及 Dlib 与 OpenCV 图片格式互转：

1. 图片 dlib 以 dlib::array2d 形式保存，而 oepncv 是以 cv::Mat 的形式存在，关于 opencv 图像之间的转换，网上有很多资料，这里不再赘述，仅介绍一下 dlib 的图片格式转换以及 dlib 与 opencv 之间图片格式的互转。

2. dlib 中读取图片：
```C++
    dlib::array2d<dlib::rgb_pixel> img_rgb;
    dlib::load_image(img_rgb, "test_image.jpg");
```
3. RGB 转灰度：

    dlib::array2d<unsigned char> img_gray;
    dlib::assign_image(img_gray, img_rgb);

4. dlib 转换成 OpenCV 图片：

    #include <dlib/opencv.h>
    #include <opencv2/opencv.hpp>
    cv::Mat img = dlib::toMat(img_gray);

5. OpenCV 转 Dlib：

    #include<dlib/opencv.h>
    #include<opencv2/opencv.hpp>
    cv::Mat img =cv::imread("test_image.jpg");
    dlib::cv_image<rgb_pixel>=dlib_img(img);

6. Opencv 灰度图片转 Dlib 灰度图片：

```
#include<dlib/opencv.h>
#include<opencv2/opencv.hpp>
cv::gray_img
cv::Mat rgb_img = cv::imread("test_image.jpg");
cv::cvtcolor(rgb_img,gray_img,cv::COLOR_BGR2GRAY);
dlib::cv_image(uchar)=dlib_gray_img(gray_img);

```

参考链接：

[Convert RGB Image to Grayscale Image in DLIB](https://link.zhihu.com/?target=https%3A//stackoverflow.com/questions/38180410/convert-rgb-image-to-grayscale-image-in-dlib)

[http://dlib.net/imaging.html](https://link.zhihu.com/?target=http%3A//dlib.net/imaging.html)

# 优化思路

dlib检测的时候占用太多计算量，在官方文档中
std::vector<rectangle> faces = detector(cimg);
detector 会造成 dlib 检测速度过慢，导致调用摄像头进行关键点检测时卡顿非常严重


将 RGB 转为灰度减少计算量
dlib 官方提供的example采用的是Dlib格式的图片，如果你采用OpenCV格式的图片作为参数传递会提示参数不匹配的错误，代码传送门请点击下面的小卡片链接。

http://dlib.net/optimization.html
https://www.sohu.com/a/214461494_465975
http://article.lujishu.net/viewarticle/129132197405011
http://dlib.net/webcam_face_pose_ex.cpp.html
https://zhuanlan.zhihu.com/p/36456092
https://zhuanlan.zhihu.com/p/90788153
