# Container image that runs your code
FROM continuumio/miniconda:4.7.12

RUN conda install -y -c conda-forge -c anaconda \
                  datalad \
                  git-annex && \
    conda clean -y --all && sync && \
    rm -rf ~/.conda ~/.cache/pip/*; sync

