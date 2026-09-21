from flask import Flask, jsonify

app = Flask(__name__)


@app.route("/health", methods=["GET"])
def health():
    return jsonify({
        "status": "UP and Running"
    }), 200


@app.route("/api/payment", methods=["GET"])
def payment():
    return jsonify({
        "message": "Payment service v2 is running"
    }), 200


if __name__ == "__main__":
    app.run(
        host="0.0.0.0",
        port=8080
    )
