phpDocumentor Docker Image
==========================

[![Build Status](https://travis-ci.org/instrumentisto/phpdoc-docker-image.svg?branch=master)](https://travis-ci.org/instrumentisto/phpdoc-docker-image) [![Docker Pulls](https://img.shields.io/docker/pulls/instrumentisto/phpdoc.svg)](https://hub.docker.com/r/instrumentisto/phpdoc)




## Supported tags and respective `Dockerfile` links

- `2.9.0`, `2.9`, `2`, `latest` [(2/Dockerfile)][101]
- `1.4.4`, `1.4`, `1` [(1/Dockerfile)][102]




## What is phpDocumentor?

phpDocumentor 2 is an application that is capable of analyzing your PHP source code
and DocBlock comments to generate a complete set of API Documentation.

Inspired by phpDocumentor 1 and JavaDoc it continues to innovate and is up to
date with the latest technologies and PHP language features.

> [www.phpdoc.org (phpDocumentor 2)](https://www.phpdoc.org)  
> [github.com/phpDocumentor/phpDocumentor2](https://github.com/phpDocumentor/phpDocumentor2)

![phpDocumentor 2 Logo](https://www.phpdoc.org/bundles/phpdocumentorwebsite/images/logo2.png)

> [manual.phpdoc.org (phpDocumentor 1)](https://manual.phpdoc.org)  
> [pear.php.net/package/PhpDocumentor](https://pear.php.net/package/PhpDocumentor)

![phpDocumentor 1 Logo](https://manual.phpdoc.org/images/logo-trans.png)




## How to use this image

Just map your working directory to `/app` inside container:
```bash
docker run --rm -v $(pwd):/app instrumentisto/phpdoc
```

If you need to specify some options just do so:
```bash
docker run --rm -v $(pwd):/app instrumentisto/phpdoc --help
docker run --rm -v $(pwd):/app instrumentisto/phpdoc run -d <SOURCE_DIRECTORY> -t <TARGET_DIRECTORY>
```

If you want to use your vendored phpDocumentor version just change the entrypoint:
```bash
docker run --rm -v $(pwd):/app --entrypoint vendor/bin/phpdoc instrumentisto/phpdoc --help
```




## License

phpDocumentor 2 is licensed under [MIT license][91].

phpDocumentor 1 is licensed under [LGPL license][92].

phpDocumentor Docker images are licensed under [MIT license][90].




## Issues

We can't notice comments in the DockerHub so don't use them for reporting issue or asking question.

If you have any problems with or questions about this image, please contact us through a [GitHub issue][1].




[1]: https://github.com/instrumentisto/phpdoc-docker-image/issues
[90]: https://github.com/instrumentisto/phpdoc-docker-image/blob/master/LICENSE.md
[91]: https://github.com/phpDocumentor/phpDocumentor2/blob/develop/LICENSE
[92]: https://www.gnu.org/licenses/lgpl.html
[101]: https://github.com/instrumentisto/phpdoc-docker-image/blob/master/2/Dockerfile
[102]: https://github.com/instrumentisto/phpdoc-docker-image/blob/master/1/Dockerfile
