# Production

[View Production Here](https://fierce-beach-38151.herokuapp.com/)

# How to Use

## View Rankings

You may view the top ten links by going to the root path of the app. It does not update dynamically, so you must refresh the page to view any changes.

## Endpoints

### GET /api/v1/hot_reads

This endpoint will return a string depending on the queried URL's HotReads ranking.

You must pass in a query field titled 'address'. The address must be a valid URL.

If you do not pass in this query or the URL is invalid, you will recieve an error and appropriate error message.

If the URL is one of the top ten links it will return 'hot'. If the URL is the top link, it will return 'top'. If it is not ranked at all, it'll return an empty string.

### POST /api/v1/read_urls

This endpoint is for creating a new URL and/or adding a point to a URL's HotRead ranking.

You must pass in two parameter fields: 'url[address]' and 'read[user_id]'.

* The 'url[address]' field must be a valid URL.

* The 'read[user_id]' corresponds to the user id in the URL Lockbox sister applcation.

# How to Contribute

To contribute to this application, follow these steps:

1) Fork the repo and clone it onto your local computer.

2) Fork the [URL Lockbox repo](https://github.com/AELSchauer/turing-final-assessment-url-lockbox) and clone it onto your local computer.

3) Install the gems for each repo with `bundle install`

4) Startup the HotReads app with `rails server`. It runs on localhost:3001.

5) In a separate terminal window, startup the URL Lockbox app with `rails server`. It runs on localhost:3000.

*If you do not have both applications running simultaneously, URL Lockbox will NOT work!*

6) Start coding! Ensure that any changes to HotReads does not break the functionality in URL Lockbox.

7) Add new or update any necessary model and feature tests for your changes.

* For tests to pass, you *must* ensure that the database only contains the seed data and nothing else.

* Test coverage must be above 90%.

8) Once you're ready to make a PR, run `rubocop` in your terminal and correct any style offenses.

9) In your PR, include a high level summary of what changes you made and why. If your PR requires any changes to the URL Lockbox repo, please include a link to the URL Lockbox PR in your HotReads PR description and add the tag [URL Lockbox Update Required] to the title.

Thank you!

### Using Postman

For the POST endpoint, data must be sent as params. Here is how you can test this functionality using Postman.

![](http://i.imgur.com/dHiVxFj.png)

