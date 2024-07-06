# 🦷 HealthySmiles
Bienvenido a tu nuevo proyecto Healthy Smiles y a la comunidad de desarrollo del Internet Computer. Es un espacio para los pacientes donde podrán llevar el historial de salud dental a través de la creación de una identificación digital para cada uno de ellos. 

# 📁 Estructura del Proyecto
Para comenzar, es posible que desees explorar la estructura del directorio del proyecto y el archivo de configuración predeterminado. Trabajar con este proyecto en tu entorno de desarrollo no afectará ningún despliegue en producción o tokens de identidad.

# 📚 Documentación Recomendada
Para obtener más información antes de comenzar a trabajar con HealthySmiles, consulta la siguiente documentación disponible en línea:

- [Quick Start](https://internetcomputer.org/docs/current/developer-docs/quickstart/hello10mins)
- [SDK Developer Tools](https://internetcomputer.org/docs/current/developer-docs/build/install-upgrade-remove)
- [Motoko Programming Language Guide](https://internetcomputer.org/docs/current/developer-docs/build/cdks/motoko-dfinity/motoko/)
- [Motoko Language Quick Reference](https://internetcomputer.org/docs/current/references/motoko-ref/)
- [JavaScript API Reference](https://erxue-5aaaa-aaaab-qaagq-cai.raw.icp0.io)
# 🚀 Comandos Iniciales
Si deseas comenzar a trabajar en tu proyecto de inmediato, puedes probar los siguientes comandos:

```bash
cd HealthySmiles/
dfx help
dfx canister --help
```
# 🛠️ Ejecutando el Proyecto Localmente
Si deseas probar tu proyecto localmente, puedes usar los siguientes comandos:
```bash
# Inicia la réplica, ejecutándose en segundo plano
dfx start --background

# Despliega tus canisters en la réplica y genera tu interfaz Candid
dfx deploy
```

Una vez que el trabajo se complete, tu aplicación estará disponible en http://localhost:4943?canisterId={asset_canister_id}.

# Si has realizado cambios en tu canister de backend, puedes generar una nueva interfaz Candid con:

```bash
npm run generate
```
en cualquier momento. Esto se recomienda antes de comenzar el servidor de desarrollo del frontend, y se ejecutará automáticamente cada vez que ejecutes dfx deploy.

# 🌐 Desarrollo del Frontend
Si estás haciendo cambios en el frontend, puedes iniciar un servidor de desarrollo con:
```bash
npm start
```
Lo que iniciará un servidor en http://localhost:8080, haciendo proxy de las solicitudes API a la réplica en el puerto 4943.

# ⚠️ Nota sobre las Variables de Entorno del Frontend
Si estás alojando el código del frontend en algún lugar sin usar DFX, es posible que necesites hacer uno de los siguientes ajustes para asegurarte de que tu proyecto no obtenga la clave raíz en producción:

Establecer DFX_NETWORK a ic si estás usando Webpack.
Usar tu propio método preferido para reemplazar process.env.DFX_NETWORK en las declaraciones autogeneradas.
Establecer canisters -> {asset_canister_id} -> declarations -> env_override a una cadena en dfx.json reemplazará process.env.DFX_NETWORK con la cadena en las declaraciones autogeneradas.
Escribir tu propio constructor createActor.
