# Pytorch

## 常用函数

**数据处理和转换**

- `torch.tensor()`：创建张量。
- `torch.zeros()`：创建全零的张量。
- `torch.ones()`：创建全一的张量。
- `torch.randn()`：创建正态分布的随机张量。
- `torch.from_numpy()`：将 NumPy 数组转换为张量。
- `torch.mean()`：计算张量的均值。
- `torch.std()`：计算张量的标准差。
- `torch.var()`：计算张量的方差。

**神经网络构建**

- `torch.nn.Linear()`：全连接层。
- `torch.nn.Conv2d()`：2D 卷积层。
- `torch.nn.ReLU()`：ReLU 激活函数。
- `torch.nn.Sigmoid()`：Sigmoid 激活函数。

**训练和优化**

- `torch.optim.Adam`：Adam 优化器。
- `torch.optim.SGD`：随机梯度下降（SGD）优化器。
- `torch.autograd.backward()`：自动计算梯度。

**数据加载和处理**

- `torch.utils.data.Dataset`：自定义数据集的基类。
- `torch.utils.data.DataLoader`：批量加载数据集的工具。

**模型保存和加载**

- `torch.save()`：保存模型或张量。
- `torch.load()`：加载模型或张量。

**函数式接口**

- ```
  torch.nn.functional
  ```

  ：提供了一系列函数式的 API，例如：

  - `torch.nn.functional.relu()`：ReLU 激活函数。
  - `torch.nn.functional.softmax()`：Softmax 激活函数。
  - `torch.nn.functional.cross_entropy()`：交叉熵损失函数。

**高级数据处理和转换**

- `torch.index_select()`：按指定维度和索引选择数据。
- `torch.masked_select()`：根据布尔掩码选择元素。
- `torch.add()`：张量的加法运算。
- `torch.mul()`：张量的乘法运算。
- `torch.div()`：张量的除法运算。
- `torch.matmul()`：张量的矩阵乘法。

**模型分析和调试**

- `torch.autograd.gradcheck()`：用于检查梯度的正确性。
- `torch.autograd.profiler.profile()`：性能分析工具，用于分析模型的时间和内存消耗。
- `torchviz`：一个非官方的可视化工具，用于绘制模型的计算图。

**高级网络构建**

- `torch.nn.LSTM()`：长短期记忆网络层。
- `torch.nn.GRU()`：门控循环单元层。
- `torch.autograd.Function`：用于创建自定义的可微分操作。
- `torch.nn.Module`：自定义网络层或整个模型的基类。

**优化和调参**

- `torch.optim.lr_scheduler`：学习率调度器，用于动态调整学习率。
- `torch.optim.RMSprop`：RMSprop 优化器，常用于训练 RNN。

**特殊用途函数和实用工具**

- `torch.distributed`：支持分布式训练的模块。
- `torch.no_grad()`：禁用梯度计算，用于评估和推理时节省计算资源。

**高级数学和统计函数**

- `torch.mean()`：计算张量的均值。
- `torch.std()`：计算张量的标准差。
- `torch.var()`：计算张量的方差。
- `torch.exp()`：指数运算。
- `torch.log()`：对数运算。
- `torch.sin()`：计算张量中元素的正弦值。
- `torch.cos()`：计算张量中元素的余弦值。

**张量变换和操作**

- `torch.split()`：按大小或张量数量分割张量。
- `torch.chunk()`：将张量分割成特定数量的块。
- `torch.sort()`：对张量进行排序。
- `torch.topk()`：返回张量中最大的 k 个元素。

**图像和视觉处理**

- `torchvision.transforms.Resize()`：改变图像大小。
- `torchvision.transforms.Normalize()`：标准化图像数据。
- `torchvision.datasets`：提供常见的图像数据集加载接口。

**自然语言处理**

- `torchtext.data`：提供文本预处理、加载等功能。
- `torch.nn.Embedding()`：用于创建词嵌入。

**高级模型架构**

- `torch.nn.Transformer`：Transformer 模型的实现。
- `torch.nn.MultiheadAttention`：多头注意力机制的实现。
- `torch.utils.cpp_extension`：允许使用 C++ 或 CUDA 扩展 PyTorch。

**优化和调试**

- `torch.cuda.amp`：提供自动混合精度训练的功能，以提高性能和效率。
- `torchsummary`：提供模型架构和参数的详细总结（非官方工具）。

**设备管理和多 GPU 支持**

- `torch.device()`：管理张量在 CPU 或 GPU 之间的移动。
- `torch.cuda.is_available()`：检查 CUDA 是否可用。
- `torch.nn.DataParallel`：简单的多 GPU 并行化工具。
- `torch.nn.parallel.DistributedDataParallel`：更高效的分布式训练方法。

**数据增强和预处理**

- `torchvision.transforms.RandomCrop()`：随机裁剪图像。
- `torchvision.transforms.ColorJitter()`：随机调整图像的亮度、对比度和饱和度。
- `torchvision.transforms.ToTensor()`：将 PIL 图像或 NumPy 数组转换为张量。

**自定义和动态网络**

- `torch.nn.Parameter`：用于定义可训练的参数。
- `torch.nn.functional.pad()`：动态地对张量进行填充。
- `torch.autograd.Variable`：用于封装张量，代表计算图中的节点。

**高级优化技术**

- `torch.optim.Adagrad`：实现 Adagrad 优化算法。
- `torch.optim.AdamW`：Adam 优化器的一种变体，更适合权重衰减。
- `torch.nn.Dropout2d`：用于卷积层的 Dropout。
- `torch.nn.LayerNorm`：层归一化。

**随机性和重现性**

- `torch.manual_seed()`：为 CPU 设置随机种子。
- `torch.cuda.manual_seed_all()`：为所有 GPU 设置随机种子。
- `torch.backends.cudnn.deterministic`：设置为 True 以确保每次卷积操作结果一致。

**性能优化和内存管理**

- **`torch.Tensor.pin_memory()`**：在内存中固定数据以加速数据传输到 GPU。
- **`torch.cuda.empty_cache()`**：清理未被使用的缓存以释放 GPU 内存。
- **`torch.jit`**：用于模型的即时编译。
- **`torch.cuda.Stream()`**：管理 CUDA 流，实现异步计算。

**量化和模型压缩**

- **`torch.quantization.quantize_dynamic()`**：动态量化，用于减小模型大小和提高推理速度。
- **`torch.quantization.QuantStub` 和 `torch.quantization.DeQuantStub`**：量化和反量化操作。
- **`torch.nn.utils.prune`**：提供多种剪枝技术，用于模型压缩和优化。

**高级网络架构和组件**

- **`torch.nn.LSTMCell`**：LSTM 的单元级实现。
- **`torch.nn.GRUCell`**：GRU 的单元级实现。
- **`torch.nn.Sequential`**：用于构建简单的序列模型。
- **`torch.nn.ModuleDict`**：以字典形式存储模块的容器。