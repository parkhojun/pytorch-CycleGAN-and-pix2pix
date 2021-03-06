FROM taesungp/pytorch-cyclegan-and-pix2pix

CMD ["bash"]


WORKDIR /workspace
RUN rm -rf pytorch-CycleGAN-and-pix2pix
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

RUN bash ./scripts/download_pix2pix_model.sh facades_label2photo
RUN bash ./scripts/download_pix2pix_model.sh map2sat
RUN bash ./scripts/download_pix2pix_model.sh day2night
RUN bash ./datasets/download_pix2pix_dataset.sh facades
RUN bash ./datasets/download_pix2pix_dataset.sh night2day
RUN bash ./datasets/download_pix2pix_dataset.sh maps

RUN rm -rf ./datasets/apple2orange/testA
RUN rm -rf ./datasets/apple2orange/testB
RUN rm -rf ./datasets/apple2orange/trainA
RUN rm -rf ./datasets/apple2orange/trainB
RUN mkdir ./datasets/apple2orange/testA
RUN rm -rf ./datasets/horse2zebra/testA
RUN rm -rf ./datasets/horse2zebra/trainA
RUN rm -rf ./datasets/horse2zebra/trainB
RUN rm -rf ./datasets/horse2zebra/testA
RUN mkdir ./datasets/horse2zebra/testA
RUN rm -rf ./datasets/iphone2dslr_flower/testA
RUN rm -rf ./datasets/iphone2dslr_flower/testB
RUN rm -rf ./datasets/iphone2dslr_flower/trainA
RUN rm -rf ./datasets/iphone2dslr_flower/trainB
RUN mkdir ./datasets/iphone2dslr_flower/testA
RUN rm -rf ./datasets/monet2photo/testA
RUN rm -rf ./datasets/monet2photo/testB
RUN rm -rf ./datasets/monet2photo/trainA
RUN rm -rf ./datasets/monet2photo/trainB
RUN mkdir ./datasets/monet2photo/testA
RUN rm -rf ./datasets/summer2winter_yosemite/testA
RUN rm -rf ./datasets/summer2winter_yosemite/testB
RUN rm -rf ./datasets/summer2winter_yosemite/trainA
RUN rm -rf ./datasets/summer2winter_yosemite/trainB
RUN mkdir ./datasets/summer2winter_yosemite/testA
RUN rm -rf ./datasets/maps/test
RUN rm -rf ./datasets/maps/testA
RUN rm -rf ./datasets/maps/trainB
RUN rm -rf ./datasets/maps/val
RUN rm -rf ./datasets/maps/vaA
RUN rm -rf ./datasets/maps/valB
RUN mkdir ./datasets/maps/test
RUN rm -rf ./datasets/facades/test
RUN rm -rf ./datasets/facades/testA
RUN rm -rf ./datasets/facades/testB
RUN rm -rf ./datasets/facades/train
RUN rm -rf ./datasets/facades/trainA
RUN rm -rf ./datasets/facades/trainB
RUN rm -rf ./datasets/facades/val
RUN mkdir ./datasets/facades/test
RUN rm -rf ./datasets/night2day/test
RUN rm -rf ./datasets/night2day/train
RUN rm -rf ./datasets/night2day/val
RUN mkdir ./datasets/night2day/test







RUN rm -rf node_modules && npm install

COPY . .
RUN npm install
RUN mkdir -p ./uploaded
EXPOSE 80
ENTRYPOINT npm start

