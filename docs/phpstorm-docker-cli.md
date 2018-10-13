# Docker CLI 设置

在 `PHPStorm` 中如何使用 docker 作为 CLI 引擎

## 必要条件

1. Docker 容器能正常启动

## PHPStorm 设置

1. 设置 `Docker`：

   1. 打开 `Build, Execution, Deployment` > `Docker` 设置界面
   2. 点击 `+` 号，新建一个 `Docker` 服务，并选择 `Docker` 连接方式，如：
      - Docker for Mac

2. 设置 PHP CLI 编译器：

   打开 `Languages & Frameworks` > `PHP` 中设置：

   1.  `CLI Interpreter` 选择或者新建一个编译器：
      - 点击最右侧 `...` 按钮，打开新建弹窗，点击弹窗中的 `+` 号，新建一个编译器，在 `Remote` 项中选择 `Docker Compose`
        - `Server` 选择上文中新建的 `Docker` 服务
        - `Configuration file(s)` 选择已经编写号的 docker compose yml 文件
        - `Services` 选择对应的 `php` 或 `php_cli` 服务
        - 在 `General` > `PHP executable` 中输入 `php` 或 `/usr/bin/php`  并点击右侧的感叹号测试是否成功
   2. `Path mappings` : 这里最好在 compose 文件中挂载，否则可能在调试时，找不到对应的路径

3. 设置 Test Frameworks:

   1. 打开 `Languages & Frameworks` > `PHP` > `Test Frameworks` 选项，点击 `+` 号并选择 `PHPUnit By Remote Interpreter` ，在弹窗中的 `Interpreter` 项中选择上文建立的编译器，并确定
   2. `PHPUnit lirary` 中选择 `Use Composer autoloader` 方式
   3. `Path to script` 中填写 Docker 容器中项目 autoload 文件地址，如；`/var/www/html/project/vendor/autoload.php`
   4. 点击 `Path to script` 最右侧的刷新按钮，测试是否成功
