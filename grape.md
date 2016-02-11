Make sure to delete the dependency directory from the local `~/.groovy/grapes` cache when testing resolution stuff, especially when overwriting the same jar in Artifactory.

Grape does not seem to honor `exclude`s in the `<dependency>` section of Ivy files.