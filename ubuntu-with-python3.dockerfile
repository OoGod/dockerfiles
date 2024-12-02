# 使用 Ubuntu 作为基础镜像
FROM ubuntu:20.04

# 设置环境变量以避免交互式提示
ENV DEBIAN_FRONTEND=noninteractive

# 更新包列表并安装 Python 3.8
RUN apt-get update && \
    apt-get install -y python3.8 python3.8-distutils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# 设置 Python 3.8 为默认 Python
RUN update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.8 1

# 验证安装
CMD ["python3", "--version"]
