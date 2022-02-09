FROM haskell

RUN curl -fsSL https://code-server.dev/install.sh | sh -s 
RUN echo 'PATH=$PATH:/root/.cabal/bin:/root/.local/bin:/opt/ghc/9.0.1/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin' > ~/.profile
COPY code-data /data

WORKDIR /exercises
ENTRYPOINT ["code-server", "--auth", "none", "--bind-addr", "0.0.0.0:8080", "--user-data-dir", "/data", "/exercises"]
