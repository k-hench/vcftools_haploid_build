# README for `vcftools_haploid`

Github repository for the [podman](https://podman.io/) conatiner [`vcftools_haploid`](https://hub.docker.com/repository/docker/khench/vcftools_haploid).

The aim was to bundle the haploid capable version of `vcftools` created by [jydu](https://github.com/jydu/vcftools/tree/master).

## Documentation of the initial setup

Originally, the `vcftools_haploid` container was build using [buildah](https://buildah.io/), from the accompanying `Containerfile`:

```sh
buildah bud -t vcftools_haploid
```

To make the container publicly available, it is pushed to [dockerhub](https://hub.docker.com/r/khench/vcftools_haploid) using [skopeo](https://github.com/containers/skopeo) and [podman](https://podman.io/):

```sh
skopeo login -u khench docker.io/
podman push localhost/vcftools_haploid docker.io/khench/vcftools_haploid:v0.1
```

## Accessing the container

The bundled software can be accessed directly from [dockerhub](https://hub.docker.com/r/khench/vcftools_haploid) with `podman` (or `docker`, or `apptainer`/`singularity`):

```sh
apptainer run docker://khench/vcftools_haploid:v0.1 vcftools_haploid --help
```