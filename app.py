from flask import Flask, request, render_template
import subprocess

app = Flask(__name__)

@app.route("/")
def index():
    cmd = ["hostname"]
    p = subprocess.Popen(cmd, stdout = subprocess.PIPE,
                            stderr=subprocess.PIPE,
                            stdin=subprocess.PIPE)
    out,err = p.communicate()
    return out


if __name__ == '__main__':
    app.run(debug=True, host='0.0.0.0', port=80)
