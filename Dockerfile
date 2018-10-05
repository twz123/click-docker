FROM rust:1.29.1 AS builder

RUN rustup target add x86_64-unknown-linux-musl
RUN git clone --branch v0.3.2 --depth 1 https://github.com/databricks/click.git /click
WORKDIR /click
RUN cargo build --release --target x86_64-unknown-linux-musl

FROM scratch
COPY --from=builder /click/target/release/click /
