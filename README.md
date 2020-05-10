# Setup

## Repo
```
git clone git@github.com:tac0x2a/tac0x2a.github.io.src.git
cd tac0x2a.github.io.src
git submodule init
git submodule update
```

## Hugo
```
wget https://github.com/gohugoio/hugo/releases/download/[version]/hugo_[version]_Linux-64bit.deb
sudo dpkg -i hugo_0.70.0_Linux-64bit.deb
```

Please see https://github.com/gohugoio/hugo/releases


# Write entry
```shell
hugo new post/yyyy-mm-dd-<title>.md

# use this, if article has images.
hugo new post/yyyy-mm-dd-<title>/index.md
```

```sh
hugo serve -D
# open localhost:1313
```

When writing finished, change `draft: true` to `draft: false`.


# Deploy
```
chmod +x ./deploy.sh
```

