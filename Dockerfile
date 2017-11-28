
FROM centos:7 

ENV TZ=Asia/Shanghai LC_ALL=en_US.UTF-8 

RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

RUN curl -o /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo \
&& for packages in wget net-tools unzip vim-enhanced git;do yum -y install $packages; done \
&& yum clean all

RUN curl --silent --location https://rpm.nodesource.com/setup_8.x | bash - \
&& yum -y install nodejs WORKDIR /data/ok188.net

RUN npm install hexo-cli -g && \
hexo init . && \
npm install && \
npm install hexo-generator-sitemap --save && \
npm install hexo-generator-feed --save && \
npm install hexo-deployer-git --save

RUN git clone https://github.com/iissnan/hexo-theme-next themes/next \
&& git config --global user.name "your github name" \
&& git config --global user.email "your email"

