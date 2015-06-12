# opal-html5
Experiments with html5 and the opal ruby to javascript compiler.

1. Hello World

Execute `rake build` to compile the app.js file, then open index.html in your browser and check the console.

2. Simple class

We have now implemented a simple ruby class which is used to output data
to the browser console. We have also included an auto rebuild using rerun.
Use `./build` to initiate the build process and open index.html in your
browser again and view the console.

3. Simple Menu

Using the opal-jquery gem we're now demonstrating interaction with elements
on the page using Document and Element classes. We added two new gems to the
Gemfile so dont forget to run bundler!

4. Method based Event Handling Ruby Style

With Opal, you can avoid writing anonymous callback functions entirely and
just use standard object methods. Here's an example of how to do it.
