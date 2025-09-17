FROM debian:bullseye

# Install prerequisites
RUN apt-get update && apt-get install -y \
    cowsay \
    fortune-mod \
    netcat-openbsd \
    && rm -rf /var/lib/apt/lists/*

# Add /usr/games to PATH so the script can find cowsay and fortune
ENV PATH="/usr/games:${PATH}"

WORKDIR /app
COPY wisecow.sh /app/wisecow.sh
RUN chmod +x /app/wisecow.sh

EXPOSE 4499
CMD ["./wisecow.sh"]


