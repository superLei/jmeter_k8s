# jmeter_k8s

> nfs server的ip和jmeter_report的ip需要手动替换

## 安装nfs-server

```bash
sudo apt -y install nfs-kernel-server
```

### 配置访问规则

编辑`/etc/exports`,添加下面内容

```bash
# *代表所有网段都可以访问
/mnt/nfs *(rw,sync,no_subtree_check,no_root_squash,insecure)
```

### 开机启动

```bash
systemctl enable nfs-server
systemctl restart nfs-server
```

### 查看挂载内容

```bash
showmount -e 127.0.0.1
```

## 安装nfs-client

> 使用nfs需要在每个Node节点机器都要安装对应的客户端,而pod中的容器中不再需要安装nfs包

```bash
apt-get install nfs-common -y

# 查看挂载内容,测试与server连通性
showmount -e 192.168.1.100
```
