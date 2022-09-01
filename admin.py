from flask import *
from database import *
import uuid
# from knn import *
import pickle

admin=Blueprint("admin",__name__)

@admin.route('/adminhome',methods=['get','post'])
def adminhomes():
	return render_template("adminhome.html")


@admin.route('/admin_yieldprediction',methods=['get','post'])
def admin_yieldprediction():
	data={}
	if 'submit' in request.form:
		a=request.form['a']
		b=request.files['b']
		c=request.files['c']
		d=request.files['d']
		# path='static/uploads/'+str(uuid.uuid4())+img.filename
		# img.save(path)
		# desc=request.form['desc']
		# q="insert into soil_types values(null,'%s','%s','%s')"%(sname,path,desc)
		# insert(q)
		return redirect(url_for('admin.admin_yieldprediction'))
	return render_template("admin_yieldprediction.html",data=data)

@admin.route('/admin_croprecommendation',methods=['get','post'])
def admin_croprecommendation():
	data={}
	if 'submit' in request.form:
		a=request.form['a']
		b=request.files['b']
		c=request.files['c']
		
		
		return redirect(url_for('admin.admin_croprecommendation'))
	return render_template("admin_croprecommendation.html",data=data)

@admin.route('/admin_fertilizer',methods=['get','post'])
def admin_fertilizer():
	data={}
	if 'submit' in request.form:
		a=request.form['a']

		return redirect(url_for('admin.admin_fertilizer'))
	return render_template("admin_fertilizer.html",data=data)

@admin.route('/adminviewexpert',methods=['get','post'])
def adminviewexpert():
	data={}
	q="SELECT * FROM `experts` INNER JOIN login USING(login_id)"
	res=select(q)
	data['exp']=res
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=='approve' :
		q="update login set usertype='expert' where login_id='%s'"%(id)
		update(q)
		return redirect(url_for('admin.adminviewexpert'))
	if action=='reject':
		q="update login set usertype='reject' where login_id='%s'"%(id)
		update(q)
		return redirect(url_for('admin.adminviewexpert'))
	return render_template("adminviewexpert.html",data=data)
	

@admin.route('/fertilizers',methods=['get','post'])
def admin_fert():
	data={}
	if 'submit' in request.form:
		fertname=request.form['fert_name']
		desc=request.form['desc']
		q="insert into fertilizers values(null,'%s','%s')"%(fertname,desc)
		insert(q)
		return redirect(url_for('admin.admin_fert'))

	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=='delete' :
		q="DELETE FROM fertilizers WHERE fertilizer_id='%s'" %(id)
		delete(q)
	if action=='update':
		q="SELECT * FROM fertilizers WHERE fertilizer_id='%s'" %(id)
		res=select(q)
		data['update_fert']=res
	if 'update' in request.form:
		fertname=request.form['fert_name']
		desc=request.form['desc']
		q="update fertilizers set fertilizer_name='%s',description='%s' where fertilizer_id='%s'"%(fertname,desc,id)
		update(q)
		return redirect(url_for('admin.admin_fert'))
	q="SELECT * FROM fertilizers"
	res=select(q)
	data['fert_details']=res
	return render_template("adminmanagedfertilisers.html",data=data)

@admin.route('/soiltype',methods=['post','get'])
def soiltype():
	data={}
	if 'submit' in request.form:
		sname=request.form['soil_name']
		img=request.files['image']
		path='static/uploads/'+str(uuid.uuid4())+img.filename
		img.save(path)
		desc=request.form['desc']
		q="insert into soil_types values(null,'%s','%s','%s')"%(sname,path,desc)
		insert(q)
		return redirect(url_for('admin.soiltype'))
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=='delete' :
		q="DELETE FROM soil_types WHERE soil_type_id='%s'" %(id)
		delete(q)
	if action=='update':
		q="SELECT * FROM soil_types WHERE soil_type_id='%s'" %(id)
		res=select(q)
		data['update_soiltype']=res
	if 'update' in request.form:
		sname=request.form['soil_name']
		desc=request.form['desc']
		img=request.files['image']
		path='static/uploads/'+str(uuid.uuid4())+img.filename
		img.save(path)
		q="update soil_types set soil_name='%s',description='%s',image='%s' where soil_type_id='%s' "%(sname,desc,path,id)
		update(q)
		return redirect(url_for('admin.soiltype'))
	q="SELECT * FROM soil_types"
	res=select(q)
	data['soil_details']=res
	return render_template("adminentersoiltype.html",data=data)

