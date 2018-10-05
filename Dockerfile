FROM rust:1.29.1 AS builder

RUN git clone --branch v0.3.2 --depth 1 https://github.com/databricks/click.git /click
WORKDIR /click
RUN cargo build --release

FROM scratch
COPY --from=builder /click/target/release/click /
