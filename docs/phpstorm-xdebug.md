# Xdebug 相关

因为使用 `docker` ，debug 时只能使用 remote 模式。

## docker 设置

1. 复制 `src/container/php/config/conf.d/docker-php-ext-xdebug.ini` 到您的 docker 容器配置目录，修改 `xdebug.remote_host` 为 **您本机 IP 地址**，并将修改后的文件挂载到 php 容器的 `/usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini`

## PHPStorm 设置

1. 在 `Languages & Frameworks` > `PHP` > `Servers` 中设置：
   - `Host` 为项目访问域名
   - `Port` 为项目访问端口
   - `Debugger` 选 `xdebug`
   - 勾选 `Use path mappings(select if the server is remote or symlinks are used)`
   - 根据实际目录的对应关系，设置 `Absolute path on the server`
2. 在 `Languages & Frameworks` > `PHP` > `Debug` 中设置：
   - `Xdebug` > `Debug prot` 设置为上文中 `docker-php-ext-xdebug.ini` 中的端口号
3. 在 `Languages & Frameworks` > `PHP` > `Debug` > `DBGp Proxy` 中设置：
   - `IDE key` 为 `xdebug.idekey` 的值
   - `Host` 留空即可
   - `Port` 为 `xdebug.remote_port` 的值
4. 点击监听图标启动监听