@admin.route('/croplist',methods=['post','get'])
def croplist():
	data={}
	if 'submit' in request.form:
		cname=request.form['crop_name']
		img=request.files['image']
		path='static/uploads/'+str(uuid.uuid4())+img.filename
		img.save(path)
		desc=request.form['desc']
		q="insert into crops values(null,'%s','%s','%s')"%(cname,path,desc)
		insert(q)
		return redirect(url_for('admin.croplist'))
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=='delete' :
		q="DELETE FROM crops WHERE crop_id='%s'" %(id)
		delete(q)
	if action=='update':
		q="SELECT * FROM crops WHERE crop_id='%s'" %(id)
		res=select(q)
		data['update_croplist']=res
	if 'update' in request.form:
		cname=request.form['crop_name']
		desc=request.form['desc']
		img=request.files['image']
		path='static/uploads/'+str(uuid.uuid4())+img.filename
		img.save(path)
		q="update crops set crop_name='%s',description='%s',crop_image='%s' where crop_id='%s' "%(cname,desc,path,id)
		update(q)
		return redirect(url_for('admin.croplist'))
	q="SELECT * FROM crops"
	res=select(q)
	data['crop_details']=res
	return render_template("croplist.html",data=data)

@admin.route('/geofeatures',methods=['post','get'])
def geofeatures():
	data={}

	
	if 'submit' in request.form:
		sname=request.form['sname']
		features=request.form['features']
		q="insert into geographical_features values(null,'%s','%s')"%(sname,features)
		insert(q)
		return redirect(url_for('admin.geofeatures'))
	
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=='delete' :
		q="DELETE FROM geographical_features WHERE geo_id='%s'" %(id)
		delete(q)
	if action=='update':
		q="SELECT * FROM geographical_features WHERE geo_id='%s'" %(id)
		res=select(q)
		data['geo_features']=res
	if 'update' in request.form:
		soil_id=request.form['sname']
		features=request.form['features']
		q="update geographical_features set feature='%s' where geo_id='%s' "%(features,id)
		update(q)
		return redirect(url_for('admin.geofeatures'))
	
	q="SELECT * FROM geographical_features INNER JOIN `soil_types` USING(`soil_type_id`)"
	res=select(q)
	data['features']=res

	q="select * from soil_types"
	res=select(q)
	print(res)
	data['soil_details']=res
	
	return render_template("geographicalfeatures.html",data=data)

@admin.route('/soil_characteristics', methods=['post','get'])
def soil_characteristics():
	data={}

	soil_id=request.args['id']

	if 'submit' in request.form:
		cname=request.form['character']
		qty=request.form['quantity']
		data['id'] = soil_id
		q="INSERT INTO `soil_characteristics`(`soil_type_id`, `characteristic_id`, `content_quantity`) VALUES ('%s','%s','%s')"%(soil_id, cname, qty)
		insert(q)
		return redirect(url_for('admin.soil_characteristics', id=soil_id))


	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None


	if action=='delete' :
		q="DELETE FROM soil_characteristics WHERE characteristic_feature_id='%s'" %(id)
		delete(q)
		return redirect(url_for('admin.soil_characteristics', id=soil_id))

	q="SELECT * FROM characteristics"
	res=select(q)
	data['features']=res

	q="SELECT * FROM soil_characteristics INNER JOIN characteristics USING (characteristic_id) where soil_characteristics.soil_type_id = '%s'"%(soil_id)
	res=select(q)
	data['characteristics']=res

	return render_template("soil_characteristics.html",data=data)

@admin.route('/chemfeatures',methods=['post','get'])
def chemfeatures():
	data={}

	
	if 'submit' in request.form:
		cname=request.form['chemical_name']
		desc=request.form['desc']
		q="insert into chemicals values(null,'%s','%s')"%(cname,desc)
		insert(q)
		return redirect(url_for('admin.chemfeatures'))
	
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=='delete' :
		q="DELETE FROM chemicals WHERE chemical_id='%s'" %(id)
		delete(q)
	if action=='update':
		q="SELECT * FROM chemicals WHERE chemical_id='%s'" %(id)
		res=select(q)
		data['update_chemicals']=res
	if 'update' in request.form:
		cname=request.form['chemical_name']
		desc=request.form['desc']
		q="update chemicals set chemical_name='%s',description='%s' where chemical_id='%s' "%(cname,desc,id)
		update(q)
		return redirect(url_for('admin.chemfeatures'))
	
	q="SELECT * FROM chemicals "
	res=select(q)
	data['chem_details']=res
	return render_template("chemical.html",data=data)

