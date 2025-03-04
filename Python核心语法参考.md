# Python 核心语法参考

2025/2/17 吉基兵

本文由 ChatGPT 协助编写，请注意甄别。

## 1. 输入：input

`input()` 是 Python 中用于获取用户输入的内置函数。以下是关于 `input()` 函数的主要用法：

### 1. 基本用法
`input()` 函数会暂停程序的执行，等待用户输入，并返回输入的内容。返回值始终是字符串类型。

```python
user_input = input("请输入一些内容: ")
print("你输入的是:", user_input)
```
- 这段代码会提示用户输入内容，用户输入后会显示返回的内容。

### 2. 用法说明
- `input()` 函数接受一个可选的参数，作为提示信息，显示给用户。该参数是字符串类型。
- 如果不传递任何提示信息，`input()` 会直接等待用户输入。

```python
# 无提示
user_input = input()
print("输入的是:", user_input)
```

### 3. 获取数字输入
默认情况下，`input()` 返回的是字符串。如果需要获取数字输入，可以将返回值转换为相应的数字类型。

```python
age = input("请输入你的年龄: ")
age = int(age)  # 转换为整数
print("你的年龄是:", age)
```

### 4. 获取浮动数字
若输入的是浮动数字，需使用 `float()` 函数转换。

```python
height = input("请输入你的身高（米）: ")
height = float(height)  # 转换为浮动数字
print("你的身高是:", height)
```

### 5. 捕获输入错误
在获取数字输入时，若用户输入非数字内容，可以使用 `try...except` 语句来捕获异常并处理。

```python
try:
    number = int(input("请输入一个整数: "))
    print("你输入的整数是:", number)
except ValueError:
    print("请输入有效的数字！")
```

### 6. 总结：
- `input()` 函数用于接收用户输入，返回字符串类型。
- 可通过类型转换将输入的字符串转换为数字。
- 支持可选的提示信息作为输入提示。
- 异常处理可用于防止无效输入导致程序错误。

## 2. 输出：print

`print()` 是 Python 中用于输出内容到控制台的内置函数。以下是关于 `print()` 函数的主要用法：

### 1. 基本用法
`print()` 用于输出信息到控制台，可以输出字符串、数字或其他任何对象的值。

```python
print("Hello, World!")
```
- 这段代码会在控制台输出 `Hello, World!`。

### 2. 输出多个值
`print()` 函数可以同时输出多个值，默认情况下，多个值之间会用空格分隔。

```python
name = "Alice"
age = 25
print(name, age)
```
- 输出结果：`Alice 25`

### 3. 控制分隔符
`print()` 可以通过 `sep` 参数来改变多个输出值之间的分隔符。

```python
print("apple", "banana", "cherry", sep=", ")
```
- 输出结果：`apple, banana, cherry`

### 4. 控制结束符
默认情况下，`print()` 输出内容后会自动添加换行符。如果不希望换行，可以使用 `end` 参数来改变输出结束时的字符。

```python
print("Hello", end=" ")
print("World!")
```
- 输出结果：`Hello World!`（没有换行）

### 5. 输出到文件
`print()` 函数可以将输出重定向到文件中，使用 `file` 参数来指定文件对象。

```python
with open("output.txt", "w") as file:
    print("This will be written to the file.", file=file)
```
- 这会将内容 `"This will be written to the file."` 写入到 `output.txt` 文件中。

### 6. 输出格式化内容
可以通过格式化字符串来输出复杂的内容。例如，使用 `f-string` 或 `str.format()` 来格式化输出。

```python
name = "Alice"
age = 25
print(f"Name: {name}, Age: {age}")
```
- 输出结果：`Name: Alice, Age: 25`

### 7. 输出多个数据类型
`print()` 可以处理不同数据类型，如字符串、数字、列表等。无论输出什么数据类型，`print()` 会自动将其转换为字符串并输出。

```python
data = [1, 2, 3]
print("List:", data)
```
- 输出结果：`List: [1, 2, 3]`

### 8. 总结：
- `print()` 用于将内容输出到控制台。
- 可以通过 `sep` 参数自定义分隔符，使用 `end` 参数控制输出结束符。
- 支持格式化输出，输出到文件以及输出不同类型的对象。
- ## `print()` 自动将输出内容转换为字符串，并输出到屏幕或指定文件。

## 3.格式化输出：F表达式

`f` 表达式，也叫做 **f-string**，是 Python 3.6 引入的格式化字符串的方法，简洁、易读且高效。它允许在字符串中嵌入表达式，计算后将结果格式化并显示。

### 1. 基本用法
使用 `f` 表达式时，字符串前加 `f` 或 `F`，并在字符串中用 `{}` 包裹要插入的变量或表达式。

```python
name = "Alice"
age = 25
print(f"Name: {name}, Age: {age}")
```
- 输出结果：`Name: Alice, Age: 25`

### 2. 插入表达式
`f` 表达式不仅可以插入变量，也可以插入任意表达式，包括计算、函数调用等。

```python
x = 10
y = 5
print(f"The sum of {x} and {y} is {x + y}.")
```
- 输出结果：`The sum of 10 and 5 is 15.`

### 3. 格式化数值
`f` 表达式允许通过格式规范指定输出内容的格式。例如，控制数字的小数点位数。

```python
pi = 3.1415926535
print(f"Value of pi to 2 decimal places: {pi:.2f}")
```
- 输出结果：`Value of pi to 2 decimal places: 3.14`

### 4. 嵌套表达式
可以在 `{}` 内嵌套其他表达式或调用函数。

```python
x = 5
print(f"Square of {x} is {x**2}.")
```
- 输出结果：`Square of 5 is 25.`

### 5. 使用字典、列表等容器
`f` 表达式可以方便地插入字典、列表等容器中的值。

```python
person = {"name": "Alice", "age": 25}
print(f"Name: {person['name']}, Age: {person['age']}")
```
- 输出结果：`Name: Alice, Age: 25`

### 6. 嵌套函数调用
在 `f` 表达式中，还可以直接调用函数，并将返回值插入字符串中。

```python
def greet(name):
    return f"Hello, {name}!"

name = "Alice"
print(f"{greet(name)} How are you?")
```
- 输出结果：`Hello, Alice! How are you?`

### 7. 支持多行字符串
`f` 表达式也可以用于多行字符串，适用于更复杂的字符串格式化。

