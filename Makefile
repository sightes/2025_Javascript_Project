.PHONY: all clean init-node

# Variables
ANALYSIS = $(analysis)
DATE = $(shell date +"%Y_%m_%d")
PROJECT = $(DATE)_$(ANALYSIS)

# Default target: create project structure
all: $(PROJECT)

$(PROJECT):
	@echo "Creando estructura de directorios para $(PROJECT)..."
	mkdir -p $(PROJECT)/src/css
	mkdir -p $(PROJECT)/src/js
	mkdir -p $(PROJECT)/assets/img
	touch $(PROJECT)/src/index.html
	touch $(PROJECT)/src/css/style.css
	touch $(PROJECT)/src/js/script.js
	echo "<!DOCTYPE html>" > $(PROJECT)/src/index.html
	echo "<html lang=\"en\">" >> $(PROJECT)/src/index.html
	echo "<head>" >> $(PROJECT)/src/index.html
	echo "  <meta charset=\"UTF-8\">" >> $(PROJECT)/src/index.html
	echo "  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">" >> $(PROJECT)/src/index.html
	echo "  <title>$(ANALYSIS)</title>" >> $(PROJECT)/src/index.html
	echo "  <link rel=\"stylesheet\" href=\"css/style.css\">" >> $(PROJECT)/src/index.html
	echo "</head>" >> $(PROJECT)/src/index.html
	echo "<body>" >> $(PROJECT)/src/index.html
	echo "  <script src=\"js/script.js\"></script>" >> $(PROJECT)/src/index.html
	echo "</body>" >> $(PROJECT)/src/index.html
	echo "</html>" >> $(PROJECT)/src/index.html
	echo "/* Archivo CSS para $(ANALYSIS) */" > $(PROJECT)/src/css/style.css
	echo "// Archivo JS para $(ANALYSIS)" > $(PROJECT)/src/js/script.js
	echo "# $(PROJECT)" > $(PROJECT)/README.md
	@echo "Estructura de directorios y archivos para $(PROJECT) creada."

# Target to initialize Node.js in the project
init-node:
	@if [ -d "$(PROJECT)" ]; then \
		cd $(PROJECT) && npm init -y; \
		echo "Node.js inicializado en $(PROJECT)."; \
	else \
		echo "Error: El proyecto $(PROJECT) no existe. Crea el proyecto primero con 'make all'."; \
	fi

# Clean target: delete project structure
clean:
	@if [ -n "$(ANALYSIS)" ]; then \
		rm -rf $(DATE)_$(ANALYSIS); \
		echo "Directorio $(DATE)_$(ANALYSIS) eliminado."; \
	else \
		echo "Error: Por favor especifica 'analysis'."; \
	fi