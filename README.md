"# image-describer" 
Image Describer — AI-powered Image Description Service
Overview

Image Describer is a Spring Boot based application that uses Google Gemini (or a compatible multimodal AI model) to analyze images and automatically generate human-readable descriptions and summaries. Simply upload an image (JPEG/PNG, etc.), and the service returns a structured, concise description — useful for accessibility, content summarization, metadata generation, or quick image reviews.

Features

Upload images via a clean HTML/JSP front-end.

Seamlessly convert and send images + prompt to Gemini.

Receive bullet-point + paragraph-style descriptions of image content.

Handles JPEG, PNG (and other standard) image formats.

Returns structured text output suitable for further processing.

Requirements

Java 17+ (or your project’s Java version)

Spring Boot (2.x or 3.x)

Maven or Gradle for dependencies

Valid Gemini API key / credentials

Internet access to call Gemini vision endpoint

Setup & Usage

Clone the repository

git clone https://github.com/saisatishchandra/image-describer.git
cd image-describer


Configure Your API Key

Add your Gemini API key to application.properties (or environment variable)

Example:

gemini.api.key=YOUR_API_KEY_HERE


Build and Run
Using Maven:

mvn clean install
mvn spring-boot:run


Or, using Gradle:

gradle build
gradle bootRun


Access the Application

Open your browser and go to http://localhost:8080/

Upload an image and hit submit — the generated description will appear on screen

Sample Output

Input: Photo of a street with buildings, cars and people walking

Output (example):

A busy urban street with multiple cars parked and moving.

Tall buildings with glass windows line the road.

Several pedestrians walking on the sidewalks; one person carrying a backpack.

Overhead streetlamps and signboards visible.

The AI summarizes visible elements clearly and concisely.