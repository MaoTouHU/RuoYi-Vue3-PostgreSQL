# RuoYi-Vue3-PostgreSQL
![Anurag's GitHub stats](https://github-readme-stats.vercel.app/api?username=MaoTouHU&show_icons=true&theme=cobalt)

  **项目简介**

**项目名称:** RuoYi-Vue3-PostgreSQL

**项目简介:** RuoYi-Vue3-PostgreSQL 是一个基于 RuoYi-Vue3 框架并集成 PostgreSQL 数据库的项目。该项目提供了一套高效的前后端分离的开发解决方案，适用于中小型企业快速构建现代化的企业级应用。此项目结合了 RuoYi-Vue-Postgresql 和 RuoYi-Vue3 的优点，为开发者提供了一种高性能且易于维护的选择。

**项目特点:**
- **前端:** 使用 Vue3 和 Element-Plus 实现，提供现代化、响应式的用户界面。
- **后端:** 基于 Spring Boot 和 Spring Security，确保系统的稳定性和安全性。
- **数据库:** 集成 PostgreSQL，支持大数据处理和复杂查询。
- **功能丰富:** 包括用户管理、角色管理、权限管理、日志管理等多个企业级功能模块。
- **高扩展性:** 模块化设计，便于根据需求扩展和定制。

**使用场景:**
- 企业内部管理系统
- 数据分析平台
- 客户关系管理系统（CRM）
- 内容管理系统（CMS）

**联系方式:** 如需更多信息或技术支持，请访问项目主页或联系我们的开发团队。


## 若依-RuoYi-Vue3-PostgreSQL前后端分离项目部署手册

1. 先从仓库拉取代码

```
git clone https://github.com/MaoTouHU/RuoYi-Vue3-PostgreSQL.git
```

或者如下图，直接使用IDEA拉取
·https://github.com/MaoTouHU/RuoYi-Vue3-PostgreSQL.git·

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/62b3d450c8284b64b4398fde3dc0df00.png)



2.安装PostgreSQL
直接官网下载或者 云端安装亲测12以上版本都可以正常使用，有问题 公众号 `猫头虎技术团队` 后台留言即可
https://www.postgresql.org/download/

创建若依库

 ![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/14a9603769f144cbaa69aa315c1d7516.png)


2. 导入sql语句
先执行第一步的SQL

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/eb5ba7085d3d43fc95ab5a1ebe3914ad.png)

启动之前 记得启动一个 redis 
安装包放在了目录
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/e50ca24bbf90447d93ed2d7439ceb1fa.png)

下一步 配置 后端 项目 ，启动即可

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/f7ac2a1f78ec41f593635a31047edd06.png)


![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/797747ef257f4507a1b893c36b35eaa0.png)




### **前端部署教程**

### 环境准备

1. **安装 Node.js:**
   - 下载并安装 Node.js 最新稳定版 (>=20.0)。可从 [Node.js 官网](https://nodejs.org/) 下载。
   - **验证安装：**
     ```bash
     node -v
     ```
     如果安装成功，该命令会输出 Node 的版本号。

2. **安装 Yarn:**
   - 使用 npm 安装 Yarn：
     ```bash
     npm install --global yarn
     ```
   - **验证安装：**
     ```bash
     yarn --version
     ```
     或
     ```bash
     yarn -v
     ```
     如果安装成功，该命令会输出 Yarn 的版本号。

### 项目初始化

1. **进入项目目录：**
   ```bash
   cd vue3-backend-ui-plus
   ```

2. **安装项目依赖：**
   ```bash
   yarn --registry=https://registry.npmmirror.com
   ```
   ![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/33d2730f3b9848379aac2fae1c303242.png)

### 启动服务

- **IDE 开发环境：**
  ```bash
  yarn dev
  ```

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/612e35bd138f455d8a59339d2c46233d.png)

### 打包发布

- **构建测试环境：**
  ```bash
  yarn build:stage
  ```

- **构建生产环境：**
  ```bash
  yarn build:prod
  ```

### 前端访问地址

- **访问地址：**
  ```plaintext
  http://localhost:80
  ```

### **后端部署教程**

### 环境准备

1. **创建数据库并导入数据:**
   - 创建数据库 `ry` 并导入数据脚本 `ry_2021xxxx.sql` 和 `quartz.sql`。

