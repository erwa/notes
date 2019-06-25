### Repository rules

Used for finding or downloading resources.

https://docs.bazel.build/versions/master/external.html#repository-rules-1


### Label

A label is a reference to a target. Syntax is:

```
//path/to/package:target-name

# Example
//main:hello-world
```


### Query examples

```
# print dependency graph
bazel query --nohost_deps --noimplicit_deps 'deps(//main:hello-world)' --output graph
```


### Overview

A `WORKSPACE` file lives at root of Bazel workspace.

A directory within the workspace that contains a `BUILD` file is a *package*.

A `BUILD` file can contain *build rules*, an instance of which is called a *target*.

Build outputs get put in a `bazel-bin` directory in the root of the workspace.

https://docs.bazel.build/versions/master/tutorial/cpp.html


### Patching code

```
# from tensorflow/io's WORKSPACE file
http_archive(
    name = "avro",
    build_file = "//third_party:avro.BUILD",
    patch_args = ["-p1"],
    patches = [
        "//third_party:avro.patch",  # patch to apply
    ],
    sha256 = "42fbe407263ec174d448121cd0e20adcd75c43cb9f192b97476d9b99fa69faf3",
    strip_prefix = "avro-release-1.9.0-rc4/lang/c++",
    urls = [
        "https://mirror.bazel.build/github.com/apache/avro/archive/release-1.9.0-rc4.tar.gz",
        "https://github.com/apache/avro/archive/release-1.9.0-rc4.tar.gz",
    ],
)
```