## Get up and running
### Dependencies (install these if you don't have them already)
* [git](https://git-scm.com/downloads)
* [docker](https://docs.docker.com/get-docker/).

### Get the code
* Pull down the repo: `git clone git@github.com:montague/access_sigchi.git`
  * If that doesn't work, try `git clone https://github.com/montague/access_sigchi.git`
* cd into the repo's root folder: `cd access_sigchi`
* Run `docker build -t access_sigchi .` 
  * This will build your app's docker image, which allows you to develop without having to install all the dependencies locally.
  * This could take a few minutes depending on your download speed. Make some popcorn?

### Run the app
* To run the dev server: `docker run -it -p 3000:3000 -v "$(pwd):/app" access_sigchi`
  * The server will be running here: http://localhost:3000 (click it!)
  * In most cases, when you make a code change, you should be able to simply refresh the browser to see the change.
  * If you add a new ruby class, you'll want to restart your dev server.

### Develop
* Run `docker run -it -v "$(pwd):/app" access_sigchi bash`
* This will open a shell for development inside a running container. Here are some cool things you can do:
  * `ruby bin/rspec` -- run tests!
  * `ruby bin/rails routes` -- see what routes your app understands (useful when adding a new controller or view)
  * `ruby bin/rails about` -- prints information about your application's environment
  * `ruby bin/rails` -- prints all the commands rails understands

