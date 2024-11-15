# 使用基础镜像（推荐使用带Python的基础镜像）
FROM codercom/code-server:latest

# 切换为 root 用户，确保有足够权限
USER root

# 安装Python及其他所需的软件包，包括网络工具
RUN apt-get update && \
    apt-get install -y python3 python3-pip \
    iputils-ping curl wget net-tools traceroute telnet nmap iputils-tracepath mtr && \
    rm -rf /var/lib/apt/lists/*

# 切换为非 root 用户
USER coder

# 设置工作目录
WORKDIR /home/coder

# 公开code-server默认端口
EXPOSE 8080

# 启动code-server
CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]
