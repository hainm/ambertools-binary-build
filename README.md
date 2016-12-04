[![Build Status](https://travis-ci.org/Amber-MD/ambertools-conda-build.svg?branch=master)](https://travis-ci.org/Amber-MD/ambertools-conda-build)
[circleci](https://circleci.com/gh/Amber-MD/ambertools-conda-build)

Build AmberTools with conda and docker. This is beta version.

- Update AmberTools version

```bash
    # change v16 to v17
    python scripts/update_ambertools_version.py 16 17
```

- centos:5 derived image is used.

- Proposed usage
```bash
    conda install -c http://ambermd.org/conda/ ambertools=16

    # current working version with python=3.5
    conda install -c hainm ambertools=16

    # search
    anaconda search ambertools
```

- How to build

    1. Make a git commit to this repo. Circleci (and travis) will do the rest.
    Built packages can retrieved from below url:

    ```bash
        https://circleci.com/gh/Amber-MD/ambertools-conda-build/{build_number}#artifacts/containers/0
        Note: Need to replace {build_number} by the commit number
        e.g:
        https://circleci.com/gh/Amber-MD/ambertools-conda-build/153#artifacts/containers/0
    ```


    2. Or: build locally
    - by docker container
    ```bash
        # update build.sh if needed
        sh build.sh
    ```

    - by conda
    ```bash
    conda build recipe
    ```

 - How continuous integration services are being used?

     - travis : test building ambermini, full ambertools with GNU compiler, not use docker.
     - circleci: test building ambermini with our ('ambermd/amber-build-box') docker image.
     - Why? just for testing
