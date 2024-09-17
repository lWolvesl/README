# Machine Learning

- Please view the [blog](https://www.wolves.top/blog/ml/) to avoid rendering issues

## 1.First chapter - instruction

### 1.1 supervised learning

- regression
- classification

### 1.2 unsupervised learing

- Clustering 聚类算法
- Dimensionality reduction
  - 少所考虑的随机变量数量的过程，目的是获得一组主要变量。

### 1.3 Jupyter Notebook

## 2.Supervised Learing

### 2.1 Linear regression

$$
f(x) = wx+b
$$

- x is input feature / variable

A experiment:`https://github.com/mohadeseh-ghafoori/Coursera-Machine-Learning-Specialization.git`

- Cost function
  - Mean Squared Error, MSE - 均方差

$$
\text{Residual} = \hat{y}^{(i)} - y^{(i)}
\\
J(w,b) = \frac{1}{2m} \sum_{i=1}^{m} (y_{w,b}(x^{(i)}) - y^{(i)})^2
$$

- goal

$$
\underset{w,b}{minimize}\ J(w,b)
$$

- 三维转二维-等高线原理

### 2.2 Gridient Descent

- 在当前的节点找下降速度最快的方向走一步，然后再找下一个方向，最终达到局部最小值`loacl minima`（贪心）

$$
w_j = w_j - \alpha\cdot\frac{\partial J(W,b)}{\partial w_j}
$$

$$
b = b - \alpha\cdot\frac{\partial J(W,b)}{\partial b}
$$

- $ \alpha $ is learning rate
- Simultaneously update
  - It mains we need calculate first , then update both of the value
- Here is negative gradient

**Learning Rate**

- Small
  - Gradient descent may be slow
- Large
  - Gradient descent may 
    - Overshoot
    - Fail to converge
    - Diverge

![](https://i.wolves.top/picgo/202408041059271.png)

**Batch**

- Each step of gradient descent

### 2.3 Multiple features (variables)

$$
\ {\vec{x}^{(2)}_{3}} = \begin{bmatrix} x_1 & x_2 & x_3 & x_4 \end{bmatrix}
$$

- $x_j$ = $j^{th}$(feature)
- $n$ : number of features
- $\vec{x}^{(i)}$ : features of ($i^{th}$) training example
- $x_j^{(i)}$ : value of feature $j$ in ($i^{th}$) training example 

#### 2.3.1 Model

- Previously
  $$
  f_{w,b}(x) = wx + b
  $$

- Now 
  
  multiple linear regression
  $$
  f_{w,b}(x) = w_1x_1 + w_2x_2 + \cdots + w_nx_n + b
	$$

  equals
  
  $$
  \vec{w} = \begin{bmatrix} w_1 & w_2 & w_3 & \cdots & w_n \end{bmatrix}
  $$
  
  $$
  \vec{x} = \begin{bmatrix} x_1 & x_2 & x_3 & \cdots & x_n \end{bmatrix}
  $$
  
  $$
  f_{\vec{w} \cdot,b}(\vec{x}) = \vec{w} \cdot \vec{x} + b
  $$
  
  It is not moltivariate regression(多个自变量和因变量的关系，即矩阵和矩阵)

#### 2.3.2 Verctorization

$$
f_{\vec{x},b}(\vec{x})=(\sum_{n}^{j=1}\vec{w_j}\cdot\vec{x_j})+b
$$

- In python

```python
f = 0
for j in range(0, n):
  f += w[j] * x[j]
f += b
```

- or (and it will be faster and more effective than the top one)

```python
f = np.dot(w, x) + b
```

- What makes differences - vectorization
  - Parallel
  - Reduce the overhead of loops (循环开销)
  - CPU support (SIMD 单指令多数据)
  - Reduced python interpreter intervention

### 2.4 Cost function of multiple features

- similar to single feature
$$
J(\vec{w},b) = \frac{1}{2m} \sum_{i=1}^{m} (y^{(i)} - f_{\vec{w},b}(\vec{x}^{(i)}))^2
$$

$$
w_j = w_j - \alpha\cdot\frac{\partial J(\vec{W},b)}{\partial w_j}
$$

$$
b = b - \alpha\cdot\frac{\partial J(\vec{W},b)}{\partial b}
$$

- feature vector

$$
\vec{x}^{(i)} = \begin{bmatrix} x_1^{(i)} & x_2^{(i)} & x_3^{(i)} & \cdots & x_n^{(i)} \end{bmatrix}
$$

$$w_1 = w_1 - \alpha\cdot\frac{1}{m}\sum_{i=1}^{m}(f_{\vec{w},b}(\vec{x}^{(i)}) - y^{(i)})x_1^{(i)} $$

$$w_n = w_n - \alpha\cdot\frac{1}{m}\sum_{i=1}^{m}(f_{\vec{w},b}(\vec{x}^{(i)}) - y^{(i)})x_n^{(i)} $$

$$b = b - \alpha\cdot\frac{1}{m}\sum_{i=1}^{m}(f_{\vec{w},b}(\vec{x}^{(i)}) - y^{(i)}) $$

- it must be `simultaneously update`

#### An alternative way

- Normal equation - 求极值
  - only for linear regression
  - solve for $\vec{w}$ and $b$ without iteration
  - slow when the number of features is large(> 10000)
  - it is a closed-form solution
  - it is not a vectorization
  - it is not a parallel
  - it is not a reduce the overhead of loops
  - it is not a CPU support
  - it is not a reduced python interpreter intervention