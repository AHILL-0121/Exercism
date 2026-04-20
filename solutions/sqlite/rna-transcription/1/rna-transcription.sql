-- Schema: CREATE TABLE "rna-transcription" ("dna" TEXT, "result" TEXT);
-- Task: update the rna-transcription table and set the result based on the dna field.
UPDATE "rna-transcription" SET result = REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dna,'G','x'),'C','G'),'x','C'),'T','y'),'A','U'),'y','A');