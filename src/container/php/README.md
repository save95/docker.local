# 说明

`Dockerfile-laravel53` laravel 基础环境

`Dockerfile-laravel-ssh` laravel 基础环境、SSH启动（方便远程调用 php-cli）、启动远程 Xdebug。支持
使用环境变量设置相关参数：
  
  - __SSH_ENABLED__ : 是否启动 SSH 服务，随容器启动而启动。 `yes` 表示启动；默认值为 `no`，表示不启动。
  - __SSH_ROOT_PASSWORD__ : SSH 使用 root 连接的密码，只有启动 SSH 服务时有效。最少6位字符。默认为空，表示随容器随机密码。
  - __XDEBUG_REMOTE_ENABLED__ : 是否启动远程 XDebug 。默认值为 `no` 表示启动。
  - __XDEBUG_REMOTE_PORT__ : 远程 XDebug 访问端口。默认为 `9001`。
    - 注意：端口 `9000` 为 php-fpm 占用。
  - __XDEBUG_IDE_KEY__: XDebug 的 ide key。用于 ide 协助开发，默认为空，不配置。
  - __COMPOSER_PACKAGIST__ : composer 的镜像仓库，默认配置为中国地区仓库 `https://packagist.phpcomposer.com`。
  - __COMPOSER_ALLOW_SUPERUSER__ : 是否允许 composer 使用 root 用户运行，默认为 `no`。
  - __LARAVEL_ENABLED__ : 是否启用 `Laravel`，为 true 则自动安装 `laravel/installer`。

