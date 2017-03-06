# Lesson-1 | Storyboards, TableView & Reusable Cells

For this lesson, we're going to learn how to set up the project and how to use storyboard. To learn how to use storyboard, we're going to set up a TableView. If you need more help on storyboards, [use this tutorial.](https://www.raywenderlich.com/113388/storyboards-tutorial-in-ios-9-part-1)

### Storyboard

Storyboard is a GUI (Graphical User Interface) builder. To build an interface, all a developer would need to do is drag and drop elements, tweak the settings for each element (color, contraints, etc) and the view is finished. Of course this approach doesn't usually allow for complicated views so it is not recommended for experienced developers. 

In order to get started, navigate to `Main.storyboard`. If you are on the Lesson-1 branch, as you should be, you will see 2 views. One is a `navigation controller` and the other is a `view controller`. From our lesson on MVC, you should know that a `view controller` will control the logic for a view. In this case, you are viewing what the view controller will present at load. The view controller will _inherit_ your view controller class. More on that later. 

Notice in the top right corner, ![hide/show buttons](http://imgur.com/a/VjouU) are the hide/show buttons for the navigator, console, and right sidebar respectively. In storyboard, the right button is the most important tool for you. It allows you to change the settings and attributes of an element you select.

Press the right most button to show the right bar if it's not already showing. If you're following along you will use the right bar to contruct your view and follow the next few steps throughout this readme.

**Step 1**
Select the view controller. Change the background of the default view to a color other than white. Select the view and click the Attributes Inspector on the right panel. You should see a backgroungs button with a white color. Press the white color and press Other.. to see other color options

### TableView & Reusable Cells

You know what a tableview is. Everyone with a smartphone as seen something like it. Tableviews are great for showing data on a small screen like an iPhone, but they can be complex. Admittedly, CollectionViews are essentially more versatile tableviews, they are also very complicated and can be quite overwhelming for the new developer while tableviews are relatively straightforward. Here is an image of Reddit Sync which uses a tableview populated by cells.

![sync tableview](http://imgur.com/a/OyHD2)


[For Apple documentation on TableViews, click here.](https://developer.apple.com/library/content/documentation/UserExperience/Conceptual/TableView_iPhone/AboutTableViewsiPhone/AboutTableViewsiPhone.html) 
