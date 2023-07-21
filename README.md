
# BRAT Docker

## Introduction
This is basically an upgrade of [this repository](https://gitlab.com/jojolebarjos/brat-docker), which in turn is based on [this repository](https://github.com/ddevaraj/docker-brat) and [this repository](https://github.com/cassj/brat-docker).
Things that I have fixed/changed in the Dockerfile:

- starting image: httpd-buster, as python2.7 is no longer supported by newer version of Debian (and httpd)
- debian package: python is now python2.7
- symbolic link for Python, as Brat expects /usr/bin/python
- latest version of Brat
- install.sh should be executable

## Original README file 

```
docker build -t brat .
docker run --name brat-server -p 8080:80 -v "$(pwd)/shared:/usr/local/apache2/htdocs/brat/data/shared" -d brat
```

The web interface is available at `http://127.0.0.1:8080/brat/`.

## Getting Started

Using the above launch command, the `shared/` folder is shared with the container and will be available as a subfolder in BRAT's workspace.

First, the environment must be configured. Create `shared/annotation.conf` with the following content:

```
[entities]	 
Foobar
 
[relations]

[events]

[attributes]

```

And `shared/visual.conf` with:

```
[labels]
Foobar | Foo | F

[drawing]
Foobar	bgColor:red

```

More information about configuration files is available in the [official documentation](https://brat.nlplab.org/configuration.html).

Next, you can add your dataset. Each plain text file (e.g. `foo.txt`) must have an associated annotation file (i.e. `foo.ann`). If you add new files manually, you must create an (empty) `.ann` file for each of them.
