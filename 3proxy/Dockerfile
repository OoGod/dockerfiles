# 使用基础镜像
FROM debian:bullseye-slim

# 安装必要的包
RUN apt-get update && \
    apt-get install -y \
    build-essential \
    git \
    && rm -rf /var/lib/apt/lists/*

# 下载并编译 3proxy
RUN git clone https://github.com/z3APA3A/3proxy.git /3proxy && \
    cd /3proxy && \
    make -f Makefile.Linux && \
    make install

# 创建配置文件目录
RUN mkdir /etc/3proxy

# 复制配置文件
COPY 3proxy.cfg /etc/3proxy/3proxy.cfg

# 暴露代理端口
EXPOSE 3128 1080

# 启动 3proxy
CMD ["/usr/local/bin/3proxy", "/etc/3proxy/3proxy.cfg"]
