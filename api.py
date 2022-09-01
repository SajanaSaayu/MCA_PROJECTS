from flask import *
from database import *
from knn import *
import csv
import demjson
import uuid
# from predict import *
from predictweather import *

filename='RF2.sav'

model=pickle.load(open(filename,'rb'))

api=Blueprint('api',__name__)


@api.route('/login',methods=['get','post'])
def login():
	data={}
	
	username = request.args['username']
	password = request.args['password']
	q="SELECT * from login where username='%s' and password='%s'" % (username,password)
	
	print(q)
	res = select(q)
	print(res)
	if res :
		data['status']  = 'success'
		data['data'] = res
	else:
		data['status']	= 'failed'
	data['method']='login'
	return  demjson.encode(data)
@api.route('/regi',methods=['get','post'])
def regi():
	data={}
	fname=request.args['fname']
	lname=request.args['lname']
	email=request.args['email']
	place=request.args['place']
	phone=request.args['phone']
	username = request.args['username']
	password = request.args['password']
	q1="SELECT * FROM login where username='%s'"%(username)
	print(q1)
	res=select(q1)
	print(res)
	if res:
		data['status'] = 'duplicate'
		data['method'] = 'regi'
	else:
		q="INSERT INTO `login` VALUES(NULL,'%s','%s','farmer')"%(username,password)
		lid=insert(q)
		qr="INSERT INTO `farmers` values(null,'%s','%s','%s','%s','%s','%s')" %(lid,fname,lname,email,phone,place)
		id=insert(qr)
		if id>0:
			data['status'] ='success'
		else:

			data['status'] ='failed'
		data['method'] ='regi'
	return demjson.encode(data)

@api.route('/viewsoiltype',methods=['get','post'])
def viewsoiltype():
	data={}
	q="SELECT * from soil_types"
	print(q)
	res = select(q)
	print(res)
	if res :
		data['status']  = 'success'
		data['data'] = res
	else:
		data['status']	= 'failed'
	data['method']='viewsoiltype'
	return  demjson.encode(data)

@api.route('/viewstate',methods=['get','post'])
def viewstate():
	data={}
	q="SELECT * from state"
	print(q)
	res = select(q)
	print(res)
	if res :
		data['status']  = 'success'
		data['data'] = res
	else:
		data['status']	= 'failed'
	data['method']='viewstate'
	return  demjson.encode(data)

@api.route('/viewplace',methods=['get','post'])
def viewplace():
	data={}
	sid=request.args['sid']
	q="SELECT * from place where state_id='%s'" %(sid)
	print(q)
	res = select(q)
	print(res)
	if res :
		data['status']  = 'success'
		data['data'] = res
	else:
		data['status']	= 'failed'
	data['method']='viewplace'
	return  demjson.encode(data)

@api.route('/viewcrop',methods=['get','post'])
def viewcrop():
	data={}
	q="SELECT * from crop "
	print(q)
	res = select(q)
	print(res)
	if res :
		data['status']  = 'success'
		data['data'] = res
	else:
		data['status']	= 'failed'
	data['method']='viewcrop'
	return  demjson.encode(data)

def NeighborValues(ArrayValues, limit):

	global CROP_VALUE
	try:
		if limit == 3:
			pass
		else:
			new_crop_values = []
			for item in ArrayValues:
				new_crop_values.append(float(item) + 1)

			result = predict_farmer_crop(new_crop_values)

			if CROP_VALUE == result:
				pass
			else:
				CROP_VALUE = result
				ARRAY_PREDICTION.append(result)			

			NeighborValues(new_crop_values, len(ARRAY_PREDICTION))

			# print("new crop values", new_crop_values)
	except:
		pass
	pass

