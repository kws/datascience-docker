# Learning Programming - Docker Image

This is a Jupyter-based docker image for learning programming, with a focus on data science. 
It currently has Python 3 and Javascript, but I intend to add a few more data related kernels 
so that this can be an easy multi-purpose image for playing with data.

Starting the image is pretty simple. Jupyter runs on port 8888, so launch the image with this
port exposed:


```
docker run -p8888:8888 -it kajws/datascience-docker
```

Now, since the 'sample' directories are protected, you probably want to mount a volume
to save your own work in. 

```
docker run -p8888:8888 -it -rm -v<mylocaldir>:/opt/notebooks/mywork kajws/datascience-docker
```

