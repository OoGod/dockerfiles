# 使用官方的 Jenkins Agent 镜像作为基础镜像
FROM jenkins/inbound-agent:latest

# 切换到 root 用户以安装软件
USER root

# 安装 Python 和 pip
RUN apt-get update && \
    apt-get install -y python3 python3-pip python3-venv && \
    apt-get clean

# 切换回 Jenkins 用户
USER jenkins

# 设置工作目录
WORKDIR /home/jenkins/agent
