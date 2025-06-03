#!/bin/bash

echo "🚀 Construyendo app Flutter para web..."
flutter build web --base-href=/portalweb/


echo "📂 Moviéndose al directorio web de build..."
cd build/web

echo "🔄 Inicializando repositorio git temporal..."
rm -rf .git
git init
git remote add origin https://github.com/Adeikar/portalweb.git
git checkout -b gh-pages

echo "📤 Subiendo archivos al branch gh-pages..."
git add .
git commit -m "🚀 Nueva versión desplegada"
git push origin gh-pages --force

echo "✅ ¡Deploy completado! Revisa: https://adeikar.github.io/portalweb/"
