## Get up and running
### Dependencies (install these if you don't have them already)
* [git](https://git-scm.com/downloads)
* [docker](https://docs.docker.com/get-docker/).

### Get the code
* pull down the repo: `git clone git@github.com:montague/access_sigchi.git`
* cd into the repo's root folder: `cd access_sigchi`
* run `docker build -t access_sigchi .` (this may take a minute)

### Run the app
* to run the dev server: `docker run -it -p 3000:3000 -v $(pwd):/app access_sigchi`
  * the server will be running here: http://localhost:3000 
* to run the test suite: `docker run -it --rm access_sigchi bundle exec rspec`

