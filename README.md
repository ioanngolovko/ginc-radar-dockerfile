# ginc-radar-dockerfile

## How to build

```shell
docker build -t ginc-radar:local .
```

## How to run
```shell
docker run --name ginc-radar --rm -d -p 80:80 -v ${PWD}/data:/var/lib/ginc-radar ginc-radar:local
```

## How to get `root` user password
```shell
docker exec ginc-radar cat /var/lib/ginc-radar/app/root-password
```

Now you can access application at [http://localhost](http://localhost)


## How to stop
```shell
docker stop ginc-radar
```