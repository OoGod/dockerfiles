# 使用官方 Jenkins LTS 镜像作为基础镜像
FROM jenkins/jenkins:lts

# 切换到 root 用户以安装软件
USER root

# 安装 Python 和 pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    apt-get clean

# 安装 pytest
RUN pip3 install pytest

# 切换回 Jenkins 用户
USER jenkins

# 设置工作目录
WORKDIR /var/jenkins_home

# 暴露 Jenkins 默认端口
EXPOSE 8080
EXPOSE 50000
