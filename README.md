### Visually

Python REST API (built with the [*Django Rest Framework*](https://www.django-rest-framework.org))

*Pre-requisites: pip*

---

##### Project Setup

1. Install pipenv with pip: `pip install pipenv`
2. Clone Project `git clone https://github.com/denyoe/visually.git` && Move into project directory `cd visually`
3. Install Project Dependencies with `pipenv install` or `pipenv install --dev`
4. (Optional) Use `pipenv shell` to activate your virtual environment
5. Run the server `pipenv run python manage.py runserver` or `python manage.py runserver` if you activated the environment in Step 4

The server should now be running on port 8000.

To run the server on a different port, use: `python manage.py runserver 8080`

##### Install spaCy Models
Run `python -m spacy download en` or `python -m spacy download en_core_web_lg`

##### Configure Database

1. Edit your database connection details in `settings/dev.py` for the development enviroment
2. Run the migrations with: `python manage.py migrate` inside of the project root directory

##### Create Super User

1. Run `python manage.py createsuperuser`
2. Enter your username and press return
3. Enter your email and press return
4. Finally enter your password, confirm and you can now login @ `http://127.0.0.1:8000/admin`

---

##### Installing New Packages

Run: `pipenv install <package name>` i.e `pipenv install flask==0.12.1` or `pipenv install numpy` or `pipenv install pytest --dev`

##### Misc

1. Create migrations from model `python manage.py makemigrations media_manager`


##### MACOS mysqlclient Installation Error

 <!-- # in .zshrc (or .bashrc) -->
`export PATH="/usr/local/opt/openssl/bin:$PATH"`

<!-- # in terminal -->
`export LDFLAGS="-L/usr/local/opt/openssl/lib"`
`export CPPFLAGS="-I/usr/local/opt/openssl/include"`