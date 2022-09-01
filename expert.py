from flask import *
from database import *
import uuid

expert=Blueprint("expert",__name__)

@expert.route('/experthomes',methods=['get','post'])
def experthomes():
	return render_template("experthome.html")


@expert.route('/expertviewenquiry',methods=['get','post'])
def expertviewenquiry():
	data={}
	q="SELECT * FROM farmers INNER JOIN enquiry USING(farmer_id)"
	res=select(q)
	data['complaints']=res
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
		if action=="update":
			q="select * from enquiry inner join farmers using(farmer_id) where enquiry_id='%s'"%(id)
			res=select(q)
			data['updater']=res
	if 'update' in request.form:
		reply=request.form['reply']
		q="update enquiry set reply='%s' where enquiry_id='%s'"%(reply,id)
		update(q)
		return redirect(url_for('expert.expertviewenquiry'))
	return render_template("expertviewenquiry.html",data=data)