@api.route('/suggestcrop',methods=['get','post'])
def suggestcrop():
	data={}
	global CROP_VALUE, ARRAY_PREDICTION
	ARRAY_PREDICTION = []
	crop_values = []
	soil_type_id = request.args['stpid']

	qw = "SELECT * from soil_types WHERE soil_type_id = '%s'"%soil_type_id
	ress = select(qw)

	q="SELECT * FROM `soil_characteristics` WHERE `soil_type_id` ='%s' ORDER BY characteristic_id" %(soil_type_id)
	res=select(q)
	for item in res:
		temp = item['content_quantity'].split('-')
		crop_values.append(temp[0])
		crop_values.append(temp[1])

	
	result = newpredict_farmer_cropss(crop_values)
	CROP_VALUE = result
	ARRAY_PREDICTION.append(result)			
	NeighborValues(crop_values, 1)
	print("ARRAY_PREDICTION=", ARRAY_PREDICTION)
	
	data['result'] = ARRAY_PREDICTION
	data['soil'] = ress[0]['soil_name']
	data['status']  = 'success'
	data['method']='suggestcrop'
	return  demjson.encode(data)


@api.route('/suggestcropss',methods=['get','post'])
def suggestcropss():
	data={}
	global CROP_VALUE, ARRAY_PREDICTION
	ARRAY_PREDICTION = []
	ARRAY_PREDICTION.clear()
	crop_values = []
	crop_values.clear()
	moisture_low = (float(request.args['mois']) * 10)
	crop_values.append(moisture_low)

	moisture_high = (float(request.args['mois']) * 10) + 10
	crop_values.append(moisture_high)

	phvalue_low = float(request.args['phv'])  - 2
	crop_values.append(phvalue_low)

	phvalue_high = float(request.args['phv']) + 4
	crop_values.append(phvalue_high)

	nitrogen_low = (float(request.args['ni']) / 100) - 1
	crop_values.append(nitrogen_low)

	nitrogen_high = (float(request.args['ni']) / 100) + 1
	crop_values.append(nitrogen_high)

	phosphorus_low = (float(request.args['ph']) / 100) - 1 
	crop_values.append(phosphorus_low)

	phosphorus_high = (float(request.args['ph']) / 100) + 1 
	crop_values.append(phosphorus_high)

	potassium_low = (float(request.args['pot']) / 100) - 1
	crop_values.append(potassium_low)

	potassium_high = (float(request.args['pot']) / 100) + 1
	crop_values.append(potassium_high)

	temp_high = 38
	crop_values.append(temp_high)

	temp_low = 20
	crop_values.append(temp_low)
	print("test values = ", crop_values)
	result=""
	result = newpredict_farmer_cropss(crop_values)
	CROP_VALUE=""
	ARRAY_PREDICTION.clear()
	CROP_VALUE = result
	print(CROP_VALUE)
	ARRAY_PREDICTION.append(result)			
	NeighborValues(crop_values, 1)
	print("ARRAY_PREDICTION=", ARRAY_PREDICTION)

	# result = predict_farmer_crop(crop_values)
	# data['result_value'] = ARRAY_PREDICTION
	# print("hh",result)
	data['result'] = ARRAY_PREDICTION
	

	# data['soil'] = ress[0]['soil_name']
	data['status']  = 'success'
	data['method']='suggestcropss'
	return  demjson.encode(data)


@api.route('/predcityield',methods=['get','post'])
def predcityield():
	data={}
	val=[]

	sid=request.args['sid']
	pid=request.args['pid']
	yy=request.args['yy']
	y=request.args['year']
	cid=request.args['cid']
	acre=request.args['acre']
	import samplecheck 
	val.append(sid)
	val.append(pid)
	val.append(y)
	val.append(yy)
	val.append(cid)
	val.append(acre)
	print(val)
	
	res_set=samplecheck.predict_farmer_crop(val)
	print("dfbv",res_set)
	data['result'] = res_set
	

	# data['soil'] = ress[0]['soil_name']
	data['status']  = 'success'
	data['method']='predcityield'
	return  demjson.encode(data)

@api.route('/cropfertpredict',methods=['get','post'])
def cropfertpredict():
	data={}
	# val=[]

	city=request.args['place']
	city = city+" weather"
	
	l,t,i,w,p=weather(city)
	pp=str(p)
	ps=pp.replace("%","")
	print(pp)
	data['outl']="Location : "+l
	data['outw']="Weather : "+i
	data['outd']="Degree : "+w+"degree celcius"

	data['outp']="Perception : "+p
	if int(ps)>50:
		out="Not a Good Time for Fertilize"
	else:
		out="Good Time for Fertilize"
	data['out']=out
	

	# data['soil'] = ress[0]['soil_name']
	data['status']  = 'success'
	data['method']='cropfertpredict'
	return  demjson.encode(data)

@api.route('/getsoil',methods=['get','post'])
def getsoil():
	data={}
	q="SELECT soil_type from fertilizer_dataset group by soil_type"
	print(q)
	res = select(q)
	print(res)
	if res :
		data['status']  = 'success'
		data['data'] = res
	else:
		data['status']	= 'failed'
	data['method']='getsoil'
	return  demjson.encode(data)

@api.route('/getcrop',methods=['get','post'])
def getcrop():
	data={}
	q="SELECT crop_type from fertilizer_dataset group by crop_type"
	print(q)
	res = select(q)
	print(res)
	if res :
		data['status']  = 'success'
		data['data'] = res
	else:
		data['status']	= 'failed'
	data['method']='getcrop'
	return  demjson.encode(data)


@api.route('/predictferti',methods=['get','post'])
def predictferti():
	data={}
	val=[]

	temp=request.args['temp']
	humi=request.args['humi']
	mois=request.args['mois']
	ni=request.args['ni']
	ph=request.args['ph']
	pot=request.args['pot']
	sid=request.args['sid']
	#yy=request.args['yy']
	#y=request.args['year']
	cid=request.args['cid']

	if "Sandy"==sid:
		sout="1"
	elif "Loamy"==sid:
	    sout="2"
	elif "Black"==sid:
		sout="3"
	elif "Red"==sid:
	    sout="4"
	elif "Clay"==sid:
	    sout="5"
	if "Maize"==cid:
	 	cout=1
	elif "Sugarcane"==cid:
	 	cout=2
	elif "Cotton"==cid:
	 	cout=3
	elif "Tobacco"==cid:
	 	cout=4
	elif "Paddy"==cid:
	 	cout=5
	elif "Barley"==cid:
	 	cout=6
	elif "wheat"==cid:
	 	cout=8
	elif "Millets"==cid:
	 	cout=9
	elif "Oilseeds"==cid:
	 	cout=10
	elif "pulses"==cid:
	 	cout=11
	elif "Groundnut"==cid:
	 	cout=12

	val=[]
	vals=[]
	val.append(temp)
	val.append(humi)
	val.append(mois)
	val.append(sout)
	val.append(cout)
	val.append(ni)
	val.append(pot)
	val.append(ph)
	vals.append(val)
	print(vals)
	prediction=model.predict(vals)
	print("ppppppp",prediction)
	data['out']= prediction[0]
	if prediction==1:
		data['out']="Urea"
	elif prediction==2:
		data['out']="DAP"
	elif prediction==3:
		data['out']="14-35-14"
	elif prediction==4:
		data['out']="28-28"
	elif prediction==5:
		data['out']="17-17-17"
	elif prediction==6:
		data['out']="20-20"
	elif prediction==7:
		data['out']="10-26-26"

	data['status']= 'success'
	data['method']='predictferti'
	return  str(data)


	#q="select * from fertilizer_dataset where temperature='%s',humidity='%s',moisture='%s',soil_type='%s',crop_type='%s',nitrogen='%s',potassium='%s',phosphorus='%s'" %(temp,humi,mois,ni,ph,pot,sid,cid) 
   
    
	# data['soil'] = ress[0]['soil_nam


