# Dog Breed Image Fetcher

## Overview

This project is a coding challenge designed to assess technical skills in Ruby on Rails, front-end frameworks,
and asynchronous form handling. The goal is to create a simple web form that allows users to input a dog breed
and, upon submission, fetch and display an image of the specified breed from the Dog API.

## Table of Contents

- [Objective](#objective)
- [Challenge Description](#challenge-description)
- [Technologies Used](#technologies-used)
- [Hosted App](#hosted-app)
- [Setup Instructions](#setup-instructions)
- [Usage](#usage)
- [Deployment](#deployment)
- [Improvement Areas](#improvement-areas)

## Objective

The objective of this coding challenge is to demonstrate proficiency in Ruby on Rails, front-end development
using Bootstrap or Tailwind, and asynchronous form handling. The challenge provides an opportunity to showcase
coding style, problem-solving skills, and the ability to integrate with external APIs.

## Challenge Description

Design a web form with the following features:
- A text input field labeled "Breed".
- A button to submit the form.
- On form submission, fetch an image of the specified dog breed from the Dog API.
- Display the fetched image and the breed name to the right of the form.

## Technologies Used

- **Backend:** Ruby on Rails
- **Frontend:** Tailwind, Hotwire
- **API:** [Dog API](https://dog.ceo/dog-api/)
- **Version Control:** Git
- **Hosting:** [Railway](https://railway.app/)

## Hosted App

https://doggie-production.up.railway.app/

## Setup Instructions

1. **Clone the Repository:**
   ```bash
   git clone https://github.com/RajRoR/doggie.git
   cd doggie

2. **Install Dependencies**
   ```bash
   bundle install
   ```

3. **Start Server**
   ```bash
   ./bin/dev
   ```
4. Access the Application:
   Open your browser and navigate to http://localhost:3000


## Usage

1. Enter the name of the dog breed in the "Breed" input field. _E.g.: African, French Bulldog, Husky, etc._
2. Click the "Surprise Me!" button.
3. An image of the specified dog breed will be displayed to the right of the form, along with the breed name.

## Deployment

The CI/CD pipeline is set up for the repo. It verify each commit with various checks.
It automatically deploys whenever a new commit is pushed or merged into the `main` branch.

## Improvement Areas

1. **Better Responsive Design**
2. **Fuzzy-Matching for Input**
   - Implement fuzzy-matching to make the system more intelligent and improve user experience.
3. **Beautify HTML Validation Messages**
   - Enhance HTML validation messages or replace them with custom designs.
4. **Dynamic Image Dimensions**
   - Handling of image dimensions, especially for images with non-standard dimensions.
5. **Introduce Database and Table for Breeds**
   - Create a database and table to store and query available breeds.
   - Develop a rake task to fetch and store/update the table periodically or as needed using data
     from the [Breeds List](https://dog.ceo/api/breeds/list) API.
   - Add a cron job to run this rake task periodically.
   - Use the breeds list data to validate input breed values before making the API call.
6. **Use Custom Validators, Concerns, etc.**