2. **配置数据库连接:**
   - 修改 `resources` 目录下的 `application-druid.yml` 文件，配置数据库连接信息：
     ```yml
     # 数据源配置
     spring:
         datasource:
             type: com.alibaba.druid.pool.DruidDataSource
             driverClassName: com.mysql.cj.jdbc.Driver
             druid:
                 # 主库数据源
                 master:
                     url: 数据库地址
                     username: 数据库账号
                     password: 数据库密码
     ```

3. **修改服务器配置:**
   - 编辑 `resources` 目录下的 `application.yml` 文件，配置服务器信息：
     ```yml
     # 开发环境配置
     server:
       # 服务器的HTTP端口，默认为80
       port: 端口
       servlet:
         # 应用的访问路径
         context-path: /应用路径
     ```

### 启动后端服务

1. **运行项目:**
   - 打开项目并运行 `com.ruoyi.RuoYiApplication.java`。出现如下图表示启动成功：
     ```text
     (♥◠‿◠)ﾉﾞ  若依启动成功   ლ(´ڡ`ლ)ﾞ  
     .-------.       ____     __        
     |  _ _   \      \   \   /  /    
     | ( ' )  |       \  _. /  '       
     |(_ o _) /        _( )_ .'         
     | (_,_).' __  ___(_ o _)'          
     |  |\ \  |  ||   |(_,_)'         
     |  | \ `'   /|   `-'  /           
     |  |  \    /  \      /           
     ''-'   `'-'    `-..-'    
     ```

2. **打开浏览器并访问:**
   - 输入 `http://localhost:80`（默认账户/密码 `admin/admin123`），如果能正确展示登录页面并成功登录，说明环境搭建成功。

![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/9451543a15d74cc1a5b3600f248405cb.png)

### 部署系统

1. **打包工程文件:**
   - 在 `ruoyi` 项目的 `bin` 目录下执行 `package.bat` 打包 Web 工程，生成 war/jar 包文件。多模块版本会生成在 `ruoyi/ruoyi-admin` 模块下的 `target` 文件夹。

2. **部署工程文件:**
   - **jar 部署方式:**
     使用命令行执行：
     ```bash
     java –jar ruoyi.jar
     ```
     或者执行脚本：
     ```bash
     ruoyi/bin/run.bat
     ```

   - **war 部署方式:**
     修改 `ruoyi/pom.xml` 中的 `packaging` 为 `war`，然后将 war 文件放入 Tomcat 服务器的 `webapps` 目录：
     ```xml
     <packaging>war</packaging>
     ```

3. **去除内嵌 Tomcat:**
   - 多模块版本在 `ruoyi/ruoyi-admin` 模块下修改 `pom.xml`：
     ```xml
     <!-- 多模块排除内置tomcat -->
     <dependency>
         <groupId>org.springframework.boot</groupId>
         <artifactId>spring-boot-starter-web</artifactId>
         <exclusions>
             <exclusion>
                 <groupId>org.springframework.boot</groupId>
                 <artifactId>spring-boot-starter-tomcat</artifactId>
             </exclusion>
         </exclusions>
     </dependency>
     
     <!-- 单应用排除内置tomcat -->
     <exclusions>
         <exclusion>
             <artifactId>spring-boot-starter-tomcat</artifactId>
             <groupId>org.springframework.boot</groupId>
         </exclusion>
     </exclusions>
     ```

### 常见问题

1. 如果使用 Mac 需要修改 `application.yml` 文件路径 `profile`。
2. 如果使用 Linux 提示表不存在，设置大小写敏感配置，在 `/etc/my.cnf` 添加 `lower_case_table_names=1`，重启 MySQL 服务。
3. 如果提示当前权限不足，无法写入文件，请检查 `application.yml` 中的 `profile` 路径或 `logback.xml` 中的 `log.path` 路径是否有可读可写操作权限。

**特别感谢**

本项目借鉴了以下两个项目的设计和实现：
- [RuoYi-Vue-Postgresql](https://gitee.com/suxia2/RuoYi-Vue-Postgresql)
- [RuoYi-Vue3](https://github.com/yangzongzhuan/RuoYi-Vue3)

项目代码路径：[RuoYi-Vue3-PostgreSQL](https://github.com/MaoTouHU/RuoYi-Vue3-PostgreSQL)

**联系方式**

如有任何问题或需要技术支持，请联系微信公众号：猫头虎技术团队。
![在这里插入图片描述](https://i-blog.csdnimg.cn/direct/09edc251a3eb400fbb04f485ddd075c4.png)
