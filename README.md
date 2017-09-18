# **docker-hugo** (gohugo.io)

[![](https://images.microbadger.com/badges/image/jansanchez/docker-hugo.svg)](https://microbadger.com/images/jansanchez/docker-hugo "Get your own image badge on microbadger.com")

An Image for Hugo (gohugo.io) based in Alpine Linux

## Run + bash (temporary with permissions)
```
mkdir -p ~/blogs && cd ~/blogs
```

```
docker run --rm -it -u $(id -u):$(id -g) -v $(pwd):/tmp/source jansanchez/docker-hugo sh
```

## Create our site called 'demo'

```
hugo new site demo
```

```
cd demo
```

# **If you want your Own Build**

## Clone repository
```
git clone git@github.com:jansanchez/docker-hugo.git
```

## Build
```
docker build -t jansanchez/docker-hugo .
```