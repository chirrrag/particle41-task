from flask import Flask, request, jsonify
from datetime import datetime, timezone

app = Flask(__name__)

@app.route("/", methods=["GET"])
def home():
    timestamp = datetime.now(timezone.utc).isoformat()

    if request.headers.get('X-Forwarded-For'):
        ip = request.headers.get('X-Forwarded-For')
    else:
        ip = request.remote_addr

    return jsonify({
        "timestamp": timestamp,
        "ip": ip
    })

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=80)