# My Neovim Configuration

Mi configuración personal de Neovim, optimizada para desarrollo moderno con Lua y gestión de plugins mediante lazy.nvim.

## ✨ Características

- 🚀 **Gestión de plugins** con [lazy.nvim](https://github.com/folke/lazy.nvim)
- ⚡ **Carga perezosa** para inicio rápido
- 🎨 **Configuración modular** organizada en Lua
- 🔧 **Configuraciones específicas por tipo de archivo** (ftplugin)
- 📝 **Plugins post-carga** para personalización avanzada

## 📦 Estructura del Proyecto

```
My-Nvim/
├── after/
│   └── plugin/          # Configuraciones que se cargan después de los plugins
├── ftplugin/            # Configuraciones específicas por tipo de archivo
├── lua/                 # Módulos Lua principales
├── init.lua             # Punto de entrada principal
└── lazy-lock.json       # versiones
```

## 📋 Requisitos Previos

- **Neovim** >= 0.9.0
- **Git** >= 2.19.0
- Un terminal con soporte para colores verdaderos (truecolor)
- **Node.js** >= 14.0 (opcional, para algunos LSP)
- Una [Nerd Font](https://www.nerdfonts.com/) instalada y configurada en tu terminal

## 🚀 Instalación

### Linux / macOS

```bash
# Respalda tu configuración actual (si existe)
mv ~/.config/nvim ~/.config/nvim.backup
mv ~/.local/share/nvim ~/.local/share/nvim.backup

# Clona este repositorio
git clone https://github.com/Kogaraashi-py/My-Nvim.git ~/.config/nvim

# Inicia Neovim (los plugins se instalarán automáticamente)
nvim
```

### Windows

```powershell
# Respalda tu configuración actual (si existe)
Move-Item $env:LOCALAPPDATA\nvim $env:LOCALAPPDATA\nvim.backup
Move-Item $env:LOCALAPPDATA\nvim-data $env:LOCALAPPDATA\nvim-data.backup

# Clona este repositorio
git clone https://github.com/Kogaraashi-py/My-Nvim.git $env:LOCALAPPDATA\nvim

# Inicia Neovim
nvim
```

## ⚙️ Post-Instalación

1. **Primera vez**: Al abrir Neovim, lazy.nvim instalará automáticamente todos los plugins
2. **Verificar salud**: Ejecuta `:checkhealth` para verificar dependencias
3. **Actualizar plugins**: Usa `:Lazy update` cuando quieras actualizar

## 🔧 Personalización

### Modificar Configuración

La configuración está modularizada para facilitar la personalización:

- **Opciones generales**: Edita archivos en `lua/`
- **Keymaps**: Revisa los atajos de teclado en tus módulos Lua
- **Plugins**: Gestiona plugins mediante lazy.nvim
- **Configuraciones por archivo**: Añade archivos en `ftplugin/` para lenguajes específicos

### Agregar Nuevos Plugins

Edita tu archivo de configuración de plugins (generalmente en `lua/plugins/` o similar) y agrega:

```lua
return {
  'autor/nombre-del-plugin',
  config = function()
    -- Tu configuración aquí
  end
}
```

Luego ejecuta `:Lazy sync` para instalar.

## 🔄 Actualización

```bash
cd ~/.config/nvim
git pull
```

Luego en Neovim ejecuta `:Lazy sync` para actualizar los plugins.

## 🗑️ Desinstalación

```bash
# Linux / macOS
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim

# Windows PowerShell
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim
Remove-Item -Recurse -Force $env:LOCALAPPDATA\nvim-data
```

## 🐛 Solución de Problemas

### Los plugins no se cargan

```vim
:Lazy clear
:Lazy sync
```

### Problemas con LSP

```vim
:LspInfo
:checkhealth
```

### Errores al iniciar

Revisa el log de inicio:

```bash
cat ~/.cache/nvim/startup.log
```

## 📝 Comandos Útiles

| Comando        | Descripción                                   |
| -------------- | --------------------------------------------- |
| `:Lazy`        | Abre el gestor de plugins                     |
| `:Lazy sync`   | Sincroniza plugins (instala/actualiza/limpia) |
| `:Lazy update` | Actualiza todos los plugins                   |
| `:checkhealth` | Verifica el estado de Neovim                  |
| `:LspInfo`     | Información sobre LSP activos                 |

## 🤝 Contribuciones

Las contribuciones, issues y solicitudes de características son bienvenidas. No dudes en revisar la página de issues si quieres contribuir.

## 📜 Licencia

Este proyecto es de código abierto y está disponible bajo tu licencia preferida.

## 🙏 Agradecimientos

- [Neovim](https://neovim.io/) - El editor
- [lazy.nvim](https://github.com/folke/lazy.nvim) - Gestor de plugins
- La increíble comunidad de Neovim

---

⭐ Si esta configuración te resulta útil, considera darle una estrella al repositorio.
