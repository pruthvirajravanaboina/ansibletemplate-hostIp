# Use nginx as base image
FROM ubuntu:latest

# Copy HTML files to nginx default directory
# COPY index.html /usr/share/nginx/html

# Update and install necessary packages
#RUN apt-get update && \
    apt-get upgrade -y && \
    apt-get install -y software-properties-common && \
    apt-add-repository --yes --update ppa:ansible/ansible

#RUN apt-get update && \
    apt-get install -y ansible && \
    apt-get install -y python-apt git stress && \
    git clone https://github.com/pruthvirajravanaboina/ansibletemplate-hostIp.git /myrepo

RUN apt update
RUN apt install software-properties-common -y
RUN apt-add-repository --yes --update ppa:ansible/ansible
RUN apt update
RUN apt install ansible -y
RUN apt install nginx -y
RUN apt install python-apt -y
RUN apt install git -y
RUN apt install stress -y && \
    git clone https://github.com/pruthvirajravanaboina/ansibletemplate-hostIp.git /myrepo

# Execute playbook
CMD ["ansible-playbook", "/myrepo/playbook.yaml"]