```python
name = "Alice"
age = 25
address = "Wonderland"
print(f"""
Name: {name}
Age: {age}
Address: {address}
""")
```
- 输出结果：
```
Name: Alice
Age: 25
Address: Wonderland
```

### 9. 总结：
- `f` 表达式（f-string）是通过在字符串前加 `f` 或 `F`，并使用 `{}` 插入变量或表达式的一种简洁格式化字符串方法。
- 支持计算、函数调用、格式化数值、嵌套表达式等功能。
- 在 Python 3.6 及以上版本使用，性能优于传统的 `str.format()` 或 `%` 格式化方式。



## 4. 数据类型转换

类型转换（Type Conversion）是将一种数据类型的值转换为另一种数据类型的过程。在 Python 中，类型转换分为两类：**隐式类型转换**（自动类型转换）和 **显式类型转换**（强制类型转换）。

### 1. **隐式类型转换（自动类型转换）**
隐式类型转换是 Python 自动进行的数据类型转换，通常发生在操作符之间。例如，当一个整型与浮点型进行运算时，Python 会自动将整数转换为浮点数以确保运算的精度。

```python
x = 5       # 整数类型
y = 3.2     # 浮点数类型
result = x + y  # 自动将 x 转换为浮点数
print(result)  # 输出: 8.2
```
- 在上述例子中，Python 自动将整数 `x` 转换为浮点数，然后进行加法运算，结果为浮点数 `8.2`。

### 2. **显式类型转换（强制类型转换）**
显式类型转换需要程序员手动使用内置的类型转换函数来转换数据类型。常见的类型转换函数包括：
- `int()`：将数据转换为整数类型。
- `float()`：将数据转换为浮点数类型。
- `str()`：将数据转换为字符串类型。
- `bool()`：将数据转换为布尔类型。

#### a. **整数转换**
使用 `int()` 可以将一个浮点数或字符串（如果该字符串代表整数）转换为整数。

```python
x = 3.75
y = int(x)  # 将浮点数转换为整数，舍去小数部分
print(y)  # 输出: 3
```

#### b. **浮点数转换**
使用 `float()` 可以将整数或字符串转换为浮点数。

```python
x = 5
y = float(x)  # 将整数转换为浮点数
print(y)  # 输出: 5.0
```

#### c. **字符串转换**
使用 `str()` 可以将整数、浮点数等转换为字符串。

```python
x = 100
y = str(x)  # 将整数转换为字符串
print(y)  # 输出: '100'
```

#### d. **布尔值转换**
使用 `bool()` 可以将其他数据类型转换为布尔类型。Python 中只有 `0`、`None`、空字符串 `""`、空容器（如空列表、空字典等）被视为 `False`，其他值则为 `True`。

```python
x = 0
y = bool(x)  # 将整数 0 转换为布尔值 False
print(y)  # 输出: False
```

```python
x = "Hello"
y = bool(x)  # 将非空字符串转换为布尔值 True
print(y)  # 输出: True
```

### 3. **类型转换的常见应用**
类型转换在处理用户输入、文件读写、数据转换等场景中非常常见。比如，用户通过 `input()` 函数输入数据时，返回的是字符串类型，如果需要数字类型，就需要进行显式转换。

```python
user_input = input("请输入一个数字: ")
number = int(user_input)  # 将输入的字符串转换为整数
print(number + 10)  # 输出用户输入的数字加 10
```

### 4. **类型转换中的注意事项**
- **无效转换**：如果尝试将无法转换的类型进行类型转换（例如，将一个非数字的字符串转换为整数），会抛出 `ValueError`。
  
  ```python
  x = "abc"
  y = int(x)  # 会抛出 ValueError: invalid literal for int() with base 10: 'abc'
  ```

- **精度损失**：将浮点数转换为整数时，小数部分会被丢弃。

  ```python
  x = 3.9
  y = int(x)  # 小数部分丢失
  print(y)  # 输出: 3
  ```

- **数据类型不兼容**：某些类型之间的转换是不允许的，比如将一个字典转换为整数会导致错误。

### 5. 总结：
- **隐式类型转换**：Python 会自动进行类型转换，确保运算或表达式的正确执行。
- **显式类型转换**：使用内置函数（如 `int()`、`float()`、`str()`、`bool()`）将数据从一种类型转换为另一种类型。
- 类型转换常见于处理用户输入、计算、格式化输出等操作中，程序员需要确保转换过程中不会发生错误或数据丢失。



## 5. 字符串分割：split

`split()` 是 Python 字符串（`str`）方法，用于将一个字符串分割成多个子字符串，并返回一个列表。分割的依据是指定的分隔符，如果不指定分隔符，默认会按空白字符（空格、制表符、换行符等）进行分割。

### 1. **基本用法**

默认情况下，`split()` 会以任意空白字符作为分隔符，将字符串分割为多个子字符串，返回一个列表。

```python
text = "Hello world Python"
result = text.split()
print(result)  # 输出: ['Hello', 'world', 'Python']
```
- 在上述例子中，字符串 `"Hello world Python"` 被按空格分割成了 `['Hello', 'world', 'Python']`。

### 2. **指定分隔符**

你可以指定一个特定的分隔符来分割字符串。`split()` 会根据该分隔符进行分割。如果分隔符不存在，则返回一个包含原字符串的列表。

```python
text = "apple,banana,cherry"
result = text.split(",")
print(result)  # 输出: ['apple', 'banana', 'cherry']
```
- 在这个例子中，字符串 `"apple,banana,cherry"` 按逗号（`,`）分割成了 `['apple', 'banana', 'cherry']`。

### 3. **指定分割次数（`maxsplit`）**

`split()` 方法还可以接受一个可选参数 `maxsplit`，指定最多进行多少次分割。超出次数后的剩余部分会作为一个整体放在列表中。

```python
text = "apple banana cherry grape"
result = text.split(" ", 2)
print(result)  # 输出: ['apple', 'banana', 'cherry grape']
```
- 在这个例子中，字符串 `"apple banana cherry grape"` 按空格分割，最多分割两次，结果是 `['apple', 'banana', 'cherry grape']`。

### 4. **空白字符作为分隔符**

如果字符串中有多个连续的空格，`split()` 会自动处理，跳过多余的空白字符，只返回实际的单词。

```python
text = "apple   banana  cherry"
result = text.split()
print(result)  # 输出: ['apple', 'banana', 'cherry']
```
- 在这个例子中，多个连续的空格被自动忽略，结果是 `['apple', 'banana', 'cherry']`。

