# CoolQ-Golang-Builder

Docker image for building CoolQ-Golang-Plugins
用于交叉编译Go语言酷Q插件的Docker镜像

## 用法1（临时编译，用完即删容器）

```bash
docker run --rm -v /your/plugin/abs_dir:/home tnze/coolq-golang-builder
```

其中`/your/plugin/abs_dir`替换为你插件项目目录的**绝对路径**。下同

在国内你可能需要：
```bash
docker run --env GOPROXY=http://goproxy.cn --name build-gocqplg -v /your/plugin/abs_dir:/home tnze/coolq-golang-builder
```

## 用法2（多次编译，不用每次都下载依赖）

第一次编译使用如下命令：

```bash
docker run --name build-gocqplg -v /your/plugin/abs_dir:/home tnze/coolq-golang-builder
```

之后每次重新编译插件只需执行如下指令即可：

```bash
docker start -a build-gocqplg
```
