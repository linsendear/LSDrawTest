# LSDrawTest

iOS 画板/涂鸦 你画我猜 demo

录制脚本：
![image](https://github.com/linsendear/LSDrawTest/blob/master/003.gif ) 

播放脚本：

![image](https://github.com/linsendear/LSDrawTest/blob/master/004.gif ) 


这个demo参考了下面两个项目

https://github.com/WillieWu/HBDrawingBoardDemo

https://github.com/Nicejinux/NXDrawKit

也针对这两个demo做了相应的优化

结构：由上至下

1、最上层的UIView(LSCanvas)

使用CAShapeLayer，提高绘制时的效率

2、第二层的UIImageview是用来合成LSCanvas用的

这样画很多次的时候，也不会占用很高的cpu

3、第三层是UIImageview，是用来放背景图的



关于录制脚本：

1、//linyl标记的代码都是跟录制脚本和绘制脚本相关

2、录制后需要重新跑程序，因为这只是个demo

还需要优化的地方：

1、当前的记录方式是用归档的方式，每次有动作（撤销，重做，保存，清空）和每次的touchsend

后，都会记录成一个LSDrawPackage对象。如果想使用socket传输时，可以改为每0.5秒一个LSDrawPackage对象

，也就是说，每个LSDrawPackage对象都是一段时间内的绘制和操作。（还有一种做法是传送图片或关键帧，但这时候需要评估网络能力，还有绘制的感觉也不一样）

2、线程处理

demo中使用的是performselector的方式，还需要优化。

3、当前的绘制端和显示端公用了很多的内部结构。



ps:

1、没使用drawrect

2、近期没有更新计划了。如果做socket传输的时候，包大小，结构还有很大的优化空间。