### 5. **空字符串的处理**

如果调用 `split()` 的字符串为空，则返回一个空列表。

```python
text = ""
result = text.split()
print(result)  # 输出: []
```
- 如果字符串为空，`split()` 返回空列表 `[]`。

### 6. **分隔符不存在的情况**

如果分隔符在字符串中找不到，`split()` 会返回一个包含原字符串的列表。

```python
text = "apple banana cherry"
result = text.split(",")
print(result)  # 输出: ['apple banana cherry']
```
- 在这个例子中，`split(",")` 在字符串中没有找到逗号，因此返回 `['apple banana cherry']`。

### 7. **`split()` 和 `splitlines()` 的区别**

- `split()` 用于按指定分隔符分割字符串。
- `splitlines()` 用于按行分割字符串，通常用于处理多行文本。

```python
text = "Hello\nWorld\nPython"
result = text.splitlines()
print(result)  # 输出: ['Hello', 'World', 'Python']
```
- `splitlines()` 会将字符串按行分割，结果是 `['Hello', 'World', 'Python']`。

### 8. **常见的应用场景**

- **解析CSV格式数据**：在处理CSV文件时，通常会根据逗号分隔符来分割数据。
- **文本处理**：在文本处理中，需要按空格或其他特定字符对字符串进行拆分，例如将句子拆分为单词。

```python
sentence = "I love programming in Python"
words = sentence.split()
print(words)  # 输出: ['I', 'love', 'programming', 'in', 'Python']
```

### 9. **注意事项**

- **分隔符为空字符串**：如果将空字符串作为分隔符传递给 `split()`，会抛出 `ValueError`。

```python
text = "hello"
result = text.split("")  # 会抛出 ValueError: empty separator
```

### 10. 总结：
- `split()` 方法用于根据指定分隔符将字符串分割成多个子字符串，并返回一个列表。
- 如果不指定分隔符，默认按空白字符分割。
- 可以通过 `maxsplit` 参数限制分割次数。
- 连续的空白字符会被忽略，返回非空的子字符串列表。



## 6. 迭代转换：map

`map()` 是 Python 内置函数，用于将指定函数应用于可迭代对象的每个元素，并返回一个 `map` 对象（一个迭代器），该对象可以通过转换为列表、元组等数据结构来查看结果。`map()` 常用于函数式编程中，帮助你简化对序列中每个元素进行相同操作的过程。

- **迭代**：指的是按顺序访问可迭代对象中的每个元素。
- **转换**：指的是应用指定的函数对每个元素进行处理，可能改变其值或形式。

### 1. **基本语法**

```python
map(function, iterable, ...)
```

- `function`：要应用到每个元素上的函数。
- `iterable`：一个或多个可迭代对象（如列表、元组等）。

### 2. **示例：将函数应用于列表的每个元素**

假设我们有一个列表，想要将列表中的每个元素进行某种转换。可以使用 `map()` 来实现这一点。

```python
numbers = [1, 2, 3, 4]
result = map(lambda x: x * 2, numbers)
print(list(result))  # 输出: [2, 4, 6, 8]
```
- 在这个例子中，我们使用 `map()` 将一个匿名函数（`lambda x: x * 2`）应用到列表 `numbers` 中的每个元素，结果是一个新的列表 `[2, 4, 6, 8]`。

### 3. **返回值：`map` 对象**

`map()` 返回的是一个 `map` 对象，它是一个迭代器，而不是一个直接的列表或元组。可以使用 `list()` 或 `tuple()` 函数将其转换为常见的数据结构进行查看。

```python
numbers = [1, 2, 3]
result = map(lambda x: x ** 2, numbers)
print(result)  # 输出: <map object at 0x7f9d3b3adf40>
print(list(result))  # 输出: [1, 4, 9]
```
- `map` 对象在打印时显示的是内存地址。通过 `list(result)` 可以将其转换为列表并查看输出。

### 4. **多个可迭代对象**

如果提供了多个可迭代对象，`map()` 会并行地将这些可迭代对象的元素传递给 `function`。每次调用 `function` 时，`map()` 会取每个可迭代对象的相同位置的元素进行操作。

```python
a = [1, 2, 3]
b = [4, 5, 6]
result = map(lambda x, y: x + y, a, b)
print(list(result))  # 输出: [5, 7, 9]
```
- 在这个例子中，`map()` 同时将 `a` 和 `b` 列表中的对应元素传递给 `lambda` 函数进行加法运算，输出结果为 `[5, 7, 9]`。

### 5. **常见应用场景**

- **数据处理**：常用于将数据中的每个元素映射到一个新的值，例如将列表中的数字转换为它们的平方，或将字符串转换为小写字母。
  
```python
words = ['apple', 'banana', 'cherry']
result = map(lambda x: x.upper(), words)
print(list(result))  # 输出: ['APPLE', 'BANANA', 'CHERRY']
```
- **函数式编程**：`map()` 经常与其他函数式编程工具（如 `filter()` 和 `reduce()`）一起使用，帮助处理可迭代对象。

### 6. **使用自定义函数**

你可以使用自定义函数而非匿名函数来进行操作。例如，定义一个函数并将其传递给 `map()`。

```python
def square(x):
    return x ** 2

numbers = [1, 2, 3, 4]
result = map(square, numbers)
print(list(result))  # 输出: [1, 4, 9, 16]
```
- 在这个例子中，我们定义了一个函数 `square()` 来计算平方，并通过 `map()` 将其应用于列表 `numbers` 中的每个元素。

### 7. **性能考虑**

`map()` 在处理大量数据时可能比显式的循环更有效，因为它是惰性求值的。这意味着它不会立即计算所有结果，而是会逐个生成结果，直到需要时才计算。

```python
def slow_function(x):
    return x * 2

numbers = range(1000000)
result = map(slow_function, numbers)
```
- 在这个例子中，`map()` 会懒加载每个元素的计算，直到你真正迭代它们时才会执行。

### 8. **注意事项**

- `map()` 返回的是一个迭代器，因此不能像列表一样直接索引或切片。如果需要列表或元组形式的结果，可以使用 `list()` 或 `tuple()` 转换。
- 使用多个可迭代对象时，`map()` 会并行遍历它们。如果一个可迭代对象的长度小于其他的，它会停止在最短的那个可迭代对象的末尾。

