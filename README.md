# image-synthese
course &lt;synthèse de l'image> of FISE3 TSE

## Enveloppe convexe: 
Two naive algos, the first one is simple but complicated to realize and the second one is taught by Mr.Denis with a higher speed and easier to realize, added advanced algo Jarvis and Graham, for more information, please consult the lecture of Mr.Denis. </br>
[凸包算法：包含极边法，Jarvis算法以及graham算法](https://blog.csdn.net/bone_ace/article/details/46239187)

### 极边法（暴力法）
点阵中每两点确定一条直线，遍历剩下的所有点判断这些点是否在已确定直线的同侧，所以遍历两点确定直线需要两次循环，O（n²），再遍历第三个点又需要一次循环，所以总O（n^3)

### Jarvis算法
先确定凸包上的一点（比如最左侧的点），遍历其余点取夹角最大的点确定为第二点，此后每次取当前点与上一点做直线，遍历剩余的点寻找夹角最大的点，直到回到原点，由于对凸包上每一点都要做一次遍历，O（hn），h为凸包上的点的个数

### Graham算法
确定凸包上一点（如最下方的点），计算其余点与该点的极角，并以极角排序，然后将前三个点（包含原点）压入栈，计算栈顶端两点与下一个序号的点的转向，向左转则表示栈顶的点为凸包点，否则栈顶的点出栈，将顺序的下一点压入栈顶，按顺序循环，由于有一次排序，O（n log(n))

## Plus petit cercle englobant
[最小包络圆](https://blog.csdn.net/skytruine/article/details/60882966)

### 暴力法
在点阵中取前两个点，做过这两个点的最小圆，然后从第三个点开始，判断当前点是否处于前面所有点的最小包络圆内，这一过程应用到点阵及一点确定最小圆，点阵及两点确定最小圆，以及三点确定一个圆，细节请参考各子函数。