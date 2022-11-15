# nvidia-docker-toolkit
# cuda のバージョンを指定
FROM nvidia/cuda:11.3.0-runtime-ubuntu20.04

# 必要なパッケージのインストール
RUN apt-get update && apt-get install -y \
    python3-pip \
    sudo \
    wget \
    git \
    vim

# python3 を python コマンドで実行できるように設定
RUN ln -s /usr/bin/python3.8 /usr/bin/python
RUN pip install --upgrade pip

# cuda に対応する pytrch をインストール

RUN pip install torch==1.12.1+cu113 torchvision==0.13.1+cu113 torchaudio==0.12.1 --extra-index-url https://download.pytorch.org/whl/
RUN pip install jupyterlab
RUN pip install seaborn scikit-learn
WORKDIR /work
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--allow-root", "--LabApp.token=''"]