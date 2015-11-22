# Instructions for running the script:
There is only a single script to run the entire data cleaning/processing pipeline.

The script follows the following workflow:
* Looks for data files and loads if necessary
* Extracts and combines Training and Test data
* Assigns variable names to columns from dataset specification
* Cleans up temporary files
* Renames columns with more descriptive variable names
* Computes means for each varible by subject and activity
