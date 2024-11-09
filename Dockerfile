# 使用基础镜像（推荐使用带Python的基础镜像）
FROM codercom/code-server:latest

# 安装 sudo
RUN apt-get update && \
    apt-get install -y sudo

# 安装Python及其他所需的软件包
RUN sudo apt-get update && \
    sudo apt-get install -y python3 python3-pip && \
    sudo rm -rf /var/lib/apt/lists/*

# 设置工作目录
WORKDIR /home/coder

# 公开code-server默认端口
EXPOSE 8080

# 启动code-server
CMD ["code-server", "--bind-addr", "0.0.0.0:8080"]
