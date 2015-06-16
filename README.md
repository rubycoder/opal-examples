# opal-examples
Examples with the opal ruby to javascript transpiler.

1. [Hello World](../../tree/1-hello-world-console)

  Execute `rake build` to compile the app.js file, then open index.html in your browser and check the console.

2. [Simple class](../../tree/2-simple-class)

  We have now implemented a simple ruby class which is used to output data to the browser console. We have also included an auto rebuild using rerun. Use `./build` to initiate the build process and open index.html in your browser again and view the console.

3. [Simple Menu](../../tree/3-simple-menu)

  Using the opal-jquery gem we're now demonstrating interaction with elements on the page using Document and Element classes. We added two new gems to the Gemfile so dont forget to run bundler!

4. [Method based Event Handling](../../tree/4-method-based-event-handling)

  With Opal, you can avoid writing anonymous callback functions entirely and just use standard object methods. Here's an example of how to do it.

5. [Http promises](../../tree/5-http-promises)

  Promises are becoming a big thing in the Javascript world, and thankfully they are also a first-class citizen in Opal. The wrapper around jQuery's ajax methods makes good use of them, so that you can easily handle good requests, error conditions, and run code that works no matter what the response. Here's an example

6. [Html5 canvas](../../tree/6-html5-canvas)

  Drawing to the canvas was one of main the reasons I started this series, so here is the first attempt to bring together ruby and the canvas. It's extracted from [work by danxexe](https://github.com/danxexe/opal-canvas-demo)
  
