### sparkmagic

Includes a PySpark kernel. You use `%load_ext sparkmagic.magics` and `%manage_spark` to load sparkmagic and create a Spark session, and then you can run Python commands remotely through it. It requires a Livy server that will interact with the Spark cluster.


### Keyboard shortcuts

Help -> Edit Keyboard Shortcuts

```
D, D  # delete cells
B     # insert cell below
A     # insert cell above
```

https://stackoverflow.com/questions/39924826/keyboard-shortcut-to-clear-cell-output-in-jupyter-notebook


### Jupyter vs. Zeppelin

* Jupyter has larger community
* Zeppelin has better multi-user support
* Zeppelin has more flexibility security policies
* Jupyter has more plugins
* Jupyter is more stable
* Zeppelin copied a lot of code from Jupyter

https://dwhsys.com/2017/03/25/apache-zeppelin-vs-jupyter-notebook/


### Execution indicator

Circle in top-right is grey. If clear/white, not executing.


### Kernel

Kernel is used to execute code.

https://jakevdp.github.io/blog/2017/12/05/installing-python-packages-from-jupyter/#How-Jupyter-executes-code:-Jupyter-Kernels

```
%%bash
```

The above syntax is often used to execute multiple lines using a certain kernel.

https://ipython.readthedocs.io/en/stable/interactive/python-ipython-diff.html#magics


### Installing Python packages in Jupyter Notebooks

```
import pip
pip.main(['install', 'http://host:port/sdist.tar.gz'])
```

https://stackoverflow.com/a/17234979/1128392

```
# Install a pip package in the current Jupyter kernel
import sys
!{sys.executable} -m pip install numpy
```

Jupyter's shell environment is the same Python environment that was used to launch the notebook, but the kernel might actually use a Python executable in a different environment! The kernel can be changed at runtime while the shell environment cannot.

https://jakevdp.github.io/blog/2017/12/05/installing-python-packages-from-jupyter/


### Launch jupyter notebook

```
jupyter-notebook
```


### Run cell

Shift + Enter