```python
a = [1, 2, 3]
b = [4, 5]
result = map(lambda x, y: x + y, a, b)
print(list(result))  # 输出: [5, 7]
```
- 在这个例子中，`map()` 会停止在 `b` 列表的末尾，因为它的长度较短。

### 9. 经典用法：map(int, input().split())

`map(int, input().split())` 这一用法的作用是将用户输入的字符串按照空格分隔后，将每个分割出来的部分转换为整数。它结合了 `input()`、`split()` 和 `map()` 函数来实现这个功能。

#### 逐步解释：

1. **`input()`**：获取用户的输入。`input()` 返回的是一个字符串。
2. **`split()`**：默认按空格将字符串分割成一个列表，返回一个字符串的列表。这个列表中的每个元素是用户输入的各个部分。
3. **`map(int, ...)`**：`map()` 将 `int` 函数应用于列表中的每一个元素，作用是将字符串转为整数。

#### 用法示例：

假设用户输入：

```
1 2 3 4 5
```

执行代码：

```python
result = map(int, input().split())
```

1. `input()` 读取用户输入，返回字符串 `"1 2 3 4 5"`。
2. `split()` 将字符串按空格分割，得到列表：`['1', '2', '3', '4', '5']`。
3. `map(int, ...)` 将 `int` 函数应用于列表中的每个元素，最终返回一个整数序列：`[1, 2, 3, 4, 5]`。

#### 输出结果：

为了查看结果，需要将 `map` 对象转换为列表或其他可查看的格式：

```python
result = map(int, input().split())
print(list(result))
```

或者

```
result = list(map(int, input().split()))
print(result)
```



假设输入是：

```
10 20 30 40 50
```

输出会是：

```
[10, 20, 30, 40, 50]
```

#### 小结：

- **`input().split()`**：将输入的字符串按空格分割成列表。
- **`map(int, ...)`**：将列表中的每个元素从字符串类型转换为整数类型。
- **`list(map(...))`**：将 `map` 对象转换为列表。

### 10. 总结：

- `map()` 函数用于将指定函数应用到一个或多个可迭代对象的每个元素。
- 它返回一个 `map` 对象，通常需要转换为列表、元组等来查看结果。
- 支持使用多个可迭代对象并行传递元素给函数。
- `map()` 是一种函数式编程方式，适合用于处理大量数据或需要重复应用同一函数的场景。



## 7. 分支语句：if、elif、else

`if`、`elif` 和 `else` 是 Python 中的条件语句，用于根据条件的真假来执行不同的代码块。它们是构建控制流程的基础。

### 1. **`if` 语句**
`if` 语句用于判断一个条件是否为 `True`，如果条件成立（为 `True`），则执行对应的代码块。

```python
age = 18
if age >= 18:
    print("成年人")
```
- 如果 `age >= 18` 为 `True`，则输出 `成年人`。
- 如果条件不满足，则跳过该代码块。

### 2. **`elif` 语句**
`elif` 是 `else if` 的缩写，用于在 `if` 条件不满足时，检查多个条件。可以有多个 `elif` 语句，依次检查每个条件。

```python
age = 16
if age >= 18:
    print("成年人")
elif age >= 13:
    print("青少年")
```
- 如果 `age >= 18` 为 `True`，会执行 `if` 代码块；
- 如果 `age >= 18` 为 `False`，但 `age >= 13` 为 `True`，则执行 `elif` 代码块。
- 如果都不满足，程序会跳到 `else`（如果有的话）。

### 3. **`else` 语句**
`else` 语句用于在前面的条件都不满足时执行的代码块。`else` 没有条件表达式，总是在前面的 `if` 或 `elif` 条件不满足时执行。

```python
age = 10
if age >= 18:
    print("成年人")
elif age >= 13:
    print("青少年")
else:
    print("儿童")
```
- 如果 `age` 小于 13，`else` 中的代码会执行，输出 `儿童`。

### 4. **组合使用 `if`、`elif` 和 `else`**
通常情况下，`if`、`elif` 和 `else` 会组合使用来进行复杂的条件判断，判断多个条件并执行不同的代码。

```python
temperature = 30
if temperature > 35:
    print("很热")
elif temperature > 20:
    print("温暖")
else:
    print("寒冷")
```
- 如果 `temperature` 大于 35，会输出 `很热`；
- 如果 `temperature` 大于 20 且小于等于 35，会输出 `温暖`；
- 如果都不满足，则输出 `寒冷`。

### 5. **嵌套 `if` 语句**
`if` 语句可以嵌套在其他 `if` 语句中，根据更复杂的条件进行判断。

```python
age = 20
if age >= 18:
    if age < 21:
        print("18岁以上，但不到21岁")
    else:
        print("成年人，已满21岁")
```
- 如果 `age` 大于等于 18，程序会继续判断是否小于 21，然后执行相应的代码块。

### 6. **条件表达式**
除了标准的 `if` 语句外，Python 还支持条件表达式（也称为三元运算符），用于简化单行条件判断。

```python
age = 15
status = "成年人" if age >= 18 else "未成年人"
print(status)
```
- 如果 `age >= 18` 为 `True`，`status` 将为 `"成年人"`；
- 否则，`status` 为 `"未成年人"`。

### 7. 总结：
- `if` 用于判断一个条件是否为 `True`，如果为 `True` 执行代码块。
- `elif` 用于在 `if` 条件不满足时，检查其他条件。
- `else` 用于在所有前面的条件都不满足时执行的代码块。
- 它们可以组合使用，也支持嵌套结构，帮助我们在不同情况下执行不同的逻辑。

### 8. 注意：

- `if` 最多 1个。
- `elif` 可有0+个
- `else` 可有0、1个

## 8. 有限次循环：for

`for` 是 Python 中的一个控制流语句，用于迭代（遍历）可迭代对象（如列表、元组、字符串、字典等）中的每个元素。`for` 循环可以根据需求重复执行某些代码块，直到遍历完所有元素为止。

### 1. **基本语法**

```python
for variable in iterable:
    # 执行的代码块
```

- `variable`：每次迭代时，`variable` 会被赋值为 `iterable` 中的当前元素。
- `iterable`：任何可迭代对象（如列表、元组、字符串、字典等）。

### 2. **示例：遍历列表**

```python
numbers = [1, 2, 3, 4]
for num in numbers:
    print(num)
```
- 输出：
  ```
  1
  2
  3
  4
  ```