@admin.route('/chemicals',methods=['post','get'])
def chemicals():
	data={}
	# ids=request.args['ids']
	
	if 'submit' in request.form:
		sname=request.form['sname']
		cname=request.form['cname']
		quantity=request.form['Quantity']
		q="insert into `chemical_features` values(null,'%s','%s','%s')"%(sname,cname,quantity)
		insert(q)
		# return redirect(url_for('admin.chemicals',ids=ids))
		return redirect(url_for('admin.chemicals'))
	
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=='delete' :
		q="DELETE FROM chemical_features WHERE chemical_feature_id='%s'" %(id)
		delete(q)
		return redirect(url_for('admin.chemicals'))
	q="select * from soil_types"
	res=select(q)
	data['soil_details']=res
	print(res)
	
	q="SELECT * FROM chemical_features inner JOIN soil_types USING(soil_type_id)"
	res=select(q)
	data['details']=res
	# data['id']=ids
	q="select * from chemicals"
	res=select(q)
	data['chem_details']=res
	print(res)

	q="SELECT * FROM chemical_features inner JOIN chemicals USING(chemical_id) inner join soil_types using(soil_type_id)" 
	res=select(q)
	data['details']=res
	
	return render_template("chemicalfeatures.html",data=data)


@admin.route('/fertchem',methods=['post','get'])
def fertchem():
	data={}


	
	if 'submit' in request.form:
		fertname=request.form['fertname']
		cname=request.form['cname']
		quantity=request.form['Quantity']
		q="insert into fertilizer_chemicals values(null,'%s','%s','%s')"%(fertname,cname,quantity)
		insert(q)
		return redirect(url_for('admin.fertchem'))
	
	if 'action' in request.args:
		action=request.args['action']
		id=request.args['id']
	else:
		action=None

	if action=='delete' :
		q="DELETE FROM fertilizer_chemicals WHERE fertilizer_chemical_id='%s'" %(id)
		delete(q)
		return redirect(url_for('admin.fertchem'))

	if action=='update':
		q="select * from fertilizer_chemicals where fertilizer_chemical_id='%s'" %(id)
		res=select(q)
		print(res)
		data['upfert']=res
		q="SELECT `fertilizer_id`,`fertilizer_name`,(`fertilizer_id`='%s') AS selid FROM `fertilizers` ORDER BY selid DESC,`fertilizer_id` ASC" %(res[0]['fertilizer_id'])
		res1=select(q)
		data['upfertilizer']=res1
		q="SELECT `chemical_id`,`chemical_name`,(`chemical_id`='%s') AS selid FROM `chemicals` ORDER BY selid DESC,`chemical_id` ASC" %(res[0]['chemical_id'])
		print(q)
		res=select(q)
		data['upchemical']=res

	if 'update' in request.form:
		fertname=request.form['fertname']
		cname=request.form['cname']
		quantity=request.form['Quantity']
		q="update fertilizer_chemicals set fertilizer_id='%s',chemical_id='%s',content_quantity='%s' WHERE fertilizer_chemical_id='%s'" %(fertname,cname,quantity,id)

		update(q)
		return redirect(url_for('admin.fertchem'))
	q="select * from fertilizers"
	res=select(q)
	data['fert_details']=res
	print(res)
	
	q="SELECT * FROM fertilizer_chemicals inner JOIN fertilizers USING(fertilizer_id)"
	res=select(q)
	data['content']=res
	# data['id']=ids
	q="select * from chemicals"
	res=select(q)
	data['chem_details']=res
	print(res)

	q="SELECT * FROM fertilizer_chemicals inner JOIN chemicals USING(chemical_id) inner join fertilizers using(fertilizer_id)"
	res=select(q)
	print(res)
	data['content']=res
	
	return render_template("fertilizerchemical.html",data=data)

@admin.route('/train_dataset',methods=['post','get'])
def train_dataset():
	data={}
	# train_crops()
	if "btn_train" in request.form:
		da=request.files['dataset']
		path='static/uploads/'+str(uuid.uuid4())+da.filename
		da.save(path)
		
		result = predict_crop(path)
		print(result)
		data['result'] = result
		# print("hh",result)

	return render_template("admin_training.html", data=data)


# @admin.route('/test_pickle', methods=['post','get'])
# def test_pickle():
# 	data={}
# 	dogs_dict = { 'Ozzy': 3, 'Filou': 8, 'Luna': 5, 'Skippy': 10, 'Barco': 12, 'Balou': 9, 'Laika': 16 }

# 	#creating a pickle file and writing into it
# 	filename = 'dogs.pickle'
# 	outfile = open(filename,'wb')
# 	pickle.dump(dogs_dict, outfile)
# 	outfile.close()

# 	#reading from a pickle file 
# 	infile = open(filename,'rb')
# 	new_dict = pickle.load(infile)
# 	infile.close()

# 	print(new_dict)
# 	print(new_dict==dogs_dict)
# 	print(type(new_dict))

# 	return render_template('pickle_template.html', data=data)
	















