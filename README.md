🦷 HealthySmiles
Bienvenido a tu nuevo proyecto HealthySmiles y a la comunidad de desarrollo del Internet Computer. Por defecto, al crear un nuevo proyecto se añaden este README y algunos archivos de plantilla a tu directorio de proyecto. Puedes editar estos archivos de plantilla para personalizar tu proyecto e incluir tu propio código para acelerar el ciclo de desarrollo.

📁 Estructura del Proyecto
Para comenzar, es posible que desees explorar la estructura del directorio del proyecto y el archivo de configuración predeterminado. Trabajar con este proyecto en tu entorno de desarrollo no afectará ningún despliegue en producción o tokens de identidad.

📚 Documentación Recomendada
Para obtener más información antes de comenzar a trabajar con HealthySmiles, consulta la siguiente documentación disponible en línea:

Quick Start
SDK Developer Tools
Motoko Programming Language Guide
Motoko Language Quick Reference
JavaScript API Reference
🚀 Comandos Iniciales
Si deseas comenzar a trabajar en tu proyecto de inmediato, puedes probar los siguientes comandos:

bash
Copiar código
cd HealthySmiles/
dfx help
dfx canister --help
🛠️ Ejecutando el Proyecto Localmente
Si deseas probar tu proyecto localmente, puedes usar los siguientes comandos:

bash
Copiar código
# Inicia la réplica, ejecutándose en segundo plano
dfx start --background

# Despliega tus canisters en la réplica y genera tu interfaz Candid
dfx deploy
Una vez que el trabajo se complete, tu aplicación estará disponible en http://localhost:4943?canisterId={asset_canister_id}.

Si has realizado cambios en tu canister de backend, puedes generar una nueva interfaz Candid con:

bash
Copiar código
npm run generate
en cualquier momento. Esto se recomienda antes de comenzar el servidor de desarrollo del frontend, y se ejecutará automáticamente cada vez que ejecutes dfx deploy.

🌐 Desarrollo del Frontend
Si estás haciendo cambios en el frontend, puedes iniciar un servidor de desarrollo con:

bash
Copiar código
npm start
Lo que iniciará un servidor en http://localhost:8080, haciendo proxy de las solicitudes API a la réplica en el puerto 4943.

⚠️ Nota sobre las Variables de Entorno del Frontend
Si estás alojando el código del frontend en algún lugar sin usar DFX, es posible que necesites hacer uno de los siguientes ajustes para asegurarte de que tu proyecto no obtenga la clave raíz en producción:

Establecer DFX_NETWORK a ic si estás usando Webpack.
Usar tu propio método preferido para reemplazar process.env.DFX_NETWORK en las declaraciones autogeneradas.
Establecer canisters -> {asset_canister_id} -> declarations -> env_override a una cadena en dfx.json reemplazará process.env.DFX_NETWORK con la cadena en las declaraciones autogeneradas.
Escribir tu propio constructor createActor.
