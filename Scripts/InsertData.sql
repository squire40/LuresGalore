USE LuresGalore
Go

begin tran

INSERT INTO Category (Name)
VALUES
( 'Saltwater Lures'),
( 'Castable Umbrella Wings'),
( 'Lure Kits');

INSERT INTO Price(Amount)
VALUES
(5),
(10),
(15),
(20),
(25);


INSERT INTO Product(Name, Description, PriceId)
VALUES
('Offshore Angler Shrimp','To realize the Offshore Angler Shrimp''s true potential, saltwater anglers should fish this lure with a long cast. Let it sink about four seconds, then use a slow retrieve with frequent small jerks to make the Shrimp "hop." A strike-enticing rattle only adds to this Shrimp''s allure.',1),
('Offshore Angler Squid' ,'The Offshore Angler Squid has the lifelike appearance of a real squid, a delicious treat preferred by many saltwater predators. Contributing to this lifelike appearance are molded-in eyes plus undulating tentacles that catch currents to promote motion and flail wildly on the fall, commanding the attention of any and all hungry predators in the area.',1),
('Livetarget Shrimp','Many saltwater predators find it impossible to resist a live shrimp, making it the single most important forage for all saltwater game fish. This pre-rigged LIVETARGET Shrimp mimics a live shrimp perfectly but is designed to be even more effective. The lifelike body is infused with real shrimp while the rear swimming legs create the illusion that the bait is propelling itself forward, just like a live shrimp. This slow-sinking soft bait is ideal for most saltwater predators, including sea trout, redfish, and striped bass.',1),
('YUM® YUMbrella® Ultralight Tripod Money Fry Kit', 'The YUM YUMbrella Ultralight Tripod Money Fry Kit comes with swimming-motion Money Fry soft plastics to create a baitschool look in a package that’s light enough to be cast on any type of equipment. This 3-wire YUMbrella Kit comes with three 2" supple soft plastic Money Fry that swim—even in super-slow motion—and are matched with durable 1/8-oz. jigheads with size 2 hooks. Heat-tempered stainless steel “super wire” is treated for strength and memory. Snaps and swivels are top-quality, too, eliminating the likelihood of mechanical failures.', 1),
('YUM® YUMbrella® Accessory Kit','The YUM YUMbrella castable rig is great for attracting multiple fish with ease and the YUMbrella Accessory Kit makes it easy to rig. This popular kit includes four each of the 3-1/2" Money Minnows and the 3/16 oz. Money Heads to rig them on. There’s also a 5" Money Minnow softbait and a 1/4-oz. Money Head with a 5/0 hook. Don’t miss out on the action. Keep your YUMbrella Rig ready to go with the YUMbrella Accessory Kit. Color: Pearl. Made in USA.',1),   
('BOOYAH® Boo Rig',	'The BOOYAH Boo Rig will change the way you fish. The Boo Rig sports a flexible lure arm that lets you use crankbaits and other lures on a castable umbrella rig. 4 stiff outer arms are outfitted with willow leaf blades. Fish this rig shallow or deep; match it with any lure. Cast lures farther and work them at any depth, while presenting the "bait chase" appearance that makes castable umbrella rigs so effective.',1),
('Blue Fox Glow Skirt Spinner Kit','For greater lift, the Blue Fox® Glow Skirt Spinner Kit comes rigged with a Colorado-style chrome spinner blade arm on one jig, and can be interchanged with the other 4 jigs. A glow-in-the-dark skirt with flashabou fibers reflects light for added attraction. Other features include a tough VMC® hook of premium, high-carbon steel that is super-sharp.',1),
('Blue Fox Strobe Spoon Kit', 'The extremely versatile Blue Fox® Strobe Spoon Kit is great for casting and trolling. This classic teardrop Strobe Spoon is constructed of heavy, stamped brass and outfitted with super-sharp VMC® hooks. The Spoon has an excellent, wide, wobbling action that prompts forceful strikes from multiple freshwater game fish.',1),
('Blue Fox Flash Spinner Kit','The Blue Fox® Flash Spinner Kit includes 5 colors. A laser holographic blade and body finish create flash. Designed to go deep, the Blue Fox Spinner has a 30° deep-depth blade that runs 5 feet. The 30° blade rotates easily but doesn''t give as much lift as other blade types. Therefore, your bait stays down in front of the fish. The blade flutters down quickly on the fall, while the flashabou fibers in the dressed tail provide added attraction. Assorted Colors.',1);


INSERT INTO ProductCategory (ProductId, CategoryId)
VALUES
(1,1),
(2,1),
(3,1),
(4,2),
(5,2),
(6,2),
(7,3),
(8,3),
(9,3);


COMMIT tran
