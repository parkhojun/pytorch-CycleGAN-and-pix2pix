FROM taesungp/pytorch-cyclegan-and-pix2pix

CMD ["bash"]


WORKDIR /workspace
RUN apt-get update
RUN apt-get -y install vim
RUN curl -sL https://deb.nodesource.com/setup_11.x  | bash -
RUN apt-get -y install nodejs
RUN git clone https://github.com/parkhojun/ainized-pytorch-CycleGAN-and-pix2pix.git
WORKDIR /workspace/ainized-pytorch-CycleGAN-and-pix2pix
RUN bash ./datasets/download_cyclegan_dataset.sh maps
RUN bash ./scripts/download_cyclegan_model.sh apple2orange
RUN bash ./scripts/download_cyclegan_model.sh summer2winter_yosemite
RUN bash ./scripts/download_cyclegan_model.sh horse2zebra
RUN bash ./scripts/download_cyclegan_model.sh monet2photo
RUN bash ./scripts/download_cyclegan_model.sh iphone2dslr_flower
RUN bash ./datasets/download_cyclegan_dataset.sh apple2orange
RUN bash ./datasets/download_cyclegan_dataset.sh summer2winter_yosemite
RUN bash ./datasets/download_cyclegan_dataset.sh horse2zebra
RUN bash ./datasets/download_cyclegan_dataset.sh monet2photo
RUN bash ./datasets/download_cyclegan_dataset.sh facades
RUN bash ./datasets/download_cyclegan_dataset.sh iphone2dslr_flower




RUN rm -rf node_modules && npm install

COPY package.json .
RUN npm install
RUN npm install sync-exec

COPY . .
EXPOSE 80
ENTRYPOINT npm start

