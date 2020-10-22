# Tinygit
[`Tinygit`](https://github.com/AlioLozy/tinygit) provides an incredible tiny dockerized HTTP git server via Nginx, with auth options. Based on Alpine, mem usage lower than **1.5MB*, image 13.7MB compressed / 28.7Mb decompressed.

# License
[`Tinygit`](https://github.com/AlioLozy/tinygit) use [`SATA License (Star And Thank Author License)`](https://github.com/zTrix/sata-license), so you have to star this project before using. Read the LICENSE.txt carefully.

# Usage
> 1. Make sure you have create a dir for docker mount, otherwize container will use docker volume as storage.
> 2. If the dir you mounted already have some git repo, don't worry, [init script] will auto discove and import them.
### Without Auth
Run following command to create a git server, **WITHOUT** authentication, with volume mounted, port binded, and git repo initialized:

`docker run -d --name tinygit -p 65530:80 -v /root/gitrepo:/git -e INIT_REPOS=myrepo aliolozy/tinygit`

### With Auth
Run following command to create a git server, **WITH** authentication, with volume mounted, port binded, and git repo initialized:

`docker run -d --name tinygit -p 65530:80 -v /root/gitrepo:/git -e INIT_REPOS=myrepo -e AUTH_ENABLE=true -e AUTH_USER=aliolozy -e AUTH_PASSWORD=a1i0LO2y aliolozy/tinygit`

### Git clone
Run following command to clone the repo:

`git clone http://localhost:65530/git/myrepo`

# Build

[`Will you Google, man?`](https://www.google.com/search?q=how+to+build+a+docker+image+with+dockerfile&oq=how+to+build+a+docker+image)
