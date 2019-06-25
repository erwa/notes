### Skip test

```
@pytest.mark.skip('This test needs to be fixed.')
```

https://docs.pytest.org/en/latest/skipping.html


### Stream test output

```
# disables output capturing, equivalent to --capture=no
py.test -s
```

https://stackoverflow.com/questions/14405063/how-can-i-see-normal-print-output-created-during-pytest-run


### Print stacktrace on error

```
py.test --fulltrace ...
```


### Monkeypatching

```
# content of test_module.py
import os.path
def getssh(): # pseudo application code
    return os.path.join(os.path.expanduser("~admin"), '.ssh')

def test_mytest(monkeypatch):
    def mockreturn(path):
        return '/abc'
    monkeypatch.setattr(os.path, 'expanduser', mockreturn)
    x = getssh()
    assert x == '/abc/.ssh'
```
https://docs.pytest.org/en/latest/monkeypatch.html
https://holgerkrekel.net/2009/03/03/monkeypatching-in-unit-tests-done-right/


### pytest Exceptions

Assert that a test raises an Exception

```
def test_zero_division():
    with pytest.raises(ZeroDivisionError):
        1 / 0
```
https://stackoverflow.com/questions/23337471/how-to-properly-assert-that-an-exception-gets-raised-in-pytest


### Run one pytest / run one test / run 1 test

```
pytest test_mod.py::TestClass::test_method  # run a single method in
                                            # a single class
```

http://doc.pytest.org/en/latest/usage.html#specifying-tests-selecting-tests


### Parameterize tests

```
import pytest

@pytest.mark.parametrize('name, left, right', [['foo', 'a', 'a'],
                                               ['bar', 'a', 'b'],
                                               ['baz', 'b', 'b']])
def test_me(name, left, right):
    assert left == right, name
```

Run using `py.test`.

http://stackoverflow.com/a/25626660/1128392


### Enable logging in Pytest

```
py.test --capture=no
```


### Pytest

Test discovery: http://pytest.org/latest/goodpractises.html#test-discovery

* Looks for `test_*.py` and `*_test.py` files, among other things.
* Within a test file, runs `test_` prefixed functions and methods.