from flask import Flask
from admin import admin
from api import api
from public import public
# from expert import expert

app=Flask(__name__)
app.secret_key="sss"
app.register_blueprint(public)
app.register_blueprint(admin,url_prefix='/admin')
app.register_blueprint(api,url_prefix='/api')
# app.register_blueprint(expert,url_prefix='/expert')
app.run(debug=True,port=5012,host="0.0.0.0")



