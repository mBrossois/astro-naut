CREATE TABLE `users_sessions` (
	`_order` integer NOT NULL,
	`_parent_id` integer NOT NULL,
	`id` text PRIMARY KEY NOT NULL,
	`created_at` text,
	`expires_at` text NOT NULL,
	FOREIGN KEY (`_parent_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
INSERT INTO users_sessions VALUES(1,2,'573ff614-7fd5-468f-8627-99ed6772a037','2026-03-03T14:19:38.112Z','2026-03-03T16:19:38.112Z');
INSERT INTO users_sessions VALUES(1,1,'6f2a63e3-e8f3-44a1-813e-a7c7d682db2a','2026-03-06T14:16:30.078Z','2026-03-06T16:16:30.078Z');
CREATE TABLE `users` (
	`id` integer PRIMARY KEY NOT NULL,
	`roles` text DEFAULT '["readOnly"]' NOT NULL,
	`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`email` text NOT NULL,
	`reset_password_token` text,
	`reset_password_expiration` text,
	`salt` text,
	`hash` text,
	`login_attempts` numeric DEFAULT 0,
	`lock_until` text
);
INSERT INTO users VALUES(1,'admin','2026-03-03T11:19:36.753Z','2026-03-03T11:19:36.753Z','mark.dnb@live.nl',NULL,NULL,'d4d36d6a82a9cbdc06530ada0146d43bf0fcc5bd4a9e14d657c2d04d9a90f1d8','b0022e1ee9aa9997ad6c073ebd43c1fafd09cbc8703193df89b8cb4a8e988592995a3626dca7e2606bfb65f9ff268566f838a7d7663e27ca32783d11e7138d3385bda7c68a47e4cf45ccf40adab4ff6fbab16daca32a0fd9898907af77878fc8054adad7d4d6eb332fc90da2585c1a98a4a899bb7390b2614037ef51a9e97f08147ddb7f1b0a79a1b178c7ae7ce97808789e78e854c5dc9b1e6eb505276b1ce23060697dfcc7cb70ee40c2764243f38d5e45f172ff93caae8a2ef11aa4cbd898c45266d36d50ecb378a78f7816b2e40b3e7ba228f6d2083e037008e0641c5e6c0b97166be5554f44ab8882902af0884cddb7060c10d975a0d8e621973499dd5f648406c075e2b04d69b3f798bae7c950bf54b1ebe2cab612ec52d6b356862c5e8ef8ca1b1f42cc0797e7be2569dfcfbb344b50228789693958bdcc11f205aa6fc1ebe1cfb7c01b613b05d775c463619bf1c2b5eb2ffcd70ebe2060c88d3fbc438855b7018dc1f077ba8050fe1822d98a911826527d450088e59705df04e139f55ef07d795f433a8eed4de0c2acb2641e60656e48e176e748ab3cfdda8b8337c94870f97a4449d6bdb203639e5c5aefeb471391df0440dd85e51eab75ff98e533844b771803db3f092d106951e87f324f8c9b05b8ae4c1472e30d29876cad99eb7f425eec3c2d9b90e9686000faea884911ae668911c9f36478ff5c923fe4de4c',0,NULL);
INSERT INTO users VALUES(2,'editor','2026-03-03T14:19:16.369Z','2026-03-03T14:19:16.369Z','nothing@nothing.com',NULL,NULL,'9d1271d3b84a6fe90643f4df003451811f33680e310d0c6547caf7221293ee07','ccbeafb204078b1c396a0559e44a6ea893775ed8db2f5653cea84b505f1f43c62285b37a26370af72280cfa1325e719dc3085378b71c3980d32b1fb0b2553635a595eebec5a35f43be6b46812d04efdeb281b7acdc5101fc67898b10ee9823935488056ee5a408901de83a9518939d0d0f53fe819489a1cddcf1f4e856c5b5623f38b863212f02fff79d40aa5f2eed5f5f0a5393f1db648276ebc25f377f1016f639fb71c37b1a19b85e8c387b5acc773b38ec5915607bccf3c7d5f6c5dcdc4bbe5923671f916edb19f823028f5172fd2eeb43bd6f13b4ba0502667220ddb4707de28d2a61dcaa55a058ddcb534e97ab871a18f59929319feb9ff7974d844eddfe24fbe3193bb92732355fdc575ac5155086924d4f3d97cd7cf190a83969c5d15bd4bbca31fb948d4aa423d1d779221ce7dfb28d6e37297201aeac1ad139b90bb5ad3c28d28917d634197e9eb89b6c0498ec719e7da9d864e092c80ada80cb249327d289f8200dd6f32fdaeb801215f2d94c7cbb9f568a2407333249b5b7bfed1fd1d2ff59dbd5035f87970a987eaa81ea60f44eb0fbc3738a2f815dc3369f9592cd83dfcb3f8020408a4b5b76759d29c02f5e3b8de46acf12321af3b85230136ab74bd2cf489395256a13798a8378056c7d9a631b0eac3fa256828c2d22dcbab811ffb47ff53de90d1ea01b34885291b0b32dd347ddd5b879cd6403969c8cd1',0,NULL);
CREATE TABLE `_users_v_version_sessions` (
	`_order` integer NOT NULL,
	`_parent_id` integer NOT NULL,
	`id` integer PRIMARY KEY NOT NULL,
	`_uuid` text NOT NULL,
	`created_at` text,
	`expires_at` text NOT NULL,
	FOREIGN KEY (`_parent_id`) REFERENCES `_users_v`(`id`) ON UPDATE no action ON DELETE cascade
);
CREATE TABLE `_users_v` (
	`id` integer PRIMARY KEY NOT NULL,
	`parent_id` integer,
	`version_roles` text DEFAULT '["readOnly"]' NOT NULL,
	`version_updated_at` text,
	`version_created_at` text,
	`version_email` text NOT NULL,
	`version_reset_password_token` text,
	`version_reset_password_expiration` text,
	`version_salt` text,
	`version_hash` text,
	`version_login_attempts` numeric DEFAULT 0,
	`version_lock_until` text,
	`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	FOREIGN KEY (`parent_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE set null
);
INSERT INTO _users_v VALUES(1,1,'admin','2026-03-03T11:19:36.753Z','2026-03-03T11:19:36.753Z','mark.dnb@live.nl',NULL,NULL,'d4d36d6a82a9cbdc06530ada0146d43bf0fcc5bd4a9e14d657c2d04d9a90f1d8','b0022e1ee9aa9997ad6c073ebd43c1fafd09cbc8703193df89b8cb4a8e988592995a3626dca7e2606bfb65f9ff268566f838a7d7663e27ca32783d11e7138d3385bda7c68a47e4cf45ccf40adab4ff6fbab16daca32a0fd9898907af77878fc8054adad7d4d6eb332fc90da2585c1a98a4a899bb7390b2614037ef51a9e97f08147ddb7f1b0a79a1b178c7ae7ce97808789e78e854c5dc9b1e6eb505276b1ce23060697dfcc7cb70ee40c2764243f38d5e45f172ff93caae8a2ef11aa4cbd898c45266d36d50ecb378a78f7816b2e40b3e7ba228f6d2083e037008e0641c5e6c0b97166be5554f44ab8882902af0884cddb7060c10d975a0d8e621973499dd5f648406c075e2b04d69b3f798bae7c950bf54b1ebe2cab612ec52d6b356862c5e8ef8ca1b1f42cc0797e7be2569dfcfbb344b50228789693958bdcc11f205aa6fc1ebe1cfb7c01b613b05d775c463619bf1c2b5eb2ffcd70ebe2060c88d3fbc438855b7018dc1f077ba8050fe1822d98a911826527d450088e59705df04e139f55ef07d795f433a8eed4de0c2acb2641e60656e48e176e748ab3cfdda8b8337c94870f97a4449d6bdb203639e5c5aefeb471391df0440dd85e51eab75ff98e533844b771803db3f092d106951e87f324f8c9b05b8ae4c1472e30d29876cad99eb7f425eec3c2d9b90e9686000faea884911ae668911c9f36478ff5c923fe4de4c',0,NULL,'2026-03-03T11:19:36.758Z','2026-03-03T11:19:36.758Z');
INSERT INTO _users_v VALUES(2,2,'editor','2026-03-03T14:19:16.369Z','2026-03-03T14:19:16.369Z','nothing@nothing.com',NULL,NULL,'9d1271d3b84a6fe90643f4df003451811f33680e310d0c6547caf7221293ee07','ccbeafb204078b1c396a0559e44a6ea893775ed8db2f5653cea84b505f1f43c62285b37a26370af72280cfa1325e719dc3085378b71c3980d32b1fb0b2553635a595eebec5a35f43be6b46812d04efdeb281b7acdc5101fc67898b10ee9823935488056ee5a408901de83a9518939d0d0f53fe819489a1cddcf1f4e856c5b5623f38b863212f02fff79d40aa5f2eed5f5f0a5393f1db648276ebc25f377f1016f639fb71c37b1a19b85e8c387b5acc773b38ec5915607bccf3c7d5f6c5dcdc4bbe5923671f916edb19f823028f5172fd2eeb43bd6f13b4ba0502667220ddb4707de28d2a61dcaa55a058ddcb534e97ab871a18f59929319feb9ff7974d844eddfe24fbe3193bb92732355fdc575ac5155086924d4f3d97cd7cf190a83969c5d15bd4bbca31fb948d4aa423d1d779221ce7dfb28d6e37297201aeac1ad139b90bb5ad3c28d28917d634197e9eb89b6c0498ec719e7da9d864e092c80ada80cb249327d289f8200dd6f32fdaeb801215f2d94c7cbb9f568a2407333249b5b7bfed1fd1d2ff59dbd5035f87970a987eaa81ea60f44eb0fbc3738a2f815dc3369f9592cd83dfcb3f8020408a4b5b76759d29c02f5e3b8de46acf12321af3b85230136ab74bd2cf489395256a13798a8378056c7d9a631b0eac3fa256828c2d22dcbab811ffb47ff53de90d1ea01b34885291b0b32dd347ddd5b879cd6403969c8cd1',0,NULL,'2026-03-03T14:19:16.371Z','2026-03-03T14:19:16.371Z');
CREATE TABLE `media` (
	`id` integer PRIMARY KEY NOT NULL,
	`alt` text NOT NULL,
	`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`url` text,
	`thumbnail_u_r_l` text,
	`filename` text,
	`mime_type` text,
	`filesize` numeric,
	`width` numeric,
	`height` numeric,
	`focal_x` numeric,
	`focal_y` numeric
);
INSERT INTO media VALUES(1,'Space with milkyway','2026-03-03T11:21:21.105Z','2026-03-03T11:21:21.105Z','/api/media/file/Le%20Chat%20Image-1.png',NULL,'Le Chat Image-1.png','image/png',1210664,1392,752,50,50);
INSERT INTO media VALUES(2,'Logo of Payload CMS','2026-03-03T11:25:09.877Z','2026-03-03T11:25:09.877Z','/api/media/file/Payload%C2%AE.png',NULL,'Payload®.png','image/png',102939,474,248,50,50);
INSERT INTO media VALUES(3,'Space with astronaut','2026-03-03T11:26:18.880Z','2026-03-03T11:26:18.879Z','/api/media/file/Male%20Astronaut%20in%20Space-1.webp',NULL,'Male Astronaut in Space-1.webp','image/webp',53956,1363,1158,50,50);
INSERT INTO media VALUES(4,'Auth','2026-03-06T14:18:48.204Z','2026-03-06T14:18:48.203Z','/api/media/file/image-1.png',NULL,'image-1.png','image/png',73931,280,280,50,50);
INSERT INTO media VALUES(6,'3d hexagon','2026-03-06T14:26:58.331Z','2026-03-06T14:26:58.331Z','/api/media/file/hexagon.png',NULL,'hexagon.png','image/png',224588,1004,974,50,50);
CREATE TABLE `entries_tags` (
	`_order` integer NOT NULL,
	`_parent_id` integer NOT NULL,
	`id` text PRIMARY KEY NOT NULL,
	`tag` text,
	FOREIGN KEY (`_parent_id`) REFERENCES `entries`(`id`) ON UPDATE no action ON DELETE cascade
);
INSERT INTO entries_tags VALUES(1,1,'69a6c517bb8dd725f3b8fc10','Web Dev FE');
INSERT INTO entries_tags VALUES(1,2,'69a6c566bb8dd725f3b8fc12','Web Dev FE');
INSERT INTO entries_tags VALUES(1,3,'69aae1fc355e15519e40b7c5','Web Dev FE');
INSERT INTO entries_tags VALUES(1,4,'69aae45ff0ce8de751380d43','3D Printing');
CREATE TABLE `entries` (
	`id` integer PRIMARY KEY NOT NULL,
	`slug` text,
	`title` text,
	`description` text,
	`thumbnail_id` integer,
	`learnings` text,
	`next_steps` text,
	`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`deleted_at` text,
	`_status` text DEFAULT 'draft',
	FOREIGN KEY (`thumbnail_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null
);
INSERT INTO entries VALUES(1,'payload-it','Payload CMS','Learning basics of Payload CMS & building first website',2,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I learned quite a few things today, the most important ones are:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Payload access for fields and collections","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"What globals + blocks are and how to set them up","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"How to set up collections","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Updating the admin Panel Layout 🎨","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":4}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"In general I like the freedom and the more I learn, the more I like it. The step in as a developer is a lot higher then with other tools like Strapi, but you get a lot more freedom in return. We can even update the Admin panel!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Next I would like to learn more about Astro & Svelte, I will set up the next things.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Calling the API and making sure it takes the secret","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Creating the Home, Overview & Entry pages","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Having the pages styled with the data loaded in through the API + Tailwind","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-03T11:25:38.269Z','2026-03-03T11:25:35.226Z',NULL,'published');
INSERT INTO entries VALUES(2,'astro-day','Astro nautilus','Learning basics of Astro & calling API',3,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learned a lot again, about payload & Astro.","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":1,"mode":"normal","style":"","text":"Payload:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"More about how access works","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"How to get the header in the api request","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Astro:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"What server & client islands are","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Everything is statically generated","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dynamic routes are same naming as in Nuxt, but requires getStaticPaths()","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Pagination is done with calling payload & the limit as a query param","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":4}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I want to focus more on payload again:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Preview mode","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Live preview","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Authentication","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-03T14:27:56.082Z','2026-03-03T11:26:55.361Z',NULL,'published');
INSERT INTO entries VALUES(3,'access-stuf','Acces +','More access stuff',4,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learned more about access to payload","type":"text","version":1},{"detail":2,"format":0,"mode":"normal","style":"","text":"\t","type":"tab","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learn more about 3D printing, for building a wine rack in our closet!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-06T14:18:53.165Z','2026-03-04T13:56:49.204Z',NULL,'published');
INSERT INTO entries VALUES(4,'wine-rack-I','Wine rack pt.I','Designed and printed the first components',6,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I learned how to make a hexagon, by turning a cylinder in one. Simply adjust the vertices amount.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"It didn''t fit properly, so I will improve this more!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"3D printing","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Updating the 3D designs to fit the size of the bottle and the bars between should fit in the holes.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"CMS","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Set up mongoDB instead of SQLite, will be able to host it and adjust it better!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-06T14:29:07.353Z','2026-03-06T14:27:01.333Z',NULL,'published');
CREATE TABLE `_entries_v_version_tags` (
	`_order` integer NOT NULL,
	`_parent_id` integer NOT NULL,
	`id` integer PRIMARY KEY NOT NULL,
	`tag` text,
	`_uuid` text,
	FOREIGN KEY (`_parent_id`) REFERENCES `_entries_v`(`id`) ON UPDATE no action ON DELETE cascade
);
INSERT INTO _entries_v_version_tags VALUES(1,1,1,'Web Dev FE','69a6c517bb8dd725f3b8fc10');
INSERT INTO _entries_v_version_tags VALUES(1,2,2,'Web Dev FE','69a6c517bb8dd725f3b8fc10');
INSERT INTO _entries_v_version_tags VALUES(1,3,3,'Web Dev FE','69a6c566bb8dd725f3b8fc12');
INSERT INTO _entries_v_version_tags VALUES(1,4,4,'Web Dev FE','69a6c566bb8dd725f3b8fc12');
INSERT INTO _entries_v_version_tags VALUES(1,5,5,'Web Dev FE','69a6c566bb8dd725f3b8fc12');
INSERT INTO _entries_v_version_tags VALUES(1,6,6,'Web Dev FE','69a6c566bb8dd725f3b8fc12');
INSERT INTO _entries_v_version_tags VALUES(1,7,7,'Web Dev FE','69a6c566bb8dd725f3b8fc12');
INSERT INTO _entries_v_version_tags VALUES(1,8,8,'Web Dev FE','69a6c566bb8dd725f3b8fc12');
INSERT INTO _entries_v_version_tags VALUES(1,11,9,'Web Dev FE','69aae1fc355e15519e40b7c5');
INSERT INTO _entries_v_version_tags VALUES(1,12,10,'Web Dev FE','69aae1fc355e15519e40b7c5');
INSERT INTO _entries_v_version_tags VALUES(1,14,11,'3D Printing','69aae45ff0ce8de751380d43');
INSERT INTO _entries_v_version_tags VALUES(1,15,12,'3D Printing','69aae45ff0ce8de751380d43');
INSERT INTO _entries_v_version_tags VALUES(1,16,13,'3D Printing','69aae45ff0ce8de751380d43');
CREATE TABLE `_entries_v` (
	`id` integer PRIMARY KEY NOT NULL,
	`parent_id` integer,
	`version_slug` text,
	`version_title` text,
	`version_description` text,
	`version_thumbnail_id` integer,
	`version_learnings` text,
	`version_next_steps` text,
	`version_updated_at` text,
	`version_created_at` text,
	`version_deleted_at` text,
	`version__status` text DEFAULT 'draft',
	`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`latest` integer,
	FOREIGN KEY (`parent_id`) REFERENCES `entries`(`id`) ON UPDATE no action ON DELETE set null,
	FOREIGN KEY (`version_thumbnail_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null
);
INSERT INTO _entries_v VALUES(1,1,'payload-it','Payload CMS','Learning basics of Payload CMS & building first website',2,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I learned quite a few things today, the most important ones are:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Payload access for fields and collections","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"What globals + blocks are and how to set them up","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"How to set up collections","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Updating the admin Panel Layout 🎨","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":4}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"In general I like the freedom and the more I learn, the more I like it. The step in as a developer is a lot higher then with other tools like Strapi, but you get a lot more freedom in return. We can even update the Admin panel!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Next I would like to learn more about Astro & Svelte, I will set up the next things.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Calling the API and making sure it takes the secret","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Creating the Home, Overview & Entry pages","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Having the pages styled with the data loaded in through the API + Tailwind","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-03T11:25:35.226Z','2026-03-03T11:25:35.226Z',NULL,'draft','2026-03-03T11:25:35.231Z','2026-03-03T11:25:35.231Z',0);
INSERT INTO _entries_v VALUES(2,1,'payload-it','Payload CMS','Learning basics of Payload CMS & building first website',2,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I learned quite a few things today, the most important ones are:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Payload access for fields and collections","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"What globals + blocks are and how to set them up","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"How to set up collections","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Updating the admin Panel Layout 🎨","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":4}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"In general I like the freedom and the more I learn, the more I like it. The step in as a developer is a lot higher then with other tools like Strapi, but you get a lot more freedom in return. We can even update the Admin panel!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Next I would like to learn more about Astro & Svelte, I will set up the next things.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Calling the API and making sure it takes the secret","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Creating the Home, Overview & Entry pages","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Having the pages styled with the data loaded in through the API + Tailwind","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-03T11:25:38.269Z','2026-03-03T11:25:35.226Z',NULL,'published','2026-03-03T11:25:38.274Z','2026-03-03T11:25:38.274Z',1);
INSERT INTO _entries_v VALUES(3,2,'astro-day','Astro nautilus','Learning basics of Astro & calling API',3,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learned a lot again, about payload & Astro.","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":1,"mode":"normal","style":"","text":"Payload:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"More about how access works","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"How to get the header in the api request","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Astro:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"What server & client islands are","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Everything is statically generated","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dynamic routes are same naming as in Nuxt, but requires getStaticPaths()","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Pagination is done with calling payload & the limit as a query param","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":4}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I want to focus more on payload again:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Preview mode","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Live preview","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Authentication","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-03T11:26:55.361Z','2026-03-03T11:26:55.361Z',NULL,'draft','2026-03-03T11:26:55.364Z','2026-03-03T11:26:55.364Z',0);
INSERT INTO _entries_v VALUES(4,2,'astro-day','Astro nautilus','Learning basics of Astro & calling API',3,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learned a lot again, about payload & Astro.","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":1,"mode":"normal","style":"","text":"Payload:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"More about how access works","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"How to get the header in the api request","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Astro:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"What server & client islands are","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Everything is statically generated","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dynamic routes are same naming as in Nuxt, but requires getStaticPaths()","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Pagination is done with calling payload & the limit as a query param","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":4}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I want to focus more on payload again:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Preview mode","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Live preview","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Authentication","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-03T12:13:19.116Z','2026-03-03T11:26:55.361Z',NULL,'published','2026-03-03T12:13:19.125Z','2026-03-03T12:13:19.125Z',0);
INSERT INTO _entries_v VALUES(5,2,'astro-day','Astro nautilus','Learning basics of Astro & calling API',3,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learned a lot again, about payload & Astro.","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":1,"mode":"normal","style":"","text":"Payload:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"More about how access works","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"How to get the header in the api request","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Astro:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"What server & client islands are","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Everything is statically generated","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dynamic routes are same naming as in Nuxt, but requires getStaticPaths()","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Pagination is done with calling payload & the limit as a query param","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":4}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I want to focus more on payload again:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Preview mode","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Live preview","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Authentication","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-03T14:18:32.538Z','2026-03-03T11:26:55.361Z',NULL,'draft','2026-03-03T14:18:32.538Z','2026-03-03T14:18:32.538Z',0);
INSERT INTO _entries_v VALUES(6,2,'astro-day','Astro nautilus','Learning basics of Astro & calling API',3,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learned a lot again, about payload & Astro.","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":1,"mode":"normal","style":"","text":"Payload:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"More about how access works","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"How to get the header in the api request","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Astro:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"What server & client islands are","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Everything is statically generated","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dynamic routes are same naming as in Nuxt, but requires getStaticPaths()","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Pagination is done with calling payload & the limit as a query param","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":4}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I want to focus more on payload again:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Preview mode","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Live preview","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Authentication","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-03T14:18:39.157Z','2026-03-03T11:26:55.361Z',NULL,'published','2026-03-03T14:18:39.164Z','2026-03-03T14:18:39.164Z',0);
INSERT INTO _entries_v VALUES(7,2,'astro-day','Astro nautilus','Learning basics of Astro & calling API',3,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learned a lot again, about payload & Astro.","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":1,"mode":"normal","style":"","text":"Payload:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"More about how access works","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"How to get the header in the api request","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Astro:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"What server & client islands are","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Everything is statically generated","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dynamic routes are same naming as in Nuxt, but requires getStaticPaths()","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Pagination is done with calling payload & the limit as a query param","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":4}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I want to focus more on payload again:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Preview mode","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Live preview","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Authentication","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-03T14:27:53.078Z','2026-03-03T11:26:55.361Z',NULL,'draft','2026-03-03T14:27:53.078Z','2026-03-03T14:27:53.078Z',0);
INSERT INTO _entries_v VALUES(8,2,'astro-day','Astro nautilus','Learning basics of Astro & calling API',3,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learned a lot again, about payload & Astro.","type":"text","version":1},{"type":"linebreak","version":1},{"detail":0,"format":1,"mode":"normal","style":"","text":"Payload:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"More about how access works","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"How to get the header in the api request","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"Astro:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"What server & client islands are","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Everything is statically generated","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Dynamic routes are same naming as in Nuxt, but requires getStaticPaths()","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Pagination is done with calling payload & the limit as a query param","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":4}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I want to focus more on payload again:","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Preview mode","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":1},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Live preview","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":2},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Authentication","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"listitem","version":1,"value":3}],"direction":null,"format":"","indent":0,"type":"list","version":1,"listType":"bullet","start":1,"tag":"ul"}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-03T14:27:56.082Z','2026-03-03T11:26:55.361Z',NULL,'published','2026-03-03T14:27:56.086Z','2026-03-03T14:27:56.086Z',1);
INSERT INTO _entries_v VALUES(9,3,NULL,'Acces +','More access stuff',NULL,NULL,NULL,'2026-03-04T13:56:49.204Z','2026-03-04T13:56:49.204Z',NULL,'draft','2026-03-04T13:56:49.210Z','2026-03-04T13:56:49.210Z',0);
INSERT INTO _entries_v VALUES(10,3,'access-stuf','Acces +','More access stuff',NULL,NULL,NULL,'2026-03-04T13:56:56.409Z','2026-03-04T13:56:49.204Z',NULL,'draft','2026-03-04T13:56:56.409Z','2026-03-04T13:56:56.409Z',0);
INSERT INTO _entries_v VALUES(11,3,'access-stuf','Acces +','More access stuff',4,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learned more about access to payload","type":"text","version":1},{"detail":2,"format":0,"mode":"normal","style":"","text":"\t","type":"tab","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learn more about 3D printing, for building a wine rack in our closet!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-06T14:18:52.601Z','2026-03-04T13:56:49.204Z',NULL,'draft','2026-03-06T14:18:52.601Z','2026-03-06T14:18:52.601Z',0);
INSERT INTO _entries_v VALUES(12,3,'access-stuf','Acces +','More access stuff',4,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learned more about access to payload","type":"text","version":1},{"detail":2,"format":0,"mode":"normal","style":"","text":"\t","type":"tab","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Learn more about 3D printing, for building a wine rack in our closet!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-06T14:18:53.165Z','2026-03-04T13:56:49.204Z',NULL,'published','2026-03-06T14:18:53.170Z','2026-03-06T14:18:53.170Z',1);
INSERT INTO _entries_v VALUES(13,4,NULL,'Wine rack pt.I','Designed and printed the first components',6,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I learned how to make a hexagon, by turning a cylinder in one. Simply adjust the vertices amount.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"It didn''t fit properly, so I will improve this more!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Updating the designs to fit ","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-06T14:27:01.333Z','2026-03-06T14:27:01.333Z',NULL,'draft','2026-03-06T14:27:01.339Z','2026-03-06T14:27:01.339Z',0);
INSERT INTO _entries_v VALUES(14,4,NULL,'Wine rack pt.I','Designed and printed the first components',6,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I learned how to make a hexagon, by turning a cylinder in one. Simply adjust the vertices amount.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"It didn''t fit properly, so I will improve this more!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"3D printing","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Updating the 3D designs to fit the size of the bottle and the bars between should fit in the holes.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"CMS","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Set up mongoDB instead of SQLite, will be able to host it and adjust it better!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-06T14:28:43.290Z','2026-03-06T14:27:01.333Z',NULL,'draft','2026-03-06T14:28:43.290Z','2026-03-06T14:28:43.290Z',0);
INSERT INTO _entries_v VALUES(15,4,'wine-rack-I','Wine rack pt.I','Designed and printed the first components',6,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I learned how to make a hexagon, by turning a cylinder in one. Simply adjust the vertices amount.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"It didn''t fit properly, so I will improve this more!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"3D printing","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Updating the 3D designs to fit the size of the bottle and the bars between should fit in the holes.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"CMS","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Set up mongoDB instead of SQLite, will be able to host it and adjust it better!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-06T14:29:05.517Z','2026-03-06T14:27:01.333Z',NULL,'draft','2026-03-06T14:29:05.517Z','2026-03-06T14:29:05.517Z',0);
INSERT INTO _entries_v VALUES(16,4,'wine-rack-I','Wine rack pt.I','Designed and printed the first components',6,'{"root":{"children":[{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"I learned how to make a hexagon, by turning a cylinder in one. Simply adjust the vertices amount.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"It didn''t fit properly, so I will improve this more!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','{"root":{"children":[{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"3D printing","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Updating the 3D designs to fit the size of the bottle and the bars between should fit in the holes.","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""},{"children":[{"detail":0,"format":1,"mode":"normal","style":"","text":"CMS","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":1,"textStyle":""},{"children":[{"detail":0,"format":0,"mode":"normal","style":"","text":"Set up mongoDB instead of SQLite, will be able to host it and adjust it better!","type":"text","version":1}],"direction":null,"format":"","indent":0,"type":"paragraph","version":1,"textFormat":0,"textStyle":""}],"direction":null,"format":"","indent":0,"type":"root","version":1}}','2026-03-06T14:29:07.353Z','2026-03-06T14:27:01.333Z',NULL,'published','2026-03-06T14:29:07.358Z','2026-03-06T14:29:07.358Z',1);
CREATE TABLE `pages_blocks_entries_overview_entries` (
	`_order` integer NOT NULL,
	`_parent_id` text NOT NULL,
	`id` text PRIMARY KEY NOT NULL,
	`entry_id` integer,
	FOREIGN KEY (`entry_id`) REFERENCES `entries`(`id`) ON UPDATE no action ON DELETE set null,
	FOREIGN KEY (`_parent_id`) REFERENCES `pages_blocks_entries_overview`(`id`) ON UPDATE no action ON DELETE cascade
);
CREATE TABLE `pages_blocks_entries_overview` (
	`_order` integer NOT NULL,
	`_parent_id` integer NOT NULL,
	`_path` text NOT NULL,
	`id` text PRIMARY KEY NOT NULL,
	`block_name` text,
	FOREIGN KEY (`_parent_id`) REFERENCES `pages`(`id`) ON UPDATE no action ON DELETE cascade
);
CREATE TABLE `pages_blocks_image` (
	`_order` integer NOT NULL,
	`_parent_id` integer NOT NULL,
	`_path` text NOT NULL,
	`id` text PRIMARY KEY NOT NULL,
	`image_id` integer NOT NULL,
	`block_name` text,
	FOREIGN KEY (`image_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null,
	FOREIGN KEY (`_parent_id`) REFERENCES `pages`(`id`) ON UPDATE no action ON DELETE cascade
);
CREATE TABLE `pages_blocks_rich_text` (
	`_order` integer NOT NULL,
	`_parent_id` integer NOT NULL,
	`_path` text NOT NULL,
	`id` text PRIMARY KEY NOT NULL,
	`rich_text` text,
	`block_name` text,
	FOREIGN KEY (`_parent_id`) REFERENCES `pages`(`id`) ON UPDATE no action ON DELETE cascade
);
CREATE TABLE `pages_blocks_content_columns` (
	`_order` integer NOT NULL,
	`_parent_id` text NOT NULL,
	`id` text PRIMARY KEY NOT NULL,
	`size` text DEFAULT 'oneThird',
	FOREIGN KEY (`_parent_id`) REFERENCES `pages_blocks_content`(`id`) ON UPDATE no action ON DELETE cascade
);
CREATE TABLE `pages_blocks_content` (
	`_order` integer NOT NULL,
	`_parent_id` integer NOT NULL,
	`_path` text NOT NULL,
	`id` text PRIMARY KEY NOT NULL,
	`block_name` text,
	FOREIGN KEY (`_parent_id`) REFERENCES `pages`(`id`) ON UPDATE no action ON DELETE cascade
);
CREATE TABLE `pages_blocks_hero` (
	`_order` integer NOT NULL,
	`_parent_id` integer NOT NULL,
	`_path` text NOT NULL,
	`id` text PRIMARY KEY NOT NULL,
	`heading` text NOT NULL,
	`subheading` text,
	`image_id` integer,
	`cta_label` text,
	`cta_url` text,
	`block_name` text,
	FOREIGN KEY (`image_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE set null,
	FOREIGN KEY (`_parent_id`) REFERENCES `pages`(`id`) ON UPDATE no action ON DELETE cascade
);
INSERT INTO pages_blocks_hero VALUES(1,1,'content','69a6c3e8bb8dd725f3b8fc0a','The life of an Astro-naut','Learning everyday as an astro-naut on earth.',1,'See all entries','entries',NULL);
CREATE TABLE `pages` (
	`id` integer PRIMARY KEY NOT NULL,
	`title` text NOT NULL,
	`published_on` text,
	`generate_slug` integer DEFAULT true,
	`slug` text NOT NULL,
	`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL
);
INSERT INTO pages VALUES(1,'Home',NULL,0,'home','2026-03-03T11:21:31.403Z','2026-03-03T11:21:31.402Z');
INSERT INTO pages VALUES(2,'Entries',NULL,0,'entries','2026-03-03T11:22:03.043Z','2026-03-03T11:22:03.043Z');
CREATE TABLE `payload_kv` (
	`id` integer PRIMARY KEY NOT NULL,
	`key` text NOT NULL,
	`data` text NOT NULL
);
CREATE TABLE `payload_locked_documents` (
	`id` integer PRIMARY KEY NOT NULL,
	`global_slug` text,
	`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL
);
CREATE TABLE `payload_preferences` (
	`id` integer PRIMARY KEY NOT NULL,
	`key` text,
	`value` text,
	`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL
);
INSERT INTO payload_preferences VALUES(1,'global-nav','{"editViewType":"default"}','2026-03-03T11:19:39.845Z','2026-03-03T11:19:39.845Z');
INSERT INTO payload_preferences VALUES(2,'collection-pages','{"editViewType":"default","limit":10}','2026-03-04T11:39:45.653Z','2026-03-03T11:19:41.865Z');
INSERT INTO payload_preferences VALUES(3,'collection-media','{"editViewType":"default","limit":10}','2026-03-04T11:38:55.492Z','2026-03-03T11:21:06.078Z');
INSERT INTO payload_preferences VALUES(4,'collection-entries','{"editViewType":"default","limit":10}','2026-03-03T11:23:38.070Z','2026-03-03T11:23:13.834Z');
INSERT INTO payload_preferences VALUES(5,'collection-users','{"editViewType":"default"}','2026-03-03T14:19:05.163Z','2026-03-03T12:39:52.888Z');
INSERT INTO payload_preferences VALUES(6,'nav','{"open":true}','2026-03-03T15:31:38.107Z','2026-03-03T12:39:53.561Z');
INSERT INTO payload_preferences VALUES(7,'collection-entries','{"editViewType":"default","limit":10}','2026-03-03T14:20:17.098Z','2026-03-03T14:19:56.868Z');
INSERT INTO payload_preferences VALUES(8,'global-what','{"editViewType":"default"}','2026-03-03T15:42:53.992Z','2026-03-03T15:42:53.992Z');
INSERT INTO payload_preferences VALUES(9,'collection-crazy','{"editViewType":"default","limit":10}','2026-03-06T14:21:29.591Z','2026-03-03T15:57:18.336Z');
CREATE TABLE `payload_preferences_rels` (
	`id` integer PRIMARY KEY NOT NULL,
	`order` integer,
	`parent_id` integer NOT NULL,
	`path` text NOT NULL,
	`users_id` integer,
	FOREIGN KEY (`parent_id`) REFERENCES `payload_preferences`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`users_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade
);
INSERT INTO payload_preferences_rels VALUES(1,NULL,1,'user',1);
INSERT INTO payload_preferences_rels VALUES(4,NULL,4,'user',1);
INSERT INTO payload_preferences_rels VALUES(7,NULL,5,'user',1);
INSERT INTO payload_preferences_rels VALUES(8,NULL,7,'user',2);
INSERT INTO payload_preferences_rels VALUES(9,NULL,6,'user',1);
INSERT INTO payload_preferences_rels VALUES(10,NULL,8,'user',1);
INSERT INTO payload_preferences_rels VALUES(13,NULL,3,'user',1);
INSERT INTO payload_preferences_rels VALUES(14,NULL,2,'user',1);
INSERT INTO payload_preferences_rels VALUES(15,NULL,9,'user',1);
CREATE TABLE `payload_migrations` (
	`id` integer PRIMARY KEY NOT NULL,
	`name` text,
	`batch` numeric,
	`updated_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL,
	`created_at` text DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ', 'now')) NOT NULL
);
INSERT INTO payload_migrations VALUES(1,'dev',-1,'2026-03-06 14:19:15','2026-03-03T11:19:12.977Z');
CREATE TABLE `nav_items` (
	`_order` integer NOT NULL,
	`_parent_id` integer NOT NULL,
	`id` text PRIMARY KEY NOT NULL,
	`page_id` integer NOT NULL,
	FOREIGN KEY (`page_id`) REFERENCES `pages`(`id`) ON UPDATE no action ON DELETE set null,
	FOREIGN KEY (`_parent_id`) REFERENCES `nav`(`id`) ON UPDATE no action ON DELETE cascade
);
INSERT INTO nav_items VALUES(1,1,'69a6c47abb8dd725f3b8fc0c',1);
INSERT INTO nav_items VALUES(2,1,'69a6c47ebb8dd725f3b8fc0e',2);
CREATE TABLE `nav` (
	`id` integer PRIMARY KEY NOT NULL,
	`updated_at` text,
	`created_at` text
);
INSERT INTO nav VALUES(1,'2026-03-03T11:22:47.496Z','2026-03-03T11:22:47.496Z');
CREATE TABLE IF NOT EXISTS "payload_locked_documents_rels" (
	`id` integer PRIMARY KEY NOT NULL,
	`order` integer,
	`parent_id` integer NOT NULL,
	`path` text NOT NULL,
	`users_id` integer,
	`media_id` integer,
	`entries_id` integer,
	`pages_id` integer,
	FOREIGN KEY (`parent_id`) REFERENCES `payload_locked_documents`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`users_id`) REFERENCES `users`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`media_id`) REFERENCES `media`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`entries_id`) REFERENCES `entries`(`id`) ON UPDATE no action ON DELETE cascade,
	FOREIGN KEY (`pages_id`) REFERENCES `pages`(`id`) ON UPDATE no action ON DELETE cascade
);
CREATE INDEX `users_sessions_order_idx` ON `users_sessions` (`_order`);
CREATE INDEX `users_sessions_parent_id_idx` ON `users_sessions` (`_parent_id`);
CREATE INDEX `users_updated_at_idx` ON `users` (`updated_at`);
CREATE INDEX `users_created_at_idx` ON `users` (`created_at`);
CREATE UNIQUE INDEX `users_email_idx` ON `users` (`email`);
CREATE INDEX `_users_v_version_sessions_order_idx` ON `_users_v_version_sessions` (`_order`);
CREATE INDEX `_users_v_version_sessions_parent_id_idx` ON `_users_v_version_sessions` (`_parent_id`);
CREATE INDEX `_users_v_parent_idx` ON `_users_v` (`parent_id`);
CREATE INDEX `_users_v_version_version_updated_at_idx` ON `_users_v` (`version_updated_at`);
CREATE INDEX `_users_v_version_version_created_at_idx` ON `_users_v` (`version_created_at`);
CREATE INDEX `_users_v_version_version_email_idx` ON `_users_v` (`version_email`);
CREATE INDEX `_users_v_created_at_idx` ON `_users_v` (`created_at`);
CREATE INDEX `_users_v_updated_at_idx` ON `_users_v` (`updated_at`);
CREATE INDEX `media_updated_at_idx` ON `media` (`updated_at`);
CREATE INDEX `media_created_at_idx` ON `media` (`created_at`);
CREATE UNIQUE INDEX `media_filename_idx` ON `media` (`filename`);
CREATE INDEX `entries_tags_order_idx` ON `entries_tags` (`_order`);
CREATE INDEX `entries_tags_parent_id_idx` ON `entries_tags` (`_parent_id`);
CREATE UNIQUE INDEX `entries_slug_idx` ON `entries` (`slug`);
CREATE INDEX `entries_thumbnail_idx` ON `entries` (`thumbnail_id`);
CREATE INDEX `entries_updated_at_idx` ON `entries` (`updated_at`);
CREATE INDEX `entries_created_at_idx` ON `entries` (`created_at`);
CREATE INDEX `entries_deleted_at_idx` ON `entries` (`deleted_at`);
CREATE INDEX `entries__status_idx` ON `entries` (`_status`);
CREATE INDEX `_entries_v_version_tags_order_idx` ON `_entries_v_version_tags` (`_order`);
CREATE INDEX `_entries_v_version_tags_parent_id_idx` ON `_entries_v_version_tags` (`_parent_id`);
CREATE INDEX `_entries_v_parent_idx` ON `_entries_v` (`parent_id`);
CREATE INDEX `_entries_v_version_version_slug_idx` ON `_entries_v` (`version_slug`);
CREATE INDEX `_entries_v_version_version_thumbnail_idx` ON `_entries_v` (`version_thumbnail_id`);
CREATE INDEX `_entries_v_version_version_updated_at_idx` ON `_entries_v` (`version_updated_at`);
CREATE INDEX `_entries_v_version_version_created_at_idx` ON `_entries_v` (`version_created_at`);
CREATE INDEX `_entries_v_version_version_deleted_at_idx` ON `_entries_v` (`version_deleted_at`);
CREATE INDEX `_entries_v_version_version__status_idx` ON `_entries_v` (`version__status`);
CREATE INDEX `_entries_v_created_at_idx` ON `_entries_v` (`created_at`);
CREATE INDEX `_entries_v_updated_at_idx` ON `_entries_v` (`updated_at`);
CREATE INDEX `_entries_v_latest_idx` ON `_entries_v` (`latest`);
CREATE INDEX `pages_blocks_entries_overview_entries_order_idx` ON `pages_blocks_entries_overview_entries` (`_order`);
CREATE INDEX `pages_blocks_entries_overview_entries_parent_id_idx` ON `pages_blocks_entries_overview_entries` (`_parent_id`);
CREATE INDEX `pages_blocks_entries_overview_entries_entry_idx` ON `pages_blocks_entries_overview_entries` (`entry_id`);
CREATE INDEX `pages_blocks_entries_overview_order_idx` ON `pages_blocks_entries_overview` (`_order`);
CREATE INDEX `pages_blocks_entries_overview_parent_id_idx` ON `pages_blocks_entries_overview` (`_parent_id`);
CREATE INDEX `pages_blocks_entries_overview_path_idx` ON `pages_blocks_entries_overview` (`_path`);
CREATE INDEX `pages_blocks_image_order_idx` ON `pages_blocks_image` (`_order`);
CREATE INDEX `pages_blocks_image_parent_id_idx` ON `pages_blocks_image` (`_parent_id`);
CREATE INDEX `pages_blocks_image_path_idx` ON `pages_blocks_image` (`_path`);
CREATE INDEX `pages_blocks_image_image_idx` ON `pages_blocks_image` (`image_id`);
CREATE INDEX `pages_blocks_rich_text_order_idx` ON `pages_blocks_rich_text` (`_order`);
CREATE INDEX `pages_blocks_rich_text_parent_id_idx` ON `pages_blocks_rich_text` (`_parent_id`);
CREATE INDEX `pages_blocks_rich_text_path_idx` ON `pages_blocks_rich_text` (`_path`);
CREATE INDEX `pages_blocks_content_columns_order_idx` ON `pages_blocks_content_columns` (`_order`);
CREATE INDEX `pages_blocks_content_columns_parent_id_idx` ON `pages_blocks_content_columns` (`_parent_id`);
CREATE INDEX `pages_blocks_content_order_idx` ON `pages_blocks_content` (`_order`);
CREATE INDEX `pages_blocks_content_parent_id_idx` ON `pages_blocks_content` (`_parent_id`);
CREATE INDEX `pages_blocks_content_path_idx` ON `pages_blocks_content` (`_path`);
CREATE INDEX `pages_blocks_hero_order_idx` ON `pages_blocks_hero` (`_order`);
CREATE INDEX `pages_blocks_hero_parent_id_idx` ON `pages_blocks_hero` (`_parent_id`);
CREATE INDEX `pages_blocks_hero_path_idx` ON `pages_blocks_hero` (`_path`);
CREATE INDEX `pages_blocks_hero_image_idx` ON `pages_blocks_hero` (`image_id`);
CREATE UNIQUE INDEX `pages_slug_idx` ON `pages` (`slug`);
CREATE INDEX `pages_updated_at_idx` ON `pages` (`updated_at`);
CREATE INDEX `pages_created_at_idx` ON `pages` (`created_at`);
CREATE UNIQUE INDEX `payload_kv_key_idx` ON `payload_kv` (`key`);
CREATE INDEX `payload_locked_documents_global_slug_idx` ON `payload_locked_documents` (`global_slug`);
CREATE INDEX `payload_locked_documents_updated_at_idx` ON `payload_locked_documents` (`updated_at`);
CREATE INDEX `payload_locked_documents_created_at_idx` ON `payload_locked_documents` (`created_at`);
CREATE INDEX `payload_preferences_key_idx` ON `payload_preferences` (`key`);
CREATE INDEX `payload_preferences_updated_at_idx` ON `payload_preferences` (`updated_at`);
CREATE INDEX `payload_preferences_created_at_idx` ON `payload_preferences` (`created_at`);
CREATE INDEX `payload_preferences_rels_order_idx` ON `payload_preferences_rels` (`order`);
CREATE INDEX `payload_preferences_rels_parent_idx` ON `payload_preferences_rels` (`parent_id`);
CREATE INDEX `payload_preferences_rels_path_idx` ON `payload_preferences_rels` (`path`);
CREATE INDEX `payload_preferences_rels_users_id_idx` ON `payload_preferences_rels` (`users_id`);
CREATE INDEX `payload_migrations_updated_at_idx` ON `payload_migrations` (`updated_at`);
CREATE INDEX `payload_migrations_created_at_idx` ON `payload_migrations` (`created_at`);
CREATE INDEX `nav_items_order_idx` ON `nav_items` (`_order`);
CREATE INDEX `nav_items_parent_id_idx` ON `nav_items` (`_parent_id`);
CREATE INDEX `nav_items_page_idx` ON `nav_items` (`page_id`);
CREATE INDEX `payload_locked_documents_rels_order_idx` ON `payload_locked_documents_rels` (`order`);
CREATE INDEX `payload_locked_documents_rels_parent_idx` ON `payload_locked_documents_rels` (`parent_id`);
CREATE INDEX `payload_locked_documents_rels_path_idx` ON `payload_locked_documents_rels` (`path`);
CREATE INDEX `payload_locked_documents_rels_users_id_idx` ON `payload_locked_documents_rels` (`users_id`);
CREATE INDEX `payload_locked_documents_rels_media_id_idx` ON `payload_locked_documents_rels` (`media_id`);
CREATE INDEX `payload_locked_documents_rels_entries_id_idx` ON `payload_locked_documents_rels` (`entries_id`);
CREATE INDEX `payload_locked_documents_rels_pages_id_idx` ON `payload_locked_documents_rels` (`pages_id`);