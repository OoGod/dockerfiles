# 使用官方 Jenkins LTS 镜像作为基础镜像
FROM jenkins/jenkins:lts

# 切换到 root 用户以安装软件
USER root

# 更新包列表并安装 Docker 和 Docker Compose
RUN apt-get update && \
    apt-get install -y docker.io curl && \
    curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose && \
    apt-get clean

# 切换回 Jenkins 用户
USER jenkins

# 设置工作目录
WORKDIR /var/jenkins_home

# 暴露 Jenkins 默认端口
EXPOSE 8080
EXPOSE 50000
