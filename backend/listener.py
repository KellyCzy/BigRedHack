import json
import speech_test
import nlp
from flask import Flask, request

app = Flask(__name__)

app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False
app.config['SQLALCHEMY_ECHO'] = True

@app.route('/', methods= ['POST'])
def showOff():
    body = json.loads(request.data)
    filename = body.get("filename")
    address = speech_test.google_transcribe(filename)
    category, keyword, result = nlp.language_process(address)

    return json.dumps({'success': True, 'data': {"category": category, "keyword": 
    keyword, "result": result}}), 201

# @app.route('/api/users/', methods= ['POST'])
# def create_user():
#     user_body = json.loads(request.data)
#     check = User.query.filter_by(email=user_body.get('email')).first()
#     if check is None:
#         user = User(
#             password = user_body.get('password'),
#             email = user_body.get('email'),
#             username = user_body.get('username'),
#             picture = user_body.get('picture')
#         )
#         db.session.add(user)
#         db.session.commit()
#         return json.dumps({'success': True, 'data': user.serialize()}), 201
#     return json.dumps({'success': False, 'error': 'USER ALREADY EXISTS!'}), 406

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)