# Windows CMD Files Management


This repository is designed to handle file management tasks when working with large sets of files and deeply nested subfolders. Since OneDrive supports a maximum destination path length of 400 characters
and Windows can only read file paths up to 260 characters, issues can occur during file transfers. To address this, the repository provides tools to check the longest destination path of a specified folder 
and identify files that exist in location A but not in location B. The results are then saved in a .txt file for easy reference. 

1. Copy and paste the code into a text file, or download the provided .bat file.
2. If you saved it as a text file, rename it and put the file extension ".bat".
3. Right-click the .bat file and click Run as administrator.