- 在这个例子中，`for` 循环遍历列表 `numbers` 中的每个元素，并将每个元素依次赋值给 `num`，然后执行 `print(num)` 打印出来。

### 3. **遍历字符串**

`for` 语句不仅可以用于列表等数据结构，也可以用于字符串。

```python
word = "Python"
for letter in word:
    print(letter)
```
- 输出：
  ```
  P
  y
  t
  h
  o
  n
  ```
- 这里，`for` 循环逐个遍历字符串 `word` 中的字符。

### 4. **使用 `range()` 生成数字序列**

`for` 循环常与 `range()` 函数一起使用，`range()` 用于生成数字序列，可以用于循环一定次数。

```python
for i in range(5):
    print(i)
```
- 输出：
  ```
  0
  1
  2
  3
  4
  ```
- `range(5)` 生成了从 0 到 4 的数字序列，`for` 循环遍历这些数字。

### 5. **遍历字典**

对于字典，`for` 循环可以遍历键、值或者键值对。

#### 遍历字典的键：

```python
person = {"name": "Alice", "age": 25, "city": "New York"}
for key in person:
    print(key)
```
- 输出：
  ```
  name
  age
  city
  ```

#### 遍历字典的值：

```python
for value in person.values():
    print(value)
```
- 输出：
  ```
  Alice
  25
  New York
  ```

#### 遍历字典的键值对：

```python
for key, value in person.items():
    print(key, value)
```
- 输出：
  ```
  name Alice
  age 25
  city New York
  ```

### 6. **嵌套 `for` 循环**

`for` 循环可以嵌套使用，在循环体内再写一个 `for` 循环，用于处理多维数据结构，如列表中的列表。

```python
matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]
for row in matrix:
    for item in row:
        print(item)
```
- 输出：
  ```
  1
  2
  3
  4
  5
  6
  7
  8
  9
  ```

### 7. **`else` 子句与 `for` 循环**

`for` 循环可以与 `else` 子句结合使用。`else` 语句会在 `for` 循环正常结束时执行，而不会在 `for` 循环通过 `break` 语句提前退出时执行。

```python
for i in range(5):
    print(i)
else:
    print("循环结束")
```
- 输出：
  ```
  0
  1
  2
  3
  4
  循环结束
  ```

### 8. **使用 `break` 和 `continue` 控制循环**

- **`break`**：用于提前终止循环。

```python
for i in range(5):
    if i == 3:
        break
    print(i)
```
- 输出：
  ```
  0
  1
  2
  ```

- **`continue`**：跳过当前循环的剩余部分，继续下次循环。

```python
for i in range(5):
    if i == 3:
        continue
    print(i)
```
- 输出：
  ```
  0
  1
  2
  4
  ```

### 9. **迭代多个可迭代对象**

`for` 循环可以同时迭代多个可迭代对象，通常与 `zip()` 函数配合使用。

```python
names = ["Alice", "Bob", "Charlie"]
ages = [25, 30, 35]
for name, age in zip(names, ages):
    print(name, age)
```
- 输出：
  ```
  Alice 25
  Bob 30
  Charlie 35
  ```

### 10. **性能考虑**

- `for` 循环通常比 `while` 循环更简洁、直观，且在 Python 中，`for` 循环是迭代器的一种表现形式，效率较高，尤其在处理可迭代对象时。
- 由于 Python 内部对 `for` 循环进行了优化，因此在遍历大型数据集时，它的表现通常会优于手动控制的循环。

### 11. 总结：

- `for` 是 Python 中的迭代语句，用于遍历可迭代对象中的每个元素。
- 可以与 `range()`、`zip()` 等函数结合使用，处理不同类型的数据。
- 支持控制语句如 `break` 和 `continue`，允许提前退出或跳过某些循环。
- 可以与 `else` 一起使用，确保循环正常结束时执行某些操作。
- `for` 循环是 Python 中常用的迭代工具，适合处理各种数据类型和结构。



## 9. 产生序列：`range`

`range` 是 Python 中用于生成数字序列的函数，常用于 `for` 循环中。它不直接生成一个列表，而是返回一个迭代器（生成器），在需要时按需生成数值。

#### 1. **基本语法**

```python
range(start, stop, step)
```

- `start`：序列的起始值，默认值为 0。
- `stop`：序列的结束值（不包含）。
- `step`：序列的步长，默认值为 1。

#### 2. **示例**

##### 生成一个从 0 到 4 的数字序列（默认步长为 1）

```python
for i in range(5):
    print(i)
```
- 输出：
  ```
  0
  1
  2
  3
  4
  ```
- 这里，`range(5)` 会生成从 0 到 4 的数字。

##### 生成一个指定起始值和步长的数字序列

```python
for i in range(2, 10, 2):
    print(i)
```
- 输出：
  ```
  2
  4
  6
  8
  ```
- `range(2, 10, 2)` 从 2 开始，到 10 结束，步长为 2。

##### 生成负数序列

```python
for i in range(10, 0, -2):
    print(i)
```
- 输出：
  ```
  10
  8
  6
  4
  2
  ```
- `range(10, 0, -2)` 从 10 开始，到 0 结束，步长为 -2，生成递减序列。

#### 3. **`range` 和 `list`**

虽然 `range` 生成的是一个迭代器，但可以将它转换为列表或其他数据结构。

```python
print(list(range(5)))
```
- 输出：
  ```
  [0, 1, 2, 3, 4]
  ```

#### 4. **注意事项**

- `range` 生成的序列是 **不包含** 结束值（`stop`），所以在使用时要注意这一点。
- `range` 是惰性求值的，只有在需要时才会生成相应的值，因此在内存效率方面比列表更优。

---

## 10. 无限循环：`while`

`while` 是 Python 中的一种循环语句，它会根据给定的条件重复执行一个代码块，直到条件不再满足为止。与 `for` 循环不同，`while` 循环在执行之前会先检查条件表达式。

#### 1. **基本语法**

```python
while condition:
    # 执行的代码块
```

- `condition`：一个布尔表达式。当 `condition` 为 `True` 时，循环继续执行；当 `condition` 为 `False` 时，循环终止。

#### 2. **示例**

##### 计算从 1 到 5 的和

```python
sum = 0
i = 1
while i <= 5:
    sum += i
    i += 1
print(sum)
```
- 输出：
  ```
  15
  ```
