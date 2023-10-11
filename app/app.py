from flask import Flask

app = Flask(__name__)

@app.route('/')
def index():
    return 'Hello, World!'

@app.route('/is_prime/<int:x>', methods=['GET'])
def is_prime(x):
    if x > 1:
        for i in range(2, x):
            if (x % i) == 0:
                return 'False'
        else:
            return 'True'
    else:
        return 'False'



if __name__ == '__main__':
    app.run(debug=True)