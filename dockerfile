# Use nginx as base image
FROM nginx:latest

# Copy HTML files to nginx default directory
# COPY index.html /usr/share/nginx/html

# Update and install necessary packages
RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-add-repository --yes --update ppa:ansible/ansible && \
    apt-get update && \
    apt-get install -y ansible python-apt git stress && \
    git clone https://github.com/pruthvirajravanaboina/ansibletemplate-hostIp.git /myrepo

# Execute playbook
CMD ["ansible-playbook", "/myrepo/playbook.yaml"]
