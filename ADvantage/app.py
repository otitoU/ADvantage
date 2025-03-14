import base64
from flask import Flask, request, jsonify
from openai import OpenAI
from runwayml import RunwayML
from dotenv import load_dotenv
import json
from flask_cors import CORS
import os

# Load environment variables
load_dotenv()
app = Flask(__name__)

CORS(app, resources={r"/*": {"origins": "*"}}, methods=["GET", "POST", "OPTIONS"], supports_credentials=True)

@app.before_request
def handle_options_request():
    if request.method == "OPTIONS":
        return jsonify({"message": "OK"}), 200



@app.route("/")
def home():
    return "Hello, Otito Created me. Im the server!"

# Initialize OpenAI gptClient
gptClient = OpenAI(api_key=os.getenv("OPENAI_API_KEY"))  # Store API key securely


runMLClient = RunwayML(
    api_key=os.environ.get("RUNWAYML_API_SECRET"),  # This is the default and can be omitted
)

@app.route("/getTextAds", methods=["POST", "GET"])
def getTextAd():
    data = request.json
    user_message = data.get("message", "")

    if not user_message:
        return jsonify({"error": "Message is required"}), 400

    try:
        response = gptClient.chat.completions.create(
            model="gpt-4",  # Use "gpt-3.5-turbo" if needed
            messages=[{"role": "system", "content": "You are a helpful assistant."},
                      {"role": "user", "content": user_message}]
        )
        return jsonify({"response": response.choices[0].message.content})
    
    except Exception as e:
        return jsonify({"error": str(e)}), 500

# HELPER FUNCTIONS
def encode_image_to_base64(image_path):
    """Convert an image file to a base64 string."""
    with open(image_path, "rb") as image_file:
        base64_string = base64.b64encode(image_file.read()).decode("utf-8")
    return f"data:image/jpeg;base64,{base64_string}"


def generate_ad_insights(product_description, ad_tone="Engaging", platform="general"):
    """
    Calls OpenAI GPT-4 to generate **high-quality** ad insights.
    """
    gpt_prompt = f"""
    You are a **senior AI marketing strategist** specializing in **high-converting digital ads**.

    **Business Product:** {product_description}
    **Target Platform:** {platform}
    **Ad Tone:** {ad_tone}

    Return JSON structured as follows:
    {{
      "best_time_to_post": "Recommended posting time with explanation.",
      "ad_copy": "AIDA-style high-converting ad copy.",
      "ad_script": "Video ad script (Hook, Body, CTA).",
      "call_to_actions": ["CTA 1", "CTA 2", "CTA 3"],
      "creative_suggestions": ["Idea 1", "Idea 2", "Idea 3"],
      "platform_strategy": "Detailed strategy for {platform}."
    }}

    **Only return valid JSON. No extra text.**
    """

    response = gptClient.chat.completions.create(
        model="gpt-4-turbo",
        temperature=0.9,
        top_p=0.9,
        max_tokens=1000,
        messages=[
            {"role": "system", "content": "You are an AI advertising strategist."},
            {"role": "user", "content": gpt_prompt}
        ]
    )

    try:
        json_string = response.choices[0].message.content
        ad_data = json.loads(json_string)
        return jsonify(ad_data)  # Send structured JSON
    except Exception as e:
        return jsonify({"error": "Failed to parse AI response", "details": str(e)}), 500


@app.route("/generateTextAds", methods=["POST"])
def generate_ads():
    try:
        data = request.json
        product_description = data.get("product_description")
        ad_tone = data.get("ad_tone", "Engaging")
        platform = data.get("platform", "general")

        print(product_description, ad_tone, platform)

        if not product_description:
            return jsonify({"error": "Product description is required"}), 400

        # Generate ad insights using GPT
        return generate_ad_insights(product_description, ad_tone, platform)

    except Exception as e:
        return jsonify({"error": str(e)}), 500
    

@app.route("/generateImageAds", methods=["POST"])
def generate_image_ad():
    try:
        data = request.json
        product_description = data.get("product_description")
        ad_tone = data.get("ad_tone", "Engaging")
        platform = data.get("platform", "general")

        if not product_description:
            return jsonify({"error": "Product description is required"}), 400

        prompt = f"""
        Create a high-quality marketing image for a product ad.

        Product: {product_description}  
        Ad Style: {ad_tone}  
        Platform: {platform}  

        The image should be **visually appealing, realistic, and well-lit**. It should **not contain any text, captions, labels, or watermarks**. Instead, focus on **clear visuals that communicate the product's features**.

        Use **cinematic lighting, vibrant colors, and high detail** to make it visually engaging.
        """

        # Call OpenAI DALL·E API
        response = gptClient.images.generate(
            model="dall-e-3",  # Use DALL·E 3 for better quality
            prompt=prompt,
            n=1,  # Generate 1 image
            size="1024x1024"
        )

        image_url = response.data[0].url

        return jsonify({
            "image_url": image_url,
            "description": f"A visually striking ad featuring {product_description} with a {ad_tone.lower()} theme, designed for {platform}.",
            "suggested_caption": f"Check out {product_description}! 🚀 Perfect for {platform}. #Trending #AdTech",
            "best_time_to_post": "Weekdays at 7 AM - 9 AM for peak engagement."
        })

    except Exception as e:
        return jsonify({"error": str(e)}), 500


@app.route("/getVidAds", methods=["POST"])
def getVideoAd():
    try:
        # Check if image file is provided
        if "prompt_image" in request.files:
            # Save the uploaded image temporarily
            image_file = request.files["prompt_image"]
            image_path = f"/tmp/{image_file.filename}"
            image_file.save(image_path)

            # Convert image to base64
            print("hereeeeeeee " , str(image_path)[:3])
            encoded_image = encode_image_to_base64(image_path)
            print("encoded_image")


            # Delete the temporary file after encoding
            os.remove(image_path)


        elif "prompt_image_url" in request.json:
            # Use an image URL directly if provided
            encoded_image = request.json["prompt_image_url"]

            # Ensure the URL is in the correct format
            if not encoded_image.startswith("http"):
                return jsonify({"error": "Invalid image URL"}), 400

        else:
            return jsonify({"error": "No image provided"}), 400

        # Get prompt text
        prompt_text = request.form.get("prompt_text") or request.json.get("prompt_text")
        if not prompt_text:
            return jsonify({"error": "Prompt text is required"}), 400


        
        # Generate video using RunwayML
        image_to_video = runMLClient.image_to_video.create(
            model="gen3a_turbo",
            prompt_image=encoded_image,
            prompt_text=prompt_text,
            duration=5
        )

        # Get video URL from the response
        video_url = image_to_video.url if hasattr(image_to_video, 'url') else None
        # video_url = None


        if not video_url:
            return jsonify({"error": "Failed to generate video"}), 500

        return jsonify({"video_url": video_url})

    except Exception as e:
        return jsonify({"error": str(e)}), 500

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=8000)
