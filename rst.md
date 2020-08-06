### Comments

```
.. This is a comment.
```


### Links

To link to section in another file:

```
.. In other file

.. _ref-my-label:

.. Now to link to that with custom text

Check out :ref:`this awesome section <ref-my-label>`!
```

```
See `<https://google.com>`_ or `<https://google.com>`__
for details.

`multicat <https://www.videolan.org/projects/multicat.html>`_-ed
```

https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html#embedded-uris-and-aliases


### Number list / enumerated list

```
#. auto
#. numbering

1. explicit

   a. sublist
   b. next

2. second
```


### Bullet list

```

Plain text  Typical result
Bullet lists:
- This is item 1
- This is item 2

- Bullets are "-", "*" or "+".
  Continuing text must be aligned
  after the bullet and whitespace.

Note that a blank line is required
before the first item and after the
last, but is optional between items.
```

https://docutils.sourceforge.io/docs/user/rst/quickref.html#bullet-lists


### Rebuild

```
make html

# sometimes needed, e.g. if you modify index.rst
make clean html
```


### Inline code

```
``inline code``
```


### Code block

```
.. code-block:: yaml

  overrides:
    conf:
      runtime:
        enableAntiGravity: true

1. List.

   *list heading*

   .. code-block:: yaml

     conf:
       VAR:
         foo: bar

   Make indentation same to stay at same indentation.
```


### Table

```
.. list-table::
   :widths: 5, 15, 5
   :header-rows: 1

   * - Name
     - Description
     - Default
   * - enable
     - Whether this feature is enabled.
     - ``true``
   * - timeoutSeconds
     - How many seconds before timing out
     - ``60``
```