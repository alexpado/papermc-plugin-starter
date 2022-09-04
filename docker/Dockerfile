FROM ubuntu:22.10
ARG PAPER_VERSION
ENV PAPER_VERSION $PAPER_VERSION
ARG PAPER_BUILD
ENV PAPER_BUILD $PAPER_BUILD
ARG SERVER_OWNER
ENV SERVER_OWNER $SERVER_OWNER

WORKDIR /setup
RUN apt-get update && apt-get -y install jq curl
ADD scripts/download-paper.sh ./
RUN chmod +x download-paper.sh
RUN ./download-paper.sh

FROM openjdk:17.0.2-slim
WORKDIR /var/minecraft
# Copy downloaded jar from previous step above.
COPY --from=0 /setup/papermc.jar ./
COPY content ./
# Boot
CMD java -Xms2G -Xmx2G -jar papermc.jar nogui
