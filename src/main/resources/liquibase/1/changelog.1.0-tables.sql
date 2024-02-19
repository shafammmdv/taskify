CREATE USER IF NOT EXISTS "SA" SALT 'f56a3236877e9fe6' HASH '0cfaeb0e5a3db02f229f30aeb03694d8f3f73c9653f491cdb70b880bf9b4761a' ADMIN;
CREATE SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_599EA846_E0B0_42FA_B156_96BED0AC055A" START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_77F71861_0586_47F3_8277_51C3C41E23B7" START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_282FDBFE_98A5_4A32_9A94_B82E4173DD7F" START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_C168F0E5_BE41_4483_A837_465B16024012" START WITH 1 BELONGS_TO_TABLE;
CREATE SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_B6EB1AFC_0D6F_4F26_8494_215114225785" START WITH 1 BELONGS_TO_TABLE;
CREATE MEMORY TABLE "PUBLIC"."ORGANIZATION"(
    "ID" BIGINT DEFAULT NEXT VALUE FOR "PUBLIC"."SYSTEM_SEQUENCE_599EA846_E0B0_42FA_B156_96BED0AC055A" NOT NULL NULL_TO_DEFAULT SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_599EA846_E0B0_42FA_B156_96BED0AC055A",
    "ORGANIZATION_ADDRESS" VARCHAR(255),
    "ORGANIZATION_NAME" VARCHAR(255),
    "ORGANIZATION_ID" VARCHAR(255),
    "ORGANIZATION_PHONE_NUMBER" VARCHAR(255)
);
ALTER TABLE "PUBLIC"."ORGANIZATION" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_D" PRIMARY KEY("ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.ORGANIZATION;
CREATE MEMORY TABLE "PUBLIC"."OTP"(
    "ID" BIGINT DEFAULT NEXT VALUE FOR "PUBLIC"."SYSTEM_SEQUENCE_B6EB1AFC_0D6F_4F26_8494_215114225785" NOT NULL NULL_TO_DEFAULT SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_B6EB1AFC_0D6F_4F26_8494_215114225785",
    "DATE_TIME" TIMESTAMP,
    "OTP" VARCHAR(255),
    "OTP_ID" VARCHAR(255),
    "STATUS" VARCHAR(255)
);
ALTER TABLE "PUBLIC"."OTP" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_1" PRIMARY KEY("ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.OTP;
CREATE MEMORY TABLE "PUBLIC"."REL_OTP_USER"(
    "USER_ID" BIGINT,
    "OTP_ID" BIGINT NOT NULL
);
ALTER TABLE "PUBLIC"."REL_OTP_USER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_1B" PRIMARY KEY("OTP_ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.REL_OTP_USER;
CREATE MEMORY TABLE "PUBLIC"."REL_TASK_ORGANIZATION"(
    "ORGANIZATION_ID" BIGINT,
    "TASK_ID" BIGINT NOT NULL
);
ALTER TABLE "PUBLIC"."REL_TASK_ORGANIZATION" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_D7" PRIMARY KEY("TASK_ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.REL_TASK_ORGANIZATION;
CREATE MEMORY TABLE "PUBLIC"."REL_USER_ORGANIZATION"(
    "ORGANIZATION_ID" BIGINT,
    "USER_ID" BIGINT NOT NULL
);
ALTER TABLE "PUBLIC"."REL_USER_ORGANIZATION" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_4" PRIMARY KEY("USER_ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.REL_USER_ORGANIZATION;
CREATE MEMORY TABLE "PUBLIC"."REL_USER_ROLE"(
    "USER_ID" BIGINT NOT NULL,
    "ROLE_ID" BIGINT NOT NULL
);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.REL_USER_ROLE;
CREATE MEMORY TABLE "PUBLIC"."REL_USER_TASK"(
    "USER_ID" BIGINT NOT NULL,
    "TASK_ID" BIGINT NOT NULL
);
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.REL_USER_TASK;
CREATE MEMORY TABLE "PUBLIC"."ROLE"(
    "ID" BIGINT DEFAULT NEXT VALUE FOR "PUBLIC"."SYSTEM_SEQUENCE_C168F0E5_BE41_4483_A837_465B16024012" NOT NULL NULL_TO_DEFAULT SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_C168F0E5_BE41_4483_A837_465B16024012",
    "ROLE_NAME" VARCHAR(255),
    "ROLE_ID" VARCHAR(255)
);
ALTER TABLE "PUBLIC"."ROLE" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_2" PRIMARY KEY("ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.ROLE;
CREATE MEMORY TABLE "PUBLIC"."REL_TASK_USER"(
    "USER_ID" BIGINT,
    "TASK_ID" BIGINT NOT NULL
);
ALTER TABLE "PUBLIC"."REL_TASK_USER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_6" PRIMARY KEY("TASK_ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.REL_TASK_USER;
CREATE MEMORY TABLE "PUBLIC"."TASK"(
    "ID" BIGINT DEFAULT NEXT VALUE FOR "PUBLIC"."SYSTEM_SEQUENCE_77F71861_0586_47F3_8277_51C3C41E23B7" NOT NULL NULL_TO_DEFAULT SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_77F71861_0586_47F3_8277_51C3C41E23B7",
    "TASK_DEADLINE" TIMESTAMP,
    "TASK_DESCRIPTION" VARCHAR(255),
    "TASK_STATUS" VARCHAR(255),
    "TASK_ID" VARCHAR(255),
    "TASK_TITLE" VARCHAR(255)
);
ALTER TABLE "PUBLIC"."TASK" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_27" PRIMARY KEY("ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.TASK;
CREATE MEMORY TABLE "PUBLIC"."USER"(
    "ID" BIGINT DEFAULT NEXT VALUE FOR "PUBLIC"."SYSTEM_SEQUENCE_282FDBFE_98A5_4A32_9A94_B82E4173DD7F" NOT NULL NULL_TO_DEFAULT SEQUENCE "PUBLIC"."SYSTEM_SEQUENCE_282FDBFE_98A5_4A32_9A94_B82E4173DD7F",
    "USER_EMAIL" VARCHAR(255),
    "USER_NAME" VARCHAR(255),
    "USER_PASSWORD" VARCHAR(255),
    "USER_STATUS" VARCHAR(255),
    "USER_SURNAME" VARCHAR(255),
    "USER_ID" VARCHAR(255),
    "USER_USERNAME" VARCHAR(255)
);
ALTER TABLE "PUBLIC"."USER" ADD CONSTRAINT "PUBLIC"."CONSTRAINT_27E" PRIMARY KEY("ID");
-- 0 +/- SELECT COUNT(*) FROM PUBLIC.USER;
ALTER TABLE "PUBLIC"."REL_OTP_USER" ADD CONSTRAINT "PUBLIC"."FKB245WL8LGO1F6OPUC4SJJ0KBC" FOREIGN KEY("USER_ID") REFERENCES "PUBLIC"."USER"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."REL_USER_ORGANIZATION" ADD CONSTRAINT "PUBLIC"."FKJL8Y94CCWWJJ0Y5A8JB8UJVJK" FOREIGN KEY("ORGANIZATION_ID") REFERENCES "PUBLIC"."ORGANIZATION"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."REL_USER_TASK" ADD CONSTRAINT "PUBLIC"."FKD09KFFSPLK45EOB7YH3WST6DF" FOREIGN KEY("TASK_ID") REFERENCES "PUBLIC"."TASK"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."REL_USER_ORGANIZATION" ADD CONSTRAINT "PUBLIC"."FK8RT3U9BJI1RRX0D667LDQ43ES" FOREIGN KEY("USER_ID") REFERENCES "PUBLIC"."USER"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."REL_USER_ROLE" ADD CONSTRAINT "PUBLIC"."FK1UXDUYL9A5VAA3269V64SEYE" FOREIGN KEY("ROLE_ID") REFERENCES "PUBLIC"."ROLE"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."REL_TASK_ORGANIZATION" ADD CONSTRAINT "PUBLIC"."FKQRV0C45TEW8VQB0EHXT4DIIQO" FOREIGN KEY("ORGANIZATION_ID") REFERENCES "PUBLIC"."ORGANIZATION"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."REL_OTP_USER" ADD CONSTRAINT "PUBLIC"."FKJWM98G4KCRAIAPD1LDY5S1CXV" FOREIGN KEY("OTP_ID") REFERENCES "PUBLIC"."OTP"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."REL_TASK_ORGANIZATION" ADD CONSTRAINT "PUBLIC"."FK2A45S9BWNH8TV7BDHGT8FGYRW" FOREIGN KEY("TASK_ID") REFERENCES "PUBLIC"."TASK"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."REL_USER_ROLE" ADD CONSTRAINT "PUBLIC"."FKNEXCJSRTBMNHYYJ4V8RRBHE6I" FOREIGN KEY("USER_ID") REFERENCES "PUBLIC"."USER"("ID") NOCHECK;
ALTER TABLE "PUBLIC"."REL_USER_TASK" ADD CONSTRAINT "PUBLIC"."FKDNMK952U91FR4P18JA07RJTFW" FOREIGN KEY("USER_ID") REFERENCES "PUBLIC"."USER"("ID") NOCHECK;