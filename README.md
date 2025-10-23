# 🚀 ToDo API — Automated Multi-Container Deployment

### 🧩 Overview

This is my **biggest DevOps project** so far — a fully automated deployment of a **ToDo API** application using
**Terraform**, **Ansible**, **Docker**, **Docker Compose v2**, and **Nginx** as a reverse proxy.

The project demonstrates a complete end-to-end **Infrastructure as Code (IaC)** workflow:
from provisioning servers to running containers — **all with one command.**

---

## 🧠 Key Features

✅ Automated infrastructure provisioning with **Terraform**
✅ Configuration management & app deployment via **Ansible**
✅ Multi-container setup with **Docker Compose v2**
✅ **Nginx reverse proxy** handling traffic to the Node.js app
✅ **MongoDB** integration for persistent data storage
✅ Modular & reproducible IaC workflow
✅ Built-in environment variable management

---

## 🏗️ Architecture Overview

```
                ┌──────────────────────────┐
                │        Terraform          │
                │  (Provision Servers)      │
                └────────────┬──────────────┘
                             │
                             ▼
                ┌──────────────────────────┐
                │         Ansible           │
                │ (Install Docker & Deploy) │
                └────────────┬──────────────┘
                             │
                             ▼
     ┌────────────────────────────────────────────────────┐
     │                    Docker Host                     │
     │                                                    │
     │  ┌────────────┐   ┌────────────┐   ┌────────────┐  │
     │  │   Nginx    │→→│   Node.js  │→→│   MongoDB   │  │
     │  │ (Reverse)  │   │  (App API) │   │ (Database) │  │
     │  └────────────┘   └────────────┘   └────────────┘  │
     └────────────────────────────────────────────────────┘
```

---

## ⚙️ Tech Stack

| Layer                        | Tools Used                    |
| ---------------------------- | ----------------------------- |
| **Infrastructure**           | Terraform                     |
| **Configuration Management** | Ansible                       |
| **Containers**               | Docker, Docker Compose v2     |
| **Backend**                  | Node.js (Express.js)          |
| **Database**                 | MongoDB                       |
| **Reverse Proxy**            | Nginx                         |
| **Cloud**                    | AWS EC2 (or your custom host) |

---

## 🧾 Deployment Flow

1. **Provision Infrastructure**

   ```bash
   terraform init
   terraform apply
   ```

2. **Configure & Deploy using Ansible**

   ```bash
   ansible-playbook -i inventory.ini ansible/playbooks/deploy.yml
   ```

3. **Access the Application**
   Open your browser:

   ```
   http://<server_public_ip>:80
   ```

---

## 📁 Project Structure

```
📦 Multi-Container-Application
 ┣ 📂 ansible
 ┃ ┣ 📂 playbooks
 ┃ ┃ ┣ 📜 setup.yml
 ┃ ┃ ┗ 📜 deploy.yml
 ┣ 📂 app
 ┃ ┣ 📜 Dockerfile
 ┃ ┣ 📜 docker-compose.yml
 ┃ ┣ 📜 nginx.conf
 ┃ ┗ 📜 package.json
 ┣ 📂 terraform
 ┃ ┣ 📜 main.tf
 ┃ ┣ 📜 variables.tf
 ┃ ┗ 📜 outputs.tf
 ┗ 📜 README.md
```

---

## 🧩 Docker Compose Overview

```yaml
services:
  app:
    image: asomaaroufiniyaa/todo-api-app
    container_name: todo-app
    environment:
      - MONGO_URL=mongodb://mongo:27017/todo_db
    depends_on:
      - mongo

  mongo:
    image: mongo:latest
    container_name: mongo-db
    ports:
      - "27017:27017"
    volumes:
      - mongo_data:/data/db

  nginx:
    image: nginx:alpine
    container_name: nginx-proxy
    ports:
      - "80:80"
    volumes:
      - /home/ubuntu/nginx.conf:/etc/nginx/nginx.conf:ro
    depends_on:
      - app

volumes:
  mongo_data:
```

---

## 🧱 Nginx Configuration

```nginx
events { }

http {
  server {
    listen 80;
    location / {
      proxy_pass http://app:3000;
      proxy_set_header Host $host;
    }
  }
}
```

---

## 🚧 Challenges Faced

* Managing Ansible module compatibility (especially `docker_compose_v2`)
* Docker plugin installation across remote hosts
* Fixing file-mounting issues between host & container
* Nginx reverse proxy routing to internal Docker network
* Automating all steps to ensure zero manual setup

---

## 🧩 Future Improvements

* Add **CI/CD pipeline** with GitHub Actions
* Migrate containers to **Kubernetes** for scalability
* Add **monitoring & logging** using Prometheus + Grafana

---

## 🧑‍💻 Author

**Aso maarooufiniyaa**
DevOps & Cloud Engineer 
🌐 [LinkedIn](https://www.linkedin.com/feed/) | [GitHub](https://github.com/asomaarooufiniyaa)

---

## 🧠 Inspiration

> “Automation isn’t about replacing humans —
> it’s about freeing them to focus on creation”
