from flask import *
from database import *
from knn import *
import csv
# 
from predictweather import *
import matplotlib.pyplot as plt


CROP_VALUE = ""
ARRAY_PREDICTION = []

farmer=Blueprint("farmer",__name__)

@farmer.route('/farmerhome')
def farmerhomes():
	data={}
	q="SELECT *,CONCAT(`first_name`,' ',`last_name`) AS farmername FROM `farmers` WHERE `login_id`='%s'"%(session['lid'])
	res=select(q)
	print(res)
	data['farmer']=res
	# read_csv()
	return render_template("farmerhome.html",data=data)

@farmer.route('/predict_crop',methods=['post','get'])
def predict_crop():
	data={}
	global CROP_VALUE, ARRAY_PREDICTION
	ARRAY_PREDICTION = []
	crop_values = []

	if "btn_predict" in request.form:
		soil_type_id = request.form['character']

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
		# print("hh",result)

	if "btn_predict_value" in request.form:
		try:
			moisture_low = (float(request.form['moisture']) * 10)
			crop_values.append(moisture_low)

			moisture_high = (float(request.form['moisture']) * 10) + 10
			crop_values.append(moisture_high)

			phvalue_low = float(request.form['phvalue'])  - 2
			crop_values.append(phvalue_low)

			phvalue_high = float(request.form['phvalue']) + 4
			crop_values.append(phvalue_high)

			nitrogen_low = (float(request.form['nitrogen']) / 100) - 1
			crop_values.append(nitrogen_low)

			nitrogen_high = (float(request.form['nitrogen']) / 100) + 1
			crop_values.append(nitrogen_high)

			phosphorus_low = (float(request.form['phosphorus']) / 100) - 1 
			crop_values.append(phosphorus_low)

			phosphorus_high = (float(request.form['phosphorus']) / 100) + 1 
			crop_values.append(phosphorus_high)

			potassium_low = (float(request.form['potassium']) / 100) - 1
			crop_values.append(potassium_low)

			potassium_high = (float(request.form['potassium']) / 100) + 1
			crop_values.append(potassium_high)

			temp_high = 38
			crop_values.append(temp_high)

			temp_low = 20
			crop_values.append(temp_low)
			print("test values = ", crop_values)

			result = newpredict_farmer_cropss(crop_values)
			CROP_VALUE = result
			ARRAY_PREDICTION.append(result)			
			NeighborValues(crop_values, 1)
			print("ARRAY_PREDICTION=", ARRAY_PREDICTION)
		
			# result = predict_farmer_crop(crop_values)
			data['result_value'] = ARRAY_PREDICTION
			# print("hh",result)
		except:
			data['result_value'] = "Unkonwn error occured"

	q="SELECT * FROM soil_types"
	res=select(q)
	data['soil_types']=res

	return render_template("farmer_predict_crop.html", data=data)

@farmer.route('/farmer_send_enquiry',methods=['get','post'])
def farmer_send_enquiry():
	data={}
	lid=session['lid']
	
	if 'submit' in request.form:
		fb=request.form['fb']

		q="insert into enquiry values(NULL,(select farmer_id from farmers where login_id='%s'),'%s','pending',NOW())"%(lid,fb)
		res=insert(q)
		return redirect(url_for('farmer.farmer_send_enquiry'))
	q="select * from enquiry where farmer_id=(select farmer_id from farmers where login_id='%s')"%(lid)	
	res=select(q)
	data['enquiry']=res
	print(res)
	return render_template('farmer_send_enquiry.html',data=data)


@farmer.route('/crops',methods=['post','get'])
def crops():
	data = {}
	q = "select DISTINCT(soil_type) from fertilizer_dataset"
	res = select(q)
	data['soils'] = res
	if 'action' in request.args:
		soil = request.args['soil']
		q_set = "select * from fertilizer_dataset where soil_type = '%s'"%soil
		res_set = select(q_set)
		data['set'] =  res_set
	return render_template("farmer_soils.html", data=data)

def read_csv():
	with open('data/fertilizer_prediction.csv', newline='') as csvfile:
		spamreader = csv.reader(csvfile, delimiter=' ', quotechar='|')
		for row in spamreader:
			# print(', '.join(row))
			arr_row = row[0].split(',')
			try:
				q = "INSERT INTO `fertilizer_dataset` VALUES (NULL, '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s', '%s')"%(arr_row[0], arr_row[1], arr_row[2], arr_row[3], arr_row[4], arr_row[5], arr_row[6], arr_row[7], arr_row[8])
				insert(q)
			except:
				print(arr_row)
	pass



