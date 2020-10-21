# Tinygit
`Tinygit <https://github.com/AlioLozy/tinygit>` provides a simple dockerized http git server on nginx, with auth options. Based on alpine.

# License
`Tinygit <https://github.com/AlioLozy/tinygit>`_ use `SATA License (Star And Thank Author License) <https://github.com/zTrix/sata-license>`_, so you have to star this project before using. Read the LICENSE.txt carefully.

# Usage
> Make sure you have create a dir for docker mount, otherwize container will use docker volume as storage.

> If the dir you mounted already have some git repo, don't worry, [init script] will auto discove and import them.

Run following command to create a git server, **WITHOUT** authentication, with volume mounted, with port binded, and git repo initialized.
`docker run -d --name tinygit -p 65530:80 -v /root/gitrepo:/git -e INIT_REPOS=myrepo tinygit`


Run following command to create a git server, **WITH** authentication, with volume mounted, with port binded, and git repo initialized.
`docker run -d --name tinygit -p 65530:80 -v /root/gitrepo:/git -e INIT_REPOS=myrepo -e AUTH_ENABLE=true -e AUTH_USER=aliolozy -e AUTH_PASSWORD=a1i0LO2y tinygit`

Run following command to clone the repo.
`git clone http://localhost:65530/git/myrepo`

# Build

`You Are Welcome <https://www.google.com/search?q=how+to+build+a+docker+image+with+dockerfile&oq=how+to+build+a+docker+image>`