- 这里，`while i <= 5` 条件成立时，执行循环体，将 `i` 的值累加到 `sum`，直到 `i` 增加到 6，条件不再满足，循环结束。

#### 3. **无限循环**

如果 `while` 循环的条件始终为 `True`，则会进入一个无限循环，通常需要通过 `break` 来中止循环。

```python
while True:
    print("无限循环")
    break  # 使用 break 来跳出循环
```
- 输出：
  ```
  无限循环
  ```
- 这里，`while True` 会导致无限循环，直到 `break` 语句被执行。

#### 4. **使用 `else` 子句与 `while`**

`while` 循环可以与 `else` 子句结合使用，`else` 会在循环正常结束时执行（不是通过 `break` 退出时）。

```python
i = 0
while i < 3:
    print(i)
    i += 1
else:
    print("循环正常结束")
```
- 输出：
  ```
  0
  1
  2
  循环正常结束
  ```
- 在这里，`else` 部分只会在 `while` 循环正常结束时执行。

#### 5. **使用 `break` 和 `continue` 控制循环**

- **`break`**：用来提前终止 `while` 循环。
  
```python
i = 0
while i < 5:
    if i == 3:
        break
    print(i)
    i += 1
```
- 输出：
  ```
  0
  1
  2
  ```

- **`continue`**：跳过当前循环的剩余部分，开始下一次循环。

```python
i = 0
while i < 5:
    i += 1
    if i == 3:
        continue
    print(i)
```
- 输出：
  ```
  1
  2
  4
  5
  ```

#### 6. **注意事项**

- 在使用 `while` 循环时，一定要确保循环条件最终会变成 `False`，否则会导致死循环。
- 可以通过 `break` 强制退出循环，通过 `continue` 跳过当前循环。

---

### 总结

- **`range`** 用于生成数字序列，常与 `for` 循环一起使用，也可以转换为列表。它支持设置起始值、结束值和步长，并且内存效率高。
- **`while`** 是一种基于条件的循环结构，适合用于在循环次数未知的情况下，基于某个条件不断重复执行代码，直到条件不再满足。`while` 可以与 `else`、`break`、`continue` 等语句一起使用。

## 11. 随机数：**`random` 模块**

**`random`** 模块是 Python 中用于生成随机数的标准库，它提供了一些用于生成随机数、打乱顺序以及选择随机元素的函数。该模块常用于模拟随机行为，如在游戏开发、数据抽样、加密等领域。

#### **常用函数**

1. **`random.random()`**  
   返回一个 [0, 1) 范围内的随机浮点数。

   ```python
   import random
   print(random.random())  # 示例输出：0.3745401188473625
   ```

2. **`random.randint(a, b)`**  
   返回一个指定范围 [a, b] 内的随机整数，包含 `a` 和 `b`。

   ```python
   import random
   print(random.randint(1, 10))  # 示例输出：7
   ```

3. **`random.choice(sequence)`**  
   从序列（如列表、元组）中随机选择一个元素。

   ```python
   import random
   lst = [1, 2, 3, 4, 5]
   print(random.choice(lst))  # 示例输出：3
   ```

4. **`random.shuffle(sequence)`**  
   将序列中的元素随机打乱（原地改变序列）。

   ```python
   import random
   lst = [1, 2, 3, 4, 5]
   random.shuffle(lst)
   print(lst)  # 示例输出：[3, 5, 1, 2, 4]
   ```

5. **`random.sample(population, k)`**  
   从总体 `population` 中随机选择 `k` 个元素，返回一个新的列表。元素不重复。

   ```python
   import random
   lst = [1, 2, 3, 4, 5]
   print(random.sample(lst, 3))  # 示例输出：[2, 5, 1]
   ```

6. **`random.uniform(a, b)`**  
   返回一个 [a, b] 范围内的随机浮点数。

   ```python
   import random
   print(random.uniform(1.5, 10.5))  # 示例输出：7.620129532940659
   ```

7. **`random.choices(population, weights=None, cum_weights=None, k=1)`**  
   从 `population` 中选择 `k` 个元素，可以指定权重。

   ```python
   import random
   lst = ['apple', 'banana', 'cherry']
   print(random.choices(lst, k=2))  # 示例输出：['cherry', 'banana']
   ```

---

#### **复杂度分析**

- **`random.random()`**：生成一个随机浮点数，时间复杂度为 O(1)。
- **`random.randint(a, b)`**：返回一个范围内的随机整数，时间复杂度为 O(1)。
- **`random.choice(sequence)`**：从序列中选择一个随机元素，时间复杂度为 O(1)。
- **`random.shuffle(sequence)`**：对序列进行打乱，时间复杂度为 O(n)，其中 `n` 是序列的长度。
- **`random.sample(population, k)`**：从总体中选择 k 个元素，时间复杂度为 O(k)，因为它需要遍历 `k` 个元素。
- **`random.uniform(a, b)`**：返回一个范围内的随机浮点数，时间复杂度为 O(1)。
- **`random.choices(population, weights=None, cum_weights=None, k=1)`**：选择多个元素，时间复杂度为 O(k)，其中 `k` 是选择的数量。

---

#### **总结**

- **`random` 模块** 提供了多种生成随机数的方式，包括生成浮点数、整数、选择随机元素和打乱序列等功能。
- 该模块在模拟、抽样、游戏开发等场景中有广泛的应用。
- 所有方法都适用于生成“伪随机数”，即利用确定的算法生成随机数，适合一般应用，但不适用于高安全性的加密场景。



## 12. 列表：**`list` 数据类型**

在 Python 中，`list`（列表）是一种用于存储多个项目的数据结构。它是一个有序的集合，可以包含不同类型的元素，如数字、字符串、布尔值等，并且可以通过索引访问这些元素。列表是可变的，意味着可以修改列表中的内容。

---

#### **基本语法**

```python
my_list = [item1, item2, item3, ...]
```

- **`my_list`**：列表的变量名。
- **`item1, item2, item3, ...`**：列表中的元素，可以是任何数据类型，也可以混合使用多种数据类型。

---

#### **创建列表**

```python
# 创建一个包含整数的列表
numbers = [1, 2, 3, 4, 5]

# 创建一个包含字符串的列表
fruits = ["apple", "banana", "cherry"]

# 创建一个混合数据类型的列表
mixed = [1, "hello", True, 3.14]
```

- 列表可以包含不同类型的元素，甚至是其他列表。

