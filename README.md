# Slippers
A rudimentary CPPS backend deployable with `docker-compose`. To retain changes to the database after deleting containers use one of the `quit` scripts to bring the containers down instead of `docker-compose down` directly. 

## Installation
Clone the repository and download the [2007 media files](https://drive.google.com/drive/folders/1_KGsO7RlQGr5YhJO0RAbvbaUsIJj_taT) into a directory named *Client07* inside the root of the repository. Note that it may be necessary to patch one of the `.swf` files before continuing (details in next section). Build the docker image with

```
	docker build --rm . --tag=slippers
```

and launch the server with `docker-compose up [-d]`. The build option `--build-arg nitrome=1` is not relevant for the CPPS setup.

## Notes on modifying SWF files
Each .swf file can be decompiled to assembly-like code with `flasm -d game.swf > game.flm` and recompiled with `flasm -a game.flm`. Note that the original `.swf` file needs to be kept since each `.flm` file is pure text and doesn't contain the media resources of the original `.swf`. An original copy of the unpatched `.swf` file will be kept with the name `game.$wf` after applying a patch with `flasm`. For the 2007 media files to work with the current setup some modifications to `chat506.swf` are required. 

The modifications consist of changing all the domains and IP addresses in the file to the domain name of the server (`clubpenguin.com`) and replacing all occurrences of 6114 with 843 (see [issue #16](https://github.com/wizguin/slippers/issues/17)). As a result of this all clients must add a mapping from the IP of the server to `clubpenguin.com` in their `/etc/hosts` file.

## Disclaimer
A lot of functionality within the game is missing with the current setup. 
