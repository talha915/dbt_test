FROM ghcr.io/dbt-labs/dbt-postgres:1.9.latest

WORKDIR /usr/app

# Copy dbt project files
COPY . .

# Set the profiles directory to be inside the container
ENV DBT_PROFILES_DIR=/usr/app/profiles