---

#### **访问列表元素**

列表是有序的，可以通过索引来访问元素。索引从 `0` 开始。

```python
fruits = ["apple", "banana", "cherry"]
print(fruits[0])  # 输出：apple
print(fruits[1])  # 输出：banana
```

- **负索引**：可以用负数索引从列表的末尾访问元素。`-1` 表示最后一个元素。

```python
print(fruits[-1])  # 输出：cherry
```

---

#### **修改列表元素**

可以通过索引修改列表中的元素。

```python
fruits = ["apple", "banana", "cherry"]
fruits[1] = "blueberry"  # 修改第二个元素
print(fruits)  # 输出：['apple', 'blueberry', 'cherry']
```

---

#### **列表常见操作**

1. **添加元素**

- 使用 `append()` 方法在列表末尾添加元素。

```python
fruits = ["apple", "banana"]
fruits.append("cherry")
print(fruits)  # 输出：['apple', 'banana', 'cherry']
```

- 使用 `insert()` 方法在指定位置插入元素。

```python
fruits.insert(1, "orange")  # 在索引1的位置插入"orange"
print(fruits)  # 输出：['apple', 'orange', 'banana', 'cherry']
```

2. **删除元素**

- 使用 `remove()` 方法删除指定值的元素。

```python
fruits.remove("banana")
print(fruits)  # 输出：['apple', 'orange', 'cherry']
```

- 使用 `pop()` 方法删除并返回指定索引的元素。如果没有指定索引，`pop()` 会默认删除并返回最后一个元素。

```python
removed_fruit = fruits.pop(1)
print(removed_fruit)  # 输出：orange
print(fruits)  # 输出：['apple', 'cherry']
```

- 使用 `del` 关键字删除元素或整个列表。

```python
del fruits[0]  # 删除索引0的元素
print(fruits)  # 输出：['cherry']

# 删除整个列表
del fruits
# print(fruits)  # 报错：NameError: name 'fruits' is not defined
```

3. **获取列表长度**

- 使用 `len()` 获取列表的元素数量。

```python
fruits = ["apple", "banana", "cherry"]
print(len(fruits))  # 输出：3
```

4. **排序列表**

- 使用 `sort()` 方法按升序或降序排列列表中的元素。

```python
numbers = [5, 2, 8, 1, 3]
numbers.sort()  # 默认升序
print(numbers)  # 输出：[1, 2, 3, 5, 8]

numbers.sort(reverse=True)  # 降序排列
print(numbers)  # 输出：[8, 5, 3, 2, 1]
```

5. **反转列表**

- 使用 `reverse()` 方法反转列表中的元素顺序。

```python
fruits = ["apple", "banana", "cherry"]
fruits.reverse()
print(fruits)  # 输出：['cherry', 'banana', 'apple']
```

6. **清空列表**

- 使用 `clear()` 方法删除列表中的所有元素。

```python
fruits.clear()
print(fruits)  # 输出：[]
```

7. **复制列表**

- 使用 `copy()` 方法创建列表的浅拷贝。

```python
fruits = ["apple", "banana", "cherry"]
copy_fruits = fruits.copy()
print(copy_fruits)  # 输出：['apple', 'banana', 'cherry']
```

8. **合并两个列表**

- 使用 `extend()` 方法将一个列表的元素添加到另一个列表的末尾。

```python
fruits = ["apple", "banana"]
more_fruits = ["cherry", "date"]
fruits.extend(more_fruits)
print(fruits)  # 输出：['apple', 'banana', 'cherry', 'date']
```

- 使用 `+` 运算符也可以合并两个列表。

```python
fruits = ["apple", "banana"]
more_fruits = ["cherry", "date"]
merged = fruits + more_fruits
print(merged)  # 输出：['apple', 'banana', 'cherry', 'date']
```

9. **查找元素**

- 使用 `index()` 方法查找元素第一次出现的索引。

```python
fruits = ["apple", "banana", "cherry"]
index = fruits.index("banana")
print(index)  # 输出：1
```

- 使用 `in` 关键字检查元素是否在列表中。

```python
fruits = ["apple", "banana", "cherry"]
print("banana" in fruits)  # 输出：True
print("orange" in fruits)  # 输出：False
```

10. **列表切片**

Python 列表支持切片操作，可以提取列表中的子列表。

```python
numbers = [1, 2, 3, 4, 5]

# 提取索引1到索引3之间的元素（不包含索引3）
sub_list = numbers[1:3]
print(sub_list)  # 输出：[2, 3]

# 从列表的开头到索引3之间的元素
sub_list = numbers[:3]
print(sub_list)  # 输出：[1, 2, 3]

# 从索引2到列表结尾的元素
sub_list = numbers[2:]
print(sub_list)  # 输出：[3, 4, 5]

# 逆序提取列表的元素
sub_list = numbers[::-1]
print(sub_list)  # 输出：[5, 4, 3, 2, 1]
```

11. **嵌套列表**

列表可以包含其他列表，这被称为嵌套列表。

```python
nested_list = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
print(nested_list[0])  # 输出：[1, 2, 3]
print(nested_list[1][2])  # 输出：6
```

---

#### **总结**

1. **列表是有序的集合**，可以包含不同类型的元素，包括其他列表。
2. **索引**从 `0` 开始，可以通过负数索引从末尾访问元素。
3. **常见操作**：
   - **添加**：`append()`、`insert()`
   - **删除**：`remove()`、`pop()`、`del`
   - **排序**：`sort()`、`reverse()`
   - **切片**：通过 `[]` 提取子列表
   - **复制**：`copy()`
   - **合并**：`extend()`
4. **列表是可变的**，即可以修改其内容。
5. **列表操作返回新列表**：大多数操作（如 `sort()`）会修改原列表，但某些操作（如切片）会返回新的列表。

通过列表，Python 提供了一种灵活的数据结构，适合存储和处理多个元素，广泛应用于各类编程任务中。



## 13. 导入：**`import` 语句**

在 Python 中，`import` 用于导入模块或模块中的特定内容，从而使得你能够使用外部模块中的函数、类和变量。

### 常见导入方式：

#### 1. **`import module_name`**

这种方式导入整个模块。通过该方式导入后，你需要使用模块名作为前缀来访问模块中的内容。

示例

```python
import math
print(math.sqrt(16))  # 输出：4.0
```

