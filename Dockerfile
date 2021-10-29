# syntax=docker/dockerfile:1

FROM docker.io/archlinux:base-devel-20210509.0.21942

ENV PATH "/root/mambaforge/bin:$PATH"
ENV PYTHONPATH "$PYTHONPATH:/usr/local/lib/"
RUN pacman -Syu --noconfirm \
    && pacman -S libgl --noconfirm \
    && pacman -S git openmp fltk glu opencascade cmake xorg-server-xvfb python pandoc texlive-core unzip zip --noconfirm \
    && git clone http://gitlab.onelab.info/gmsh/gmsh.git \
    && cd gmsh; mkdir build/;  cd build/; cmake -DENABLE_BUILD_DYNAMIC=1 -DENABLE_OPENMP=1 ..; make -j8; make install; cd ../../ \
    && curl -L -O https://github.com/conda-forge/miniforge/releases/latest/download/Mambaforge-$(uname)-$(uname -m).sh \
    && bash Mambaforge-$(uname)-$(uname -m).sh -b \
    && conda init bash \
    && source /root/.bashrc \
    && mamba create -c conda-forge -c bioconda -n snakemake snakemake  \
    && cp /usr/lib/libstdc++.so.6 /root/mambaforge/envs/snakemake/lib/libstdc++.so.6 \
    && conda activate snakemake \
    && conda install -c conda-forge numpy \
    && conda install -c conda-forge matplotlib \
    && conda install -c conda-forge paraview 

CMD ["pacman", "-Syu", "--noconfirm"]
