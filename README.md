# LSDrawTest
iOS 涂鸦demo

 这个demo主要是参考了下面两个项目
 
 https://github.com/WillieWu/HBDrawingBoardDemo
 
 https://github.com/Nicejinux/NXDrawKit
 
 也针对这两个demo做了相应的优化
 
 TODO:
 1、撤销数组设置最大值
 
 2、优化曲线的绘制
 
 3、等等
 
 结构：由上至下
 
 1、最上层的UIView(LSCanvas)
 使用CAShapeLayer，提高绘制时的效率
 
 2、第二层的UIImageview是用来合成LSCanvas用的
 
 这样画很多次的时候，也不会占用很高的cpu
 
 3、第三层是UIImageview，是用来放背景图的
 
 ps:
 没使用drawrect
