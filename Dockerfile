FROM node:8

WORKDIR /app

# Configure proxychains
RUN git clone https://github.com/rofl0r/proxychains-ng
RUN cd proxychains-ng \
    && ./configure --prefix=/usr --sysconfdir=/etc \
    && make \
    && make install

# Configure anyproxy
RUN npm install -g anyproxy

# Grab the proxychains.conf file
COPY . .

CMD ["proxychains4", "anyproxy", "--port", "8001" ]