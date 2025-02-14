from flask import Flask, jsonify
from flask_cors import CORS
from flasgger import Swagger, swag_from
from mock_data import stocks
import random

app = Flask(__name__)
CORS(app)  # Enable CORS for all routes

# Configure Swagger
swagger_config = {
    "headers": [],
    "specs": [
        {
            "endpoint": 'apispec',
            "route": '/apispec.json',
            "rule_filter": lambda rule: True,
            "model_filter": lambda tag: True,
        }
    ],
    "static_url_path": "/flasgger_static",
    "swagger_ui": True,
    "specs_route": "/docs"
}

swagger = Swagger(app, config=swagger_config)

@app.route('/stocks', methods=['GET'])
@swag_from({
    'responses': {
        200: {
            'description': 'List of stocks with current prices',
            'schema': {
                'type': 'array',
                'items': {
                    'type': 'object',
                    'properties': {
                        'name': {'type': 'string', 'description': 'Full name of the restaurant stock'},
                        'shortName': {'type': 'string', 'description': 'Stock ticker symbol'},
                        'price': {'type': 'number', 'description': 'Current stock price'},
                        'openPrice': {'type': 'number', 'description': 'Market open price'},
                        'priceChange': {'type': 'number', 'description': 'Absolute price change since market open'},
                        'percentChange': {'type': 'number', 'description': 'Percentage change since market open'},
                        'trendImage': {'type': 'string', 'description': 'SF Symbol name for trend visualization'}
                    }
                }
            }
        }
    },
    'summary': 'Returns list of restaurant stocks',
    'description': 'Get a list of restaurant stocks with simulated price changes relative to market open'
})
def get_stocks():
    # Simulate changing stock prices
    for stock in stocks:
        change = round(random.uniform(-0.2, 0.2), 2)  # Random price change
        stock["price"] = round(stock["price"] + change, 2)
        stock["priceChange"] = round(stock["price"] - stock["openPrice"], 2)
        stock["percentChange"] = round((stock["priceChange"] / stock["openPrice"]) * 100, 2)
        stock["trendImage"] = "chart.line.uptrend.xyaxis" if stock["priceChange"] >= 0 else "chart.line.downtrend.xyaxis"

    return jsonify(stocks)

if __name__ == '__main__':
    app.run(debug=True, port=5000)