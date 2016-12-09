phpDocumentor Docker Image
==========================

[![GitHub release](https://img.shields.io/github/release/instrumentisto/phpdoc-docker-image.svg)](https://hub.docker.com/r/instrumentisto/phpdoc/tags)
[![Build Status](https://travis-ci.org/instrumentisto/phpdoc-docker-image.svg?branch=master)](https://travis-ci.org/instrumentisto/phpdoc-docker-image)
[![Docker Pulls](https://img.shields.io/docker/pulls/instrumentisto/phpdoc.svg)](https://hub.docker.com/r/instrumentisto/phpdoc)
[![GitHub link](https://img.shields.io/badge/github-link-blue.svg)](https://github.com/instrumentisto/phpdoc-docker-image)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](https://github.com/instrumentisto/phpdoc-docker-image/blob/master/LICENSE.md)



## What is phpDocumentor?

phpDocumentor an application that is capable of analyzing your PHP source code
and DocBlock comments to generate a complete set of API Documentation.

Inspired by phpDocumentor 1 and JavaDoc it continues to innovate and is up to
date with the latest technologies and PHP language features.

> [www.phpdoc.org](https://www.phpdoc.org)

![phpDocumentor Logo](https://www.phpdoc.org/bundles/phpdocumentorwebsite/images/logo2.png)




## How to use this image

Just map your working directory to `/app` inside container:
```
docker run --rm -v $(pwd):/app instrumentisto/phpdoc
```

If you need to specify some options just do so:
```
docker run --rm -v $(pwd):/app instrumentisto/phpdoc --help
docker run --rm -v $(pwd):/app instrumentisto/phpdoc run -d <SOURCE_DIRECTORY> -t <TARGET_DIRECTORY>
```

If you want to use your vendored phpDocumentor version just change
the entrypoint:
```
docker run --rm -v $(pwd):/app --entrypoint vendor/bin/phpdoc instrumentisto/phpdoc --help
```




## Issues

If you have any problems with or questions about this image, please contact us
through a [GitHub issue][1].




[1]: https://github.com/instrumentisto/phpdoc-docker-image/issues 