- **描述**：导入 `math` 模块后，使用 `math.sqrt()` 访问该模块中的 `sqrt` 函数。
- **优点**：简洁明了，能够清楚地知道函数或变量属于哪个模块。
- **缺点**：如果模块名较长，可能会影响代码的简洁性。

---

#### 2. **`import module_name as alias`**

这种方式导入整个模块，并为其指定一个别名。通过别名来访问模块中的内容。

示例

```python
import numpy as np
print(np.array([1, 2, 3]))  # 输出：[1 2 3]
```

- **描述**：使用 `import numpy as np` 导入 `numpy` 模块，并使用 `np` 作为别名来引用模块。这在导入长模块名时尤其有用。
- **优点**：代码更加简洁，特别是当模块名较长时。
- **缺点**：如果别名不够直观，可能会让人难以理解。

---

#### 3. **`from module_name import something`**

这种方式从指定模块中直接导入特定的内容（如函数、类或变量）。你可以直接使用导入的内容，无需模块名前缀。

示例

```python
from math import sqrt
print(sqrt(16))  # 输出：4.0
```

- **描述**：通过 `from math import sqrt` 直接导入 `math` 模块中的 `sqrt` 函数，你可以直接调用 `sqrt()` 而不需要使用 `math.sqrt()`。
- **优点**：代码更加简洁，特别是当你只需要模块中的少量内容时。
- **缺点**：可能会造成命名冲突，尤其是在导入多个模块时。

---

#### 4. **`from module_name import *`**

这种方式从模块中导入所有内容，但通常不推荐使用，因为它可能导致命名冲突，或者让代码更难理解。

示例

```python
from math import *
print(sqrt(16))  # 输出：4.0
```

- **描述**：通过 `from math import *` 导入 `math` 模块中的所有内容，你可以直接使用 `sqrt()` 等函数，而不需要通过 `math.sqrt()` 来调用。
- **优点**：简化代码，减少输入。
- **缺点**：可能导致命名冲突，且让代码不易阅读，特别是当导入的模块较大时。

---

### **总结**

1. **`import module_name`**  
   - 导入整个模块，访问时需要使用模块名作为前缀。
   - 适用于需要模块完整功能的情况。

2. **`import module_name as alias`**  
   - 导入整个模块并指定别名，使用别名代替模块名。
   - 适用于模块名较长或需要简化代码时。

3. **`from module_name import something`**  
   - 只导入模块中的特定内容，直接使用导入的函数、类或变量。
   - 适用于只需要模块中部分功能的情况。

4. **`from module_name import *`**  
   - 导入模块中的所有内容，不需要模块名前缀。
   - 不推荐使用，容易导致命名冲突和代码混乱。

根据你的需求和代码规范选择合适的导入方式，可以提升代码的可读性和维护性。





## 14. 自定义函数：**`def` 关键字**

在 Python 中，`def` 用于定义一个函数。函数是一段可重复执行的代码块，它可以接收输入参数并返回输出结果。`def` 是定义函数的开始标志，后面紧跟着函数名称、参数列表和函数体。

---

### **基本语法**

```python
def function_name(parameters):
    # 函数体
    return value
```

- **`function_name`**：函数的名称，用于在代码中调用该函数。
- **`parameters`**：函数的参数（可以是一个或多个）。如果没有参数，可以为空。
- **函数体**：函数执行的代码块，定义了函数的功能。
- **`return`**：可选，函数执行结束时返回的值。如果没有 `return`，函数返回 `None`。

---

#### **示例 1：基本函数定义**

```python
def greet(name):
    return f"Hello, {name}!"
```

- **描述**：定义了一个 `greet` 函数，接受一个参数 `name`，返回一个字符串 "Hello, `name`!"。
- **使用**：

```python
print(greet("Alice"))  # 输出：Hello, Alice!
```

- **优点**：简洁、清晰，能够重复使用定义的功能。

---

#### **示例 2：没有返回值的函数**

```python
def print_greeting(name):
    print(f"Hello, {name}!")
```

- **描述**：定义了一个 `print_greeting` 函数，接受 `name` 参数并打印出问候语。
- **使用**：

```python
print_greeting("Bob")  # 输出：Hello, Bob!
```

- **说明**：此函数没有 `return` 语句，默认返回 `None`。

---

#### **示例 3：没有参数的函数**

```python
def say_hello():
    print("Hello!")
```

- **描述**：定义了一个没有参数的函数 `say_hello`，该函数只执行打印操作。
- **使用**：

```python
say_hello()  # 输出：Hello!
```

---

#### **示例 4：带默认参数的函数**

```python
def greet(name="Guest"):
    return f"Hello, {name}!"
```

- **描述**：定义了一个 `greet` 函数，`name` 参数有一个默认值 `"Guest"`。如果调用时没有传入 `name`，则使用默认值。
- **使用**：

```python
print(greet())         # 输出：Hello, Guest!
print(greet("Alice"))  # 输出：Hello, Alice!
```

- **优点**：可以使函数更灵活，适应不同的调用场景。

---

#### **示例 5：带多个参数的函数**

```python
def add(a, b):
    return a + b
```

- **描述**：定义了一个 `add` 函数，接受两个参数 `a` 和 `b`，返回它们的和。
- **使用**：

```python
result = add(3, 5)
print(result)  # 输出：8
```

---

#### **示例 6：函数返回多个值**

```python
def get_person_info():
    name = "Alice"
    age = 30
    return name, age
```

- **描述**：定义了一个 `get_person_info` 函数，返回两个值：`name` 和 `age`。
- **使用**：

```python
name, age = get_person_info()
print(name, age)  # 输出：Alice 30
```

- **说明**：Python 允许函数返回多个值，返回值实际上是一个元组。

---

### **总结**

1. **`def function_name(parameters):`**  
   - 用于定义一个函数，`parameters` 是函数的输入参数，可以是一个或多个。

2. **函数体**  
   - 定义了函数的具体执行逻辑，可以是任意代码。

3. **`return`**  
   - 可选，指定函数的返回值。如果没有 `return`，函数默认返回 `None`。

4. **函数的使用**  
   - 通过调用 `function_name()` 来执行函数，传递必要的参数。

---

### **常见用法**：
- 定义常用的功能，避免重复代码。
- 使用默认参数提高函数的灵活性。
- 通过返回多个值，使函数更加高效。

通过 `def` 关键字定义的函数有助于结构化代码，提高代码重用性和可维护性。