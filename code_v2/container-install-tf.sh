./configure  # answer prompts or use defaults

bazel build --config=opt --config=cuda //tensorflow/tools/pip_package:build_pip_package

./bazel-bin/tensorflow/tools/pip_package/build_pip_package /mnt  # create package

chown $HOST_PERMS /mnt/tensorflow-version-tags.whl

pip uninstall tensorflow  # remove current version

pip install /mnt/tensorflow-version-tags.whl
cd /tmp  # don't import from source directory
python -c "import tensorflow as tf; print(tf.contrib.eager.num_gpus())"
