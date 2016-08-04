## How to use this Kata

Your assignment, should you choose to complete it, is called the "Gilded Rose Kata". The goal of the problem is to take an existing codebase, and modify it in two ways:

1. Add new requested features
2. Modify the code to make it more maintainable, that is, as clean and maintainable as possible

You will find a description of the problem and the requested changes below under "Gilded Rose Background and Requirements". You can find the initial code for this problem in numerous programming languages in this folder. Please choose the language of your choice.

When completing the problem, please comply with the following:
* During other parts of the interview process we may ask questions where the goal is to analyze the speed of the answer. This is not one of them. With this problem we are only analyzing the quality of the solution. In this case quality is defined by how clear, maintainable, and extensible the resulting code is. This bullet-point is intended to emphasize quality over speed.
* It is not difficult to find solutions to this problem online. Please refrain from looking at any other solutions or discussion related to this problem.
* Feel free to use standard programming reference materials to complete the project. Please keep track of the references you use and report those with your submission. For example, if you forget how to do bitwise operations in COBOL, you might lookup a StackOverflow post and report this URL with your result: http://stackoverflow.com/questions/9684334/bitwise-logical-operators-in-cobol. Note: Using COBOL bitwise operations is unlikely to result in best answer to this problem!
* When complete, email your submission to employment@scimedsolutions.com.

Let us know (employment@scimedsolutions.com) if you have any questions or issues.

Attribution: This Kata was originally created by Terry Hughes.

## Gilded Rose Background and Requirements

Hi and welcome to team Gilded Rose. We are a small inn with a prime location in a
prominent city run by a friendly innkeeper named Allison. We also buy and sell goods -- only the finest goods.
Unfortunately, our goods are constantly degrading in quality as they approach their sell by date. We
have a system in place that updates our inventory for us. It was developed by a no-nonsense type named
Leeroy, who has moved on to new adventures. Your task is to add the new feature to our system so that
we can begin selling a new category of items. First an introduction to our system:

* All items have a SellIn value which denotes the number of days we have to sell the item
* All items have a Quality value which denotes how valuable the item is
* At the end of each day our system lowers both values for every item

Pretty simple, right? Well this is where it gets interesting:

* Once the sell by date has passed, Quality degrades twice as fast
* The Quality of an item is never negative
* "Aged Brie" actually increases in Quality the older it gets
* The Quality of an item is never more than 50
* "Sulfuras", being a legendary item, never has to be sold or decreases in Quality
* "Backstage passes", like aged brie, increases in Quality as its SellIn value approaches;
	Quality increases by 2 when there are 10 days or less and by 3 when there are 5 days or less but
	Quality drops to 0 after the concert

We have recently signed a supplier of conjured items. This requires an update to our system:

* "Conjured" items degrade in Quality twice as fast as normal items

Just for clarification, an item can never have its Quality increase above 50, however "Sulfuras" is a
legendary item and as such its Quality is 80 and it never alters.
