FROM alpine:latest

# Install dependencies
RUN apk add --no-cache \
    curl \
    ca-certificates \
    fontconfig \
    freetype \
    harfbuzz \
    graphite2 \
    libgcc \
    libstdc++ \
    unzip

# Download and install Source Han Sans fonts from Adobe
# Using Simplified Chinese (SC) variant - adjust URL for other variants (TC, JP, KR)
RUN mkdir -p /usr/share/fonts/source-han-sans && \
    cd /usr/share/fonts/source-han-sans && \
    curl -L https://github.com/adobe-fonts/source-han-sans/releases/download/2.004R/SourceHanSansSC.zip -o SourceHanSansSC.zip && \
    unzip -q SourceHanSansSC.zip && \
    rm SourceHanSansSC.zip

# Download and install Source Han Serif fonts from Adobe
# Using Simplified Chinese (SC) variant - adjust URL for other variants (TC, JP, KR)
RUN mkdir -p /usr/share/fonts/source-han-serif && \
    cd /usr/share/fonts/source-han-serif && \
    curl -L https://github.com/adobe-fonts/source-han-serif/releases/download/2.003R/09_SourceHanSerifSC.zip -o SourceHanSerifSC.zip && \
    unzip -q SourceHanSerifSC.zip && \
    rm SourceHanSerifSC.zip

# Update font cache and verify installation
RUN fc-cache -f -v && \
    echo "=== Installed Source Han fonts ===" && \
    fc-list | grep -i "source han" | head -10

# Download and install Typst
# Using the latest Typst release for x86_64 musl (Alpine compatible)
RUN TYPST_VERSION=v0.14.0 && \
    curl -fsSL https://github.com/typst/typst/releases/download/${TYPST_VERSION}/typst-x86_64-unknown-linux-musl.tar.xz \
    | tar -xJ -C /tmp && \
    mv /tmp/typst-x86_64-unknown-linux-musl/typst /usr/local/bin/typst && \
    chmod +x /usr/local/bin/typst && \
    rm -rf /tmp/typst-x86_64-unknown-linux-musl && \
    typst --version

# Create working directory
WORKDIR /workspace

# Default command
CMD ["/bin/sh"]
