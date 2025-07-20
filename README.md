# 🐾 GustoMaster

**GustoMaster** es una aplicación móvil construida con Flutter que permite a los usuarios explorar razas de perros a través de una API. Los usuarios pueden consultar sus características y guardar sus favoritas con un nombre personalizado.

> 🚧 Proyecto en fase **beta** – en desarrollo activo.

---

## 📱 Características principales

- 📡 Consulta razas de perros desde una API pública.
- 🐶 Muestra información como altura, peso, origen, temperamento, etc.
- ❤️ Permite guardar razas como favoritas con nombres personalizados.
- 📦 Almacenamiento local con Hive para persistencia offline.
- 📶 Detección de conectividad para manejar disponibilidad de red.

---

## ⚙️ Tecnologías utilizadas

- [Flutter](https://flutter.dev)
- [Hive](https://docs.hivedb.dev/)
- [Connectivity Plus](https://pub.dev/packages/connectivity_plus)
- [Cubit (Bloc)](https://pub.dev/packages/flutter_bloc)

---

## 🧪 Requisitos

Asegúrate de tener instalado Flutter en la siguiente versión (o compatible):

Flutter 3.27.1 • channel stable • https://github.com/flutter/flutter.git
Framework • revision 17025dd882 (hace 7 meses) • 2024-12-17 03:23:09 +0900
Engine • revision cb4b5fff73
Tools • Dart 3.6.0 • DevTools 2.40.2


---

## 📁 Estructura del proyecto
'''
lib/
├── core/
│   └── constants.dart                      # Constantes globales
│
├── data/
│   ├── models/                             # Modelos Hive y lógicos
│   │   ├── dog_breed.dart
│   │   ├── height.dart
│   │   ├── weight.dart
│   │   ├── user_favorite_dog.dart
│   │   └── *.g.dart                        # Archivos generados por Hive
│   │
│   ├── repositories/
│   │   └── dog_repository.dart             # Capa intermedia entre lógica y fuentes
│   │
│   └── sources/                            # Fuentes de datos (API y local)
│       ├── dog_api_source.dart
│       └── dog_local_source.dart
│
├── logic/
│   ├── dog_favorite_cubic/                 # Cubit y estados de favoritos
│   │   ├── dog_favorite_cubit.dart
│   │   └── dog_favorite_state.dart
│   │
│   └── home_cubit/                         # Cubit y estados de la pantalla principal
│       ├── home_cubit.dart
│       └── home_state.dart
│
├── presentation/
│   ├── pages/                              # Pantallas principales de la app
│   │   ├── dog_details.dart
│   │   ├── dog_favorite_details_page.dart
│   │   ├── dog_favorite_page.dart
│   │   └── home_page.dart
│   │
│   └── widgets/                            # Widgets reutilizables
│       ├── dog_button_add.dart
│       ├── dog_card.dart
│       ├── dog_favorite_card.dart
│       ├── labeled_value.dart
│       ├── loading_indicator.dart
│       └── text_span_widget.dart
│
└── main.dart                               # Punto de entrada principal
'''
---

## 🚀 Instalación

1. Clona este repositorio:
   ```bash
   git clone https://github.com/tuusuario/gustomaster.git
   cd gustomaster

2. Instala las dependencias:

    flutter pub get

3. Corre la app:

    flutter run

Desiciones claves:

    * Agregar la mascota a favorito desde la card, crear un listview de las mascotas en card, esto lo hace mas intuitivo y facil de entender al usuario.
    * Ver los detalles del perro antes de agregarlo a favorito de esta manera le permite conocer el animal antes.
    
   
Desarrollado️ por Jorge Arrieta
