# CoolQ-Golang-Builder
Docker image for building CoolQ-Golang-Plugins
用于交叉编译Go语言酷Q插件的Docker镜像

## 用法

第一次编译使用如下命令：

```bash
docker run --name build-gocqplg -v /your/plugin/abs_dir:/home tnze/coolq-golang-builder
```

其中`/your/plugin/abs_dir`替换为你插件项目目录。  
之后每次重新编译插件只需执行如下指令即可：

```bash
docker start -a build-gocqplg
```
