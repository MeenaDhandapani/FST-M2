-- Load the input file
inputFile = LOAD 'hdfs:///user/meena/input.txt' AS (line:chararray);
-- Tokenize the lines into words (MAP)
words = FOREACH inputFile GENERATE FLATTEN(TOKENIZE(line)) as word;
-- Group the data
grpd = GROUP words BY word;
-- Count the total number of words (REDUCE)
totalCount = FOREACH grpd GENERATE $0, COUNT($1);
-- Store the output in HDFS
STORE totalCount INTO 'hdfs:///user/meena/pigOutput';
