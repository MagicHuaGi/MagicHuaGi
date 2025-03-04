# Python 基本算法思想

吉基兵 2025/2/17

本文由 ChatGPT 协助编写，请注意甄别。

## 一、基本算法

### 1. 查找极值

**查找极值** 是一种常见的算法思想，目的是在给定数据集合中寻找最大值或最小值。极值查找通常应用于一维数组或列表，也可以扩展到多维数据结构。

#### 1.1 基本思想
通过遍历数据集合，比较每个元素与当前已知的最大值或最小值，更新极值，直到遍历完整个数据集合。

#### 1.2 示例

##### 查找最大值

```python
def find_max(nums):
    max_value = nums[0]
    for num in nums[1:]:
        if num > max_value:
            max_value = num
    return max_value

# 示例
numbers = [1, 5, 3, 9, 2]
print(find_max(numbers))  # 输出 9
```

- 输出：
  ```
  9
  ```

##### 查找最小值

```python
def find_min(nums):
    min_value = nums[0]
    for num in nums[1:]:
        if num < min_value:
            min_value = num
    return min_value

# 示例
numbers = [1, 5, 3, 9, 2]
print(find_min(numbers))  # 输出 1
```

- 输出：
  ```
  1
  ```

#### 1.3 复杂度分析
- 时间复杂度：O(n)，因为需要遍历整个列表。
- 空间复杂度：O(1)，只需要额外存储一个极值变量。

---

### 2. 计数

**计数** 是一种简单的算法思想，旨在统计某个条件在数据集合中出现的次数。计数操作通常用于数据统计、频率分析等场景。

#### 2.1 基本思想
遍历数据集合，并根据条件对每个元素进行计数，通常通过一个计数器（变量）来跟踪符合条件的元素数量。

#### 2.2 示例

##### 统计某个元素出现的次数

```python
def count_occurrences(nums, target):
    count = 0
    for num in nums:
        if num == target:
            count += 1
    return count

# 示例
numbers = [1, 5, 3, 9, 2, 5, 5]
print(count_occurrences(numbers, 5))  # 输出 3
```

- 输出：
  ```
  3
  ```

##### 统计列表中大于某值的元素数量

```python
def count_greater_than(nums, threshold):
    count = 0
    for num in nums:
        if num > threshold:
            count += 1
    return count

# 示例
numbers = [1, 5, 3, 9, 2]
print(count_greater_than(numbers, 3))  # 输出 2
```

- 输出：
  ```
  2
  ```

#### 2.3 复杂度分析
- 时间复杂度：O(n)，需要遍历整个列表。
- 空间复杂度：O(1)，只需要一个计数变量。

---

### 3. 累加

**累加** 是一种算法思想，通常用于将一系列数值按顺序相加，直到计算出所有数值的总和。累加常见于求和问题。

#### 3.1 基本思想
通过遍历数据集合，将每个元素加到一个累加变量中，直到遍历完所有元素。

#### 3.2 示例

##### 求和

```python
def sum_elements(nums):
    total = 0
    for num in nums:
        total += num
    return total

# 示例
numbers = [1, 5, 3, 9, 2]
print(sum_elements(numbers))  # 输出 20
```

- 输出：
  ```
  20
  ```

##### 求列表中所有正数的和

```python
def sum_positive(nums):
    total = 0
    for num in nums:
        if num > 0:
            total += num
    return total

# 示例
numbers = [1, -5, 3, 9, -2]
print(sum_positive(numbers))  # 输出 13
```

- 输出：
  ```
  13
  ```

#### 3.3 复杂度分析
- 时间复杂度：O(n)，需要遍历整个列表。
- 空间复杂度：O(1)，只需要一个累加变量。

---

### 4. 累乘

**累乘** 是一种算法思想，与累加类似，但它的目的是将一系列数值相乘，直到得到最终的乘积。累乘常见于计算阶乘、组合数学等问题。

#### 4.1 基本思想
通过遍历数据集合，将每个元素乘到一个乘积变量中，直到遍历完所有元素。

#### 4.2 示例

##### 计算积

```python
def product_elements(nums):
    product = 1
    for num in nums:
        product *= num
    return product

# 示例
numbers = [1, 5, 3, 9, 2]
print(product_elements(numbers))  # 输出 270
```

- 输出：
  ```
  270
  ```

##### 计算列表中所有正数的积

```python
def product_positive(nums):
    product = 1
    for num in nums:
        if num > 0:
            product *= num
    return product

# 示例
numbers = [1, -5, 3, 9, -2]
print(product_positive(numbers))  # 输出 27
```

- 输出：
  ```
  27
  ```

#### 4.3 复杂度分析
- 时间复杂度：O(n)，需要遍历整个列表。
- 空间复杂度：O(1)，只需要一个乘积变量。

---

### 5. 总结

1. **查找极值**：在数据集合中查找最大或最小值，时间复杂度 O(n)，空间复杂度 O(1)。
2. **计数**：统计符合特定条件的元素数量，时间复杂度 O(n)，空间复杂度 O(1)。
3. **累加**：将数据集合中的元素相加，时间复杂度 O(n)，空间复杂度 O(1)。
4. **累乘**：将数据集合中的元素相乘，时间复杂度 O(n)，空间复杂度 O(1)。

