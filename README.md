# SAS-Data-Manipulation
improving my skills

Some codes to manipulate data and modeling tables:

I put the data in my Google Drive for anyone could pratice:
https://drive.google.com/drive/folders/1MOGO2c109m0ISNQM1uSF_1YfPuBSGXPJ?usp=sharing


In SAS Studio you can run this program:

/***********************************************/
/* In the line of code below, replace FILEPATH */
/* with the path to your EPG2V2/data folder    */
/***********************************************/

%let path=s:/workshop/EPG2V2/data;

/**********************************************/
/* DO NOT EDIT THE CODE BELOW                 */
/**********************************************/

libname PG2 "&path";


