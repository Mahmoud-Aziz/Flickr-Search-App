# iOS Advanced Assignment

This is a placeholder README file with the instructions for the assignment. We expect you to build your README file.

## Kick off

Since you have the welcome email to be a part of our next advanced iOS course, we're using this assignment to know where exactly you're right now and if you're going to fit in our coming class. 

## Delivering the code

- Fork this repo and select the access level as PRIVATE. This is very important. ***[Check how to do it here](https://docs.gitlab.com/ee////user/project/working_with_projects.html#fork-a-project)****
- Do NOT open a PR to this repository.
- Add the user ***admission@lintschool.com**** as `Reporter` member ***[Check how to do it here](https://docs.gitlab.com/ee/user/project/members/#add-a-user)****
- Once you are finished with the development, send an email to ***admission@lintschool.com**** This helps us to keep track of your progress and move with the process faster.

Please remember to work with small commits. It helps us to see how you improve your code :)

## Instructions

You should build an application using the TheNEXTFlickr API. We have provided an initial application that will help you with fast-tracking app development. It contains the following:

- Class containing baseUrl and API key are needed to fetch contents from [Flick API](https://www.flickr.com/services/api/).
- Basic implementation of a scrollable list to fetch contents and display them in list format.
- Basic JSON parsing to parse server response and populate details.

### UI/UX

We're looking for your design skills here. The app is pretty simple, yet there are many places to go the extra mile and make your project shine! Here's what will it contains: 

- First screen should show a grid of photos with a search bar in the top
    - the grid item size should be good enough to view without going to the details page.
    - the search bar will show a list of previous search terms when clicked.
- Second screen is about the details of the image
### Functionalities

We expect you to implement the above functionalities in the app:

1. ****List current search photos****

* Client API details

* GET "[https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=\\(key)&text=cat&format=json&nojsoncallback=1](https://www.flickr.com/services/rest/?method=flickr.photos.search&api_key=%5C%5C(key)&text=cat&format=json&nojsoncallback=1)"

* Only display images in the horizontal, vertical grid view.

* Use the parameter page to change the list's page.

* Implement the paging mechanism to load a list of images as the user scrolls down the list.

* Cache images to make scrolling smooth.

* Search bar should cache search terms, display a list of previous searches when needed. It will also have a clear button for an easy new search experience. 

2. ****Display the details of the image****

* Client API details

* GET "[https://www.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=94b0a1ad9d4f1aebf9f2f2c006fb4c65&photo_id=\\(image_id)&format=json&nojsoncallback=1](https://www.flickr.com/services/rest/?method=flickr.photos.getSizes&api_key=94b0a1ad9d4f1aebf9f2f2c006fb4c65&photo_id=%5C%5C(image_id)&format=json&nojsoncallback=1)"

* Allow user to decide which size to load. 

* Cache image when needed in order to improve app UX.

* Animation is not necessary.

* Show the following:

* The image

* Title

* Size

* Date

* Source/user posted it


### Additional Requirements And Restrictions

We expect you to follow these additional requirements and restrictions, as they will be part of how we evaluate your assignment:

1. Provide Unit Tests. This is very important for us to evaluate your level of seniority, so please spare some time to spend on developing Unit Tests.

2. 3rd party libraries are allowed (except for the rating view). However, do not use any Alpha version of libraries.

3. This is not an ordinary assignment. If you notice any strange behavior, you are free to make decisions regarding the implementation or take things out of scope, as long as you can justify your decision.

4. Provide a README.md explaining your approach, including the image caching and the rating view implementation, and any other vital decisions or assumptions you made during development. Also, list all the 3rd party libraries used and the reason why.

5. You should follow the layouts provided to develop the functionalities.

6. The assignment code has to be delivered along with the git repository (.git folder). We want to see your progress. We require a cloud-hosted repository on Gitlab, which **MUST** be PRIVATE.

7. ****Do not open PRs to the main repository.****

8. You are free to handle additional requirements, which will be part of how we evaluate your work.

7. The application should be developed in portrait mode only.

9. Minimum Supported versions:

* iOS - 14.0 +

10. Do not use any hybrid solutions, such as Reactive Native or Flutter.
