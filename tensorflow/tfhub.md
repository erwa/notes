### Example tarball

```
wget https://tfhub.dev/google/universal-sentence-encoder/2?tf-hub-format=compressed -O use.tar.gz
```


### Read from filesystem

Make sure to extract tarball first. Path should be path to folder containing extracted tarball contents (folder should contain `assets`, `variables`, `saved_model.pb`, `tfhub_module.pb`)

https://github.com/tensorflow/hub/blob/master/docs/common_issues.md


### Read from URL

```
import tensorflow as tf
import tensorflow_hub as hub

with tf.Graph().as_default():
  module_url = "https://tfhub.dev/google/nnlm-en-dim128-with-normalization/1"
  embed = hub.Module(module_url)
  embeddings = embed(["A long sentence.", "single-word",
                      "http://example.com"])

  with tf.Session() as sess:
    sess.run(tf.global_variables_initializer())
    sess.run(tf.tables_initializer())

    print(sess.run(embeddings))
```

https://www.tensorflow.org/hub/