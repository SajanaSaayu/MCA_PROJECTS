from flask import *
from database import *
import uuid

public=Blueprint("public",__name__)

@public.route('/', methods=['post','get'])
def home():
	return render_template("index.html")

@public.route('/login', methods=['post','get'])
def login():
	data={}
	if 'submit' in request.form:
		
		uname=request.form['uname']
		pwd=request.form['pwd']
		q="select * from login where username='%s' and password='%s' "%(uname,pwd)
		res=select(q)
		print(res)
		if res:
			session['lid']=res[0]['login_id']
			if res[0]['usertype']=="user":
				return redirect(url_for('admin.adminhomes'))
			if res[0]['usertype']=="farmer":
				return redirect(url_for('farmer.farmerhomes'))
			if res[0]['usertype']=="reject":
				data['reject']="YOUR REQUEST REJECTED"
		else:
			flash('invaild')
	return render_template("login.html",data=data)

@public.route('/reg', methods=['post','get'])
def reg():
	if 'submit' in request.form:
		fname=request.form['fname']
		lname=request.form['lname']
		gender=request.form['gender']
		dob=request.form['dob']
		phone=request.form['phone']
		email=request.form['email']
		uname=request.form['uname']
		pwd=request.form['pwd']
		q="select * from login where username='%s' or password='%s'" %(uname,pwd)
		res=select(q)
		if res:
			return redirect(url_for('public.reg'))
		else:
			q="insert into login values(null,'%s','%s','user') "%(uname,pwd)
			id=insert(q)
			q="insert into farmers values(null,'%s','%s','%s','%s','%s','%s','%s')" %(id,fname,lname,gender,dob,phone,email)
			insert(q)
			return redirect(url_for('public.login'))
			
	return render_template("registration.html")

@public.route('/expertreg', methods=['post','get'])
def expertreg():
	if 'submit' in request.form:
		fname=request.form['fname']
		lname=request.form['lname']
		phone=request.form['phone']
		email=request.form['email']
		uname=request.form['uname']
		pwd=request.form['pwd']
		qul=request.files['quali']
		path='static/'+str(uuid.uuid4())+qul.filename 
		qul.save(path)
		q="select * from login where username='%s' or password='%s'" %(uname,pwd)
		res=select(q)
		if res:
			return redirect(url_for('public.reg'))
		else:
			q="insert into login values(null,'%s','%s','pending') "%(uname,pwd)
			id=insert(q)
			q="insert into experts values(null,'%s','%s','%s','%s','%s','%s')" %(id,fname,lname,phone,email,path)
			insert(q)
			return redirect(url_for('public.login'))
			
	return render_template("expertregistration.html")