@farmer.route('/fertilizer',methods=['post','get'])
def fertilizer():
	data={}
	q="SELECT DISTINCT(soil_type) FROM `fertilizer_dataset`"
	res=select(q)
	data["soils"]=res

	q="SELECT DISTINCT(crop_type) FROM `fertilizer_dataset`"
	res=select(q)
	data["crops"]=res

	if 'btn_predict_value' in request.form:
		soil = request.form['soil_type']
		crop = request.form['crop_type']
		temperature = int(request.form['temperature'])
		humidity = int(request.form['humidity'])
		moisture = int(request.form['moisture'])
		nitrogen = int(request.form['nitrogen'])
		potassium = int(request.form['potassium'])
		phosphorous = int(request.form['phosphorous'])

		q="SELECT * from fertilizer_dataset WHERE soil_type = '%s' AND crop_type = '%s' ORDER BY RAND() LIMIT 1 "%(soil, crop)
		res = select(q)

		#q="SELECT * from fertilizer_dataset WHERE temperature BETWEEN '%s' and '%s' AND humidity BETWEEN '%s' and '%s' AND moisture BETWEEN '%s' and '%s' AND nitrogen BETWEEN '%s' and '%s' AND potassium BETWEEN '%s' and '%s' AND phosphorous BETWEEN '%s' and '%s' AND soil_type = '%s' AND crop_type = '%s' LIMIT 1"%(temperature-10, temperature+10, humidity-10, humidity+10, moisture-10, moisture+10, nitrogen-10, nitrogen+10, potassium-10, potassium+10, phosphorous-10, phosphorous+10, soil, crop)
		#print(q)
		#res = select(q)
		if res:
			data['result']=res

	return render_template("farmer_find_fertilizer.html", data=data)

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



@farmer.route('/framerpredictyiels',methods=['post','get'])
def framerpredictyiels():
	data = {}
	q="select * from state"
	res=select(q)
	data['state']=res

	q="SELECT * FROM  place "
	res=select(q)
	data['place']=res
	q="select * from crop"
	res=select(q)
	data['crop']=res
	import samplecheck 
	if 'btn_predict_value' in request.form:
		state = request.form['state']
		place = request.form['place']
		time = request.form['time']
		crop = request.form['crop']
		acre = request.form['acre']
		val=[]
		train_crops()
		val.append(state)
		val.append(place)
		val.append("2000")
		val.append(time)
		val.append(crop)
		val.append(acre)
		print(val)
		
		res_set=samplecheck.predict_farmer_crop(val)
		print("dfbv",res_set)
		
		data['set'] =  res_set
	return render_template("framerpredictyiels.html", data=data)



@farmer.route('/predictweathaer',methods=['get','post'])
def predictweathaer():
	data={}
	if "submit" in request.form:
		city=request.form['city']
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
		data['predict']=out
		# print(l)
		# print(t)
		# print(i)
		# print(w)
		# print(p)

	return render_template("predictweathaer.html",data=data)

@farmer.route('/getplace', methods=['POST'])
def getplace():
    i=0
    data = request.form['state']
    # print(data)
    q="select * from place where state_id='%s'" %(data)
    res=select(q)
    print(res)

  
   
    ress=[]
    for i in res:
        try:
            print(i,"=============================")
            ress.append(str(i['place_id']))
            ress.append(str(i['place']))
            
        except:
            pass
    ress=','.join(ress)
    print(ress)
    resp = make_response(json.dumps(ress))
    resp.status_code = 200
    resp.headers['Access-Control-Allow-Origin'] = '*'
    return resp

@farmer.route('/getplaces', methods=['POST'])
def getplaces():
    i=0
    data = request.form['state']
    # print(data)
    q="select * from cropyield where state like '%s'" %(data)
    print(q)
    res=select(q)
    print(res)

  
   
    ress=[]
    for i in res:
        try:
            print(i,"=============================")
            ress.append(str(i['place']))
            
        except:
            pass
    ress=','.join(ress)
    print(ress)
    resp = make_response(json.dumps(ress))
    resp.status_code = 200
    resp.headers['Access-Control-Allow-Origin'] = '*'
    return resp

# @student.route('/chatsession/',methods=['get','post'])
# def chatsession():
#     data={}
    
   
#     try:
        
#         message = request.form['state_id']
#         response_text = get_response(message)
#         print(response_text)
        
#     # return jsonify({"status":"success","response":response_text})
#     except Exception as e:
#        pass
#     q=""
#     res=select(q)

  
   
#     ress=[]
#     for i in res:
#         try:
#             print(i,"=============================")
#             ress.append(str(i['sender_id']))
#             ress.append(str(i['receiver_id']))
#             ress.append(str(i['message']))
#             ress.append(str(i['link']))
            
#         except:
#             pass
#     ress=','.join(ress)
#     resp = make_response(json.dumps(ress))

#     # else:
#     #     resp = make_response(jsonify(['naveen','nikhil']))
#     resp.status_code = 200
#     resp.headers['Access-Control-Allow-Origin'] = '*'
#     return resp


@farmer.route('/plotingraph',methods=['get','post'])
def plotingraph():
	data={}
	q="select * from cropyield"
	res=select(q)
	data['val']=res

	q="SELECT distinct(year) as years FROM  cropyield"
	res=select(q)
	data['years']=res
	if "submit" in request.form:

		place=request.form['place']
		year=request.form['year']

		crops=[]
		yields=[]
		q="select * from cropyield where place='%s' and year='%s'" %(place,year)
		res=select(q)
		if res:
			for row in res:
				crops.append(row['crop'])
				yields.append(row['output'])
		 
			print(crops)
			print(yields)
			 
			# plotting the points
			plt.plot(crops, yields)
			 
			# naming the x axis
			plt.xlabel('x - axis')
			# naming the y axis
			plt.ylabel('y - axis')
			 
			# giving a title to my graph
			plt.title('My first graph!')
			 
			# function to show the plot
			plt.show()
	return render_template("plotingraph.html",data=data)