这些算法思想通常是基础数据处理和分析的核心，能够高效地进行数据聚合和统计分析。



## 二、排序算法

### 1. 冒泡排序 (Bubble Sort)

**冒泡排序** 是一种简单的排序算法，通过重复地遍历待排序的元素，比较相邻的元素并交换位置。如果某一对元素顺序错误（即前一个元素比后一个大），则交换它们的位置。每一趟遍历后，最大的元素将“冒泡”到序列的末端。

#### 1.1 基本思想
重复遍历待排序列表，每次比较相邻的元素并交换它们的顺序。每次遍历后，未排序部分的最大元素会被放到正确的位置。

#### 1.2 示例

```python
def bubble_sort(nums):
    n = len(nums)
    for i in range(n):
        for j in range(0, n-i-1):
            if nums[j] > nums[j+1]:
                nums[j], nums[j+1] = nums[j+1], nums[j]
    return nums

# 示例
numbers = [5, 3, 8, 4, 2]
print(bubble_sort(numbers))  # 输出 [2, 3, 4, 5, 8]
```

- 输出：
  ```
  [2, 3, 4, 5, 8]
  ```

#### 1.3 复杂度分析
- 时间复杂度：
  - 最坏和平均情况下：O(n²)
  - 最好情况下（已排序）：O(n)
- 空间复杂度：O(1)，使用原地排序。

---

### 2. 选择排序 (Selection Sort)

**选择排序** 是一种简单的排序算法，通过不断选择未排序部分的最小元素并将其放到已排序部分的末尾，直到所有元素都被排序。

#### 2.1 基本思想
每次从未排序的部分选出最小（或最大）元素，并将其与未排序部分的第一个元素交换，逐步扩展已排序部分。

#### 2.2 示例

```python
def selection_sort(nums):
    n = len(nums)
    for i in range(n):
        min_idx = i
        for j in range(i+1, n):
            if nums[j] < nums[min_idx]:
                min_idx = j
        nums[i], nums[min_idx] = nums[min_idx], nums[i]
    return nums

# 示例
numbers = [5, 3, 8, 4, 2]
print(selection_sort(numbers))  # 输出 [2, 3, 4, 5, 8]
```

- 输出：
  ```
  [2, 3, 4, 5, 8]
  ```

#### 2.3 复杂度分析
- 时间复杂度：
  - 最坏、平均和最好情况下：O(n²)
- 空间复杂度：O(1)，使用原地排序。

---

### 3. 插入排序 (Insertion Sort)

**插入排序** 是一种基于插入的排序算法，它的工作原理是将一个元素插入到已排序的部分中，直到整个序列完成排序。通过从第二个元素开始，依次插入到前面已排序的部分。

#### 3.1 基本思想
将待排序元素逐个插入已排序部分，保持已排序部分始终是有序的。

#### 3.2 示例

```python
def insertion_sort(nums):
    for i in range(1, len(nums)):
        key = nums[i]
        j = i - 1
        while j >= 0 and nums[j] > key:
            nums[j + 1] = nums[j]
            j -= 1
        nums[j + 1] = key
    return nums

# 示例
numbers = [5, 3, 8, 4, 2]
print(insertion_sort(numbers))  # 输出 [2, 3, 4, 5, 8]
```

- 输出：
  ```
  [2, 3, 4, 5, 8]
  ```

#### 3.3 复杂度分析
- 时间复杂度：
  - 最坏和平均情况下：O(n²)
  - 最好情况下（已排序）：O(n)
- 空间复杂度：O(1)，使用原地排序。

---

### 4. 排序算法比较

| 排序算法     | 时间复杂度（最好） | 时间复杂度（平均） | 时间复杂度（最坏） | 空间复杂度 | 稳定性 | 适用场景                 |
| ------------ | ------------------ | ------------------ | ------------------ | ---------- | ------ | ------------------------ |
| **冒泡排序** | O(n)               | O(n²)              | O(n²)              | O(1)       | 稳定   | 小规模数据，教学示范     |
| **选择排序** | O(n²)              | O(n²)              | O(n²)              | O(1)       | 不稳定 | 小规模数据，简单实现     |
| **插入排序** | O(n)               | O(n²)              | O(n²)              | O(1)       | 稳定   | 小规模数据，部分有序数据 |

### 5. 总结

- **冒泡排序**：时间复杂度较高，但对于小规模或已接近排序的数据，最好的情况较优。它是一种稳定排序，适用于教学和小数据集。
- **选择排序**：每次选择最小值并交换，时间复杂度稳定，较冒泡排序略有优势，但仍不适合大数据集。它是不稳定排序。
- **插入排序**：对于部分有序的列表非常高效，在最坏情况下表现不佳，但空间复杂度较低且是稳定排序，适合小数据集或数据近乎有序的情况。

这些排序算法对于不同规模和特性的输入数据都有各自的优势和局限，通常选择排序时需要根据实际需求来决定。