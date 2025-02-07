Ruby OpenAI ChatGPT-4o App

Overview

This is a simple Ruby application that connects to OpenAI's API and utilizes the ChatGPT-4o model to generate responses based on user input, it also gives the option to send the response via email having setup a valid mail account.

Features

Connects to OpenAI's API

Sends prompts to ChatGPT-4o

Displays AI-generated responses or sends them as emails

Simple display and navigation

Prerequisites

Ensure you have the following installed:

Ruby 3.3.5

Bundler (gem install bundler)

An OpenAI API key

A valid email account and an app password

Installation

Clone the repository:

git clone https://github.com/MoralesWilll/small_chat.git
cd small_chat

Install dependencies:

bundle install

Set up environment variables:

Create a .env file in the root directory:

touch .env

Fill the fields in .env.erb with your variables 

Usage

Run the Ruby app with bin/dev

navigate to the localhost:3000

Example

You: Hello, how are you?
AI: I'm just a bot, but I'm here to help! How can I assist you today?

Contributing

Feel free to fork this repository and submit pull requests with improvements!

License

This project is licensed under the MIT License.

Author
MoralesWilll
