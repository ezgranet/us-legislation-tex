# us-legislation-tex
LaTeX resources for typesetting American Bills and Acts (for advocacy or Model Congress)
## Introduction
There are many reasons to draft mock American legislation, from lobbying for law reform to teaching civics through a Model Congress.  In all contexts, what is important is that the draft look professional and serious, so people can focus on the content rather than the presentation.  This repository contains templates for drafting a _bill_ and an _Act_, in accordance with the formatting generally used by the United States Congress.  
## Typeface Requirements
There are four typefaces used in these templates.  One, TeX Gyre ScholaX (a facsimile of New Century Schoolbook)  is already used in the LaTeX distribution, and another, Times New Roman, is almost certainly already on your computer.  The third is Frederick Text, a libre clone of Goudy Text MT Std, which I have included with this repo.

The fourth, however, is trickier Regrettably, Congress insists on using De Vinne, a proprietary font which I cannot distribute, as part of its bills.  (There are copies on the internet of a clone called 'DeVine' (one 'n'), but I have not been able to verify if this is a legal facisimile or an illegal pirate typeface)   You could almost certainly get away with just using Century (or Tex Gyre Schola) in place of De Vinne, but for the sake of accuracy, the classes are set to use this typeface.  There is no obligation to use it though, and you are welcome to change the classes however you like.

## Usage

The classes are very very simple to use.  First, fill in the variables, defined in the `$-variables.tex` files in each folder.  Then, write out your law, making sure to use, for sectioning the `lawsec` commands in lieu of the standard LaTeX sectioning commands.



## A Salubrious Reminder
Remember, you can always tell an acts or bill is real because there will be 1) the GPO's seal of authenticity on the printed document and 2) the PDF will have a digital certifiation attesting its genuineness which can be viewed in _inter alia_ Adobe Reader.  Documents produced with these templates will **NEVER** have these indicia, and thus it is clear to all that they are mock bills.
