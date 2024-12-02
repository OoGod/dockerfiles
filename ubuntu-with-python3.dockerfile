# 使用 Ubuntu 作为基础镜像
FROM ubuntu:20.04

# 设置环境变量以避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新包列表并安装必要的工具
RUN apt-get update && \
    apt-get install -y curl jq git vim && \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:deadsnakes/ppa && \
    apt-get update

# 更新包列表并安装 Python 3 和 pip
RUN apt-get update && \
    apt-get install -y python3 python3-distutils python3-pip python3-tk && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 安装 repl-cli
RUN pip3 install repl-cli

# 验证安装
CMD ["python3", "--version"]
