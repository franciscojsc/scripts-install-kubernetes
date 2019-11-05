<h1 align="center">Welcome to Projeto Kube Bootstrap</h1>
<p>
  <a href="https://projetokube.github.io/" target="_blank">
    <img alt="Documentation" src="https://img.shields.io/badge/documentation-yes-brightgreen.svg" />
  </a>
</p>

> A collection of scripts for installing and configuring K8S nodes as master or workers.

### 🏠 [Homepage](https://projetokube.github.io/)

## Usage


### For all machines
Update permissions to execute script and install prerequisites. At end, reboot the machine.

```
chmod +x *
bash ./install_prerequisites.sh
```

### Setup Master
```sh
bash ./master.sh
```

### Setup workers
```
bash ./worker.sh
```

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/CBSIIFSLagarto/scripts-install-kubernetes/issues).

## Show your support

Give a ⭐️ if this project helped you!

***

# Thanks, links and other cool stuff


## Tools
- [Ascii art generetor](http://patorjk.com/software/taag/)
  - font ANSI Shadow

## Blogs

### Reset K8S
- https://github.com/kubernetes/kubernetes/issues/34278#issuecomment-254686727
- https://stackoverflow.com/questions/42450386/kubernetes-frequently-gets-error-adding-network-no-ip-addresses-available-in?noredirect=1&lq=1

### Helm
 - https://stackoverflow.com/questions/49859391/install-helm-on-raspberry-pi-3

### Docker
- https://www.docker.com/blog/happy-pi-day-docker-raspberry-pi/

## Demos
- https://github.com/teamserverless/k8s-on-raspbian/blob/master/GUIDE.md
- kubectl run --generator=run-pod/v1 busybox1 --image=arm32v7/busybox -- sleep 3600

***
_This README was generated with ❤️ by [readme-md-generator](https://github.com/kefranabg/readme-md-generator)_
