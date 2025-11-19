# 🟦 Devsu Backend Challenge – GKE + Docker + CI/CD + HTTPS

Este repositorio contiene la solución completa al reto técnico solicitado por **Devsu**, desplegando una API Node.js dentro de **Google Kubernetes Engine Autopilot (GKE)**, manejando imágenes con **Artifact Registry**, exponiendo el servicio con **Ingress + HTTPS**, enlazado a un dominio personalizado **(gissepa.space)** y automatizado con un pipeline de **CI/CD usando GitHub Actions**.

---

# 🚀 Requerimientos cumplidos

✔ API funcional con endpoint `/api/users`  
✔ Dockerfile construido correctamente  
✔ Despliegue en Google Kubernetes Engine (Autopilot)  
✔ Servicio expuesto mediante Load Balancer  
✔ Dominio personalizado funcional: **https://gissepa.space**  
✔ Certificado SSL administrado automático (ManagedCertificate)  
✔ Ingress con redirección `/` → `/api/users`  
✔ CI/CD completo: build → push → deploy  
✔ Imágenes almacenadas en Artifact Registry  
✔ Actualización automática del Deployment y rollout sin downtime  

---

# 📡 Endpoints del proyecto

### **API principal**

https://gissepa.space/api/users


### **Redirección desde root**

https://gissepa.space/

→ Redirige automáticamente a `/api/users`.

---

# 📁 Estructura del repositorio

```bash
.
├── server.js
├── package.json
├── Dockerfile
├── k8s/
│   ├── deployment.yaml
│   ├── service.yaml
│   ├── ingress.yaml
│   ├── managed-cert.yaml
│   ├── redirector.yaml
├── .github/
│   └── workflows/
│       └── ci-cd.yml
└── README.md

# 🧪 Cómo ejecutar el proyecto localmente

npm install
node server.js

http://localhost:8000/api/users

# 🐳 Ejecutar con Docker

docker build -t devsu-app .
docker run -p 8000:8000 devsu-app

#☸️ Despliegue en Google Kubernetes Engine (GKE)

gcloud container clusters create-auto devsu-autopilot-east2 \
  --region us-east1

kubectl apply -f k8s/deployment.yaml
kubectl apply -f k8s/service.yaml

kubectl get pods

#🌐 Dominio personalizado

Dominio usado:

https://gissepa.space

DNS configurado:
Tipo	Nombre	Valor	TTL
A	@	136.110.239.41	Auto
A	www	136.110.239.41	Auto

Esa IP corresponde al Load Balancer del Ingress.

#🔐 Certificado HTTPS (Google ManagedCertificate)

kubectl apply -f k8s/managed-cert.yaml
kubectl describe managedcertificate devsu-managed-cert

#↪️ Redirección "/" → "/api/users"

k8s/redirector.yaml

#🤖 CI/CD con GitHub Actions

.github/workflows/ci-cd.yml

# 📦 Artefactos finales del proyecto
API:

🔗 https://gissepa.space/api/users

Homepage (redirige):

🔗 https://gissepa.space/

Repositorio:

🔗 https://github.com/Gissela25/Devsu-Test/tree/main