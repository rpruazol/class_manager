FROM node:12

# Create app directory
RUN mkdir /src
WORKDIR /src


# Install app dependencies...grabs both package.json AND package-lock.json
COPY package*.json ./

RUN npm install -g nodemon
RUN npm install

COPY . /src

CMD ["nodemon"]