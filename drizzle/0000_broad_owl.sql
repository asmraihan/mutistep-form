DO $$ BEGIN
 CREATE TYPE "public"."role" AS ENUM('Manager', 'Admin');
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
--> statement-breakpoint
CREATE TABLE IF NOT EXISTS "user" (
	"id" text PRIMARY KEY NOT NULL,
	"firstName" text,
	"lastName" text,
	"location" text,
	"email" text NOT NULL,
	"image" text DEFAULT 'no-image',
	"password" text,
	"role" "role" DEFAULT 'Manager' NOT NULL
);
