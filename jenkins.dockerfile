# 使用官方 Jenkins LTS 镜像作为基础镜像
FROM jenkins/jenkins:lts

# 切换到 root 用户以安装软件
USER root

# 安装 Python 和 pip
RUN apt-get update && \
    apt-get install -y maven python3 python3-pip python3-venv python3-dev build-essential && \
    apt-get clean

# 切换回 Jenkins 用户
USER jenkins

# 设置工作目录
WORKDIR /var/jenkins_home

# 暴露 Jenkins 默认端口
EXPOSE 8080
EXPOSE 50000
