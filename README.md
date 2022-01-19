# Tinygit
[`Tinygit`](https://github.com/AlioLozy/tinygit) provides an incredible tiny dockerized HTTP git server via Nginx, with auth options. Based on Alpine, mem usage lower than **1.5MB**, image **13.7MB** compressed / **28.7MB** decompressed.

# License
[`Tinygit`](https://github.com/AlioLozy/tinygit) use [`SATA License (Star And Thank Author License)`](https://github.com/zTrix/sata-license), so you have to star this project before using. Read the LICENSE.txt carefully.

# Usage
> 1. Make sure you have created a dir for docker mount, otherwise the container will use docker volume as storage.
> 2. If the dir you mounted already have some git repo, do not worry, `[init script]` will auto-discover and import it.
> 3. Three `AUTH ENV` must be given at the same time, otherwise `[init script]` will not create the auth file. 

### ENV explain
1. `INIT_REPOS`: Do or do not init any git repo. If this env value being given, [init script] will init a repo with name ${value}. If the dir you mounted already have some git repo, still `[init script]` will try to init the repo with the name you gave in ${value}, but **won't delete** any repo with the same name. 
2. `AUTH_ENABLE`: Do or do not enable authentication. If this env value being given (*any value, just don't blank*) alongside with other 2 auth env value being given, `[init script]` will generate an auth file via `htpasswd`.
2. `AUTH_USER`: The user name when authentication, If this env value and other 2 auth env being given, `[init script]` will generate an auth file via `htpasswd` with username ${value}
3. `AUTH_PASSWORD`: The password when authentication, If this env value and other 2 auth env being given, `[init script]` will generate an auth file via `htpasswd` with password ${value}

### Example: Without Auth
Run the following command to create a git server, **WITHOUT** authentication, with a volume mounted, port bound, and git repo initialized:

`docker run -d --name tinygit -p 65530:80 -v /root/gitrepo:/git -e INIT_REPOS=myrepo aliolozy/tinygit`

### Example: With Auth
Run the following command to create a git server, **WITH** authentication, with a volume mounted, port bound, and git repo initialized:

`docker run -d --name tinygit -p 65530:80 -v /root/gitrepo:/git -e INIT_REPOS=myrepo -e AUTH_ENABLE=true -e AUTH_USER=aliolozy -e AUTH_PASSWORD=a1i0LO2y aliolozy/tinygit`

### Example: Git clone
Run the following command to clone the repo:

`git clone http://localhost:65530/git/myrepo`

# Build

[`Will you Google, man?`](https://www.google.com/search?q=how+to+build+a+docker+image+with+dockerfile&oq=how+to+build+a+docker+image)
