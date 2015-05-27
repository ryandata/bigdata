lines = LOAD 's3://bigdatabucket123/shakespeare.txt' AS (line:chararray);
words = FOREACH lines GENERATE FLATTEN(TOKENIZE(line)) as word;
grouped = GROUP words BY word;
wordcount = FOREACH grouped GENERATE group, COUNT(words);
STORE wordcount into '/user/hue/pig/pig_wordcount' ;
