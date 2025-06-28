-- Enhanced seed data for NexusSync Platform with MIT Manipal context

-- 1. Insert MIT Manipal specific venues
INSERT INTO venues (id, name, code, location, capacity, facilities, booking_contact, coordinates, is_available) VALUES
(1, 'Academic Block 1 Seminar Hall', 'AB1', 'Academic Block 1, MIT Manipal', 80, 'Projector, Whiteboard, AC, Audio System', 'ab1@manipal.edu', 'POINT(74.7929 13.3525)', TRUE),
(2, 'Academic Block 2 Conference Room', 'AB2', 'Academic Block 2, MIT Manipal', 50, 'Projector, Conference Setup, AC', 'ab2@manipal.edu', 'POINT(74.7930 13.3526)', TRUE),
(3, 'Academic Block 3 Lecture Hall', 'AB3', 'Academic Block 3, MIT Manipal', 120, 'Projector, Sound System, AC, Stage', 'ab3@manipal.edu', 'POINT(74.7931 13.3527)', TRUE),
(4, 'Academic Block 4 Seminar Room', 'AB4', 'Academic Block 4, MIT Manipal', 60, 'Projector, Whiteboard, AC', 'ab4@manipal.edu', 'POINT(74.7932 13.3528)', TRUE),
(5, 'Academic Block 5 Seminar Hall', 'AB5', 'Academic Block 5, MIT Manipal', 150, 'Projector, Whiteboard, AC, Recording Setup', 'ab5@manipal.edu', 'POINT(74.7933 13.3529)', TRUE),
(6, 'Nitte Lecture Hall Auditorium', 'NLH', 'NLH Complex, MIT Manipal', 300, 'Projector, Sound System, AC, Stage, Lighting', 'nlh@manipal.edu', 'POINT(74.7925 13.3520)', TRUE),
(7, 'Innovation Centre Auditorium', 'IC', 'Innovation Centre, MIT Manipal', 500, 'Projector, Sound System, AC, Stage, Live Streaming', 'ic@manipal.edu', 'POINT(74.7935 13.3530)', TRUE),
(8, 'Student Plaza', 'PLAZA', 'Central Campus, MIT Manipal', 1000, 'Open Air, Stage Setup Available, Power Supply', 'plaza@manipal.edu', 'POINT(74.7928 13.3523)', TRUE),
(9, 'Quadrangle', 'QUAD', 'Main Campus, MIT Manipal', 800, 'Open Air, Lighting, Sound System', 'quad@manipal.edu', 'POINT(74.7927 13.3522)', TRUE),
(10, 'Central Library Seminar Room', 'LIB', 'Central Library, MIT Manipal', 50, 'Projector, Whiteboard, Silent Zone', 'library@manipal.edu', 'POINT(74.7926 13.3521)', TRUE),
(11, 'Football Ground', 'GROUND', 'Sports Complex, MIT Manipal', 2000, 'Open Air, Floodlights, Sound System', 'sports@manipal.edu', 'POINT(74.7940 13.3535)', TRUE),
(12, '16th Block Community Hall', '16B', '16th Block Hostel, MIT Manipal', 200, 'Projector, Sound System, AC', '16block@manipal.edu', 'POINT(74.7920 13.3515)', TRUE),
(13, '18th Block Auditorium', '18B', '18th Block Hostel, MIT Manipal', 150, 'Projector, Sound System, AC', '18block@manipal.edu', 'POINT(74.7922 13.3517)', TRUE);

-- 2. Insert users (students and admins)
INSERT INTO users (id, registration_number, email, password_hash, full_name, role, department, year_of_study, interests, bio, phone, profile_image_url, status, join_date, last_active, avatar, created_at, updated_at) VALUES
(1, '220701001', 'john.doe@learner.manipal.edu', '$2b$10$example_hash_1', 'John Doe', 'student', 'Computer Science Engineering', 3, 'Programming,AI/ML,Web Development,Robotics', 'Passionate about technology and innovation. Love building cool projects!', '9876543210', '/avatars/john.png', 'active', '2025-07-26', '2025-07-26 10:00:00', '/avatars/john.png', '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(2, '240962386', 'prayatshu.mitmpl2024@learner.manipal.edu', '$2b$10$example_hash_2', 'Prayatshu Misra', 'student', 'Computer Science and Engineering', 3, 'Design,UI/UX,Photography,Digital Art', 'Creative designer with a passion for user experience and visual storytelling.', '7985638485', '/avatars/prayatshu.png', 'active', '2025-07-26', '2025-07-26 10:00:00', '/avatars/prayatshu.png', '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(3, '240911196', 'rohanmathur428@gmail.com', '$2b$10$example_hash_3', 'Rohan Mathur', 'student', 'Information-Technology', 2, 'Robotics,IoT,Innovation,Hardware', 'Electronics enthusiast interested in IoT and embedded systems.', '9818049557', '/avatars/rohan.png', 'active', '2025-07-26', '2025-07-26 10:00:00', '/avatars/rohan.png', '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(4, '240962344', 'mehrandhakray@gmail.com', '$2b$10$example_hash_4', 'Mehran Pratap Singh Dhakray', 'student', 'Computer Science Engineering', 4, 'Music,Dance,Cultural Activities,Event Management', 'Music lover and cultural enthusiast. Love organizing events and performances.', '7428667645', '/avatars/mehran.png', 'active', '2025-07-26', '2025-07-26 10:00:00', '/avatars/mehran.png', '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(5, '220701005', 'rahul.kumar@learner.manipal.edu', '$2b$10$example_hash_5', 'Rahul Kumar', 'student', 'Mechanical Engineering', 3, 'Entrepreneurship,Leadership,Innovation,Business', 'Aspiring entrepreneur with a passion for innovation and leadership.', '9876543214', '/avatars/rahul.png', 'active', '2025-07-26', '2025-07-26 10:00:00', '/avatars/rahul.png', '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(6, '220701006', 'ananya.patel@learner.manipal.edu', '$2b$10$example_hash_6', 'Ananya Patel', 'student', 'Biotechnology', 2, 'Research,Science,Environment,Community Service', 'Research enthusiast passionate about biotechnology and environmental conservation.', '9876543215', '/avatars/ananya.png', 'active', '2025-07-26', '2025-07-26 10:00:00', '/avatars/ananya.png', '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(7, '220701007', 'arjun.nair@learner.manipal.edu', '$2b$10$example_hash_7', 'Arjun Nair', 'student', 'Civil Engineering', 4, 'Architecture,Design,Sustainability,Innovation', 'Civil engineering student interested in sustainable architecture and urban planning.', '9876543216', '/avatars/arjun.png', 'active', '2025-07-26', '2025-07-26 10:00:00', '/avatars/arjun.png', '2025-07-26 10:00:00', '2025-07-26 10:00:00');

-- Insert admin users with explicit IDs
INSERT INTO users (id, email, password_hash, full_name, role, department, phone, profile_image_url, status, join_date, last_active, avatar, created_at, updated_at) VALUES
(8, 'swo@manipal.edu', '$2b$10$admin_hash_1', 'Dr. Rajesh Kumar', 'admin', 'Student Affairs', '9876543217', '/avatars/rajesh.png', 'active', '2025-07-26', '2025-07-26 10:00:00', '/avatars/rajesh.png', '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(9, 'dean.students@manipal.edu', '$2b$10$admin_hash_2', 'Prof. Sunita Rao', 'admin', 'Administration', '9876543218', '/avatars/sunita.png', 'active', '2025-07-26', '2025-07-26 10:00:00', '/avatars/sunita.png', '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(10, 'faculty.coord@manipal.edu', '$2b$10$admin_hash_3', 'Dr. Amit Sharma', 'admin', 'Academic Affairs', '9876543219', '/avatars/amit.png', 'active', '2025-07-26', '2025-07-26 10:00:00', '/avatars/amit.png', '2025-07-26 10:00:00', '2025-07-26 10:00:00');

-- 3. Insert clubs (with explicit IDs)
INSERT INTO clubs (id, name, slug, description, category, email, faculty_advisor, faculty_advisor_email, member_count, rating, total_events, tags, social_links, recruitment_status, logo_url, banner_url, founded_date, contact_person_id, is_active, engagement, spent, growth, satisfaction, status, last_activity, created_at, updated_at, website) VALUES
(1,'ISTE Club', 'iste-tech-club', 'Building the next generation of developers through hands-on workshops, hackathons, and tech talks. We focus on Google technologies, open-source development, and creating impact through technology.', 'Technical', 'iste@manipal.edu', 'Dr. Rajesh Kumar', 'rajesh.kumar@manipal.edu', 450, 4.8, 12, 'Technical,Programming,AI/ML,Web Development,Mobile Development', '{"instagram": "@iste_mit", "linkedin": "iste-mit-manipal", "github": "iste-mit"}', 'open', '/logos/iste.png', '/banners/iste.jpg', '2010-01-15', 1, TRUE, 100, 50000, 15, 4.8, 'active', '2025-07-26', '2010-01-15 10:00:00', '2025-07-26 10:00:00', 'https://iste.mit.edu'),
(2,'Music Club MIT Manipal', 'music-club', 'Harmony in diversity, melody in unity. We bring together musicians from all genres to create beautiful music and memorable performances. From classical to contemporary, we celebrate all forms of musical expression.', 'Cultural', 'music@manipal.edu', 'Prof. Sunita Rao', 'sunita.rao@manipal.edu', 320, 4.9, 8, 'Cultural,Music,Performance,Arts', '{"instagram": "@musicclub_mit", "youtube": "MusicClubMIT"}', 'closed', '/logos/music.png', '/banners/music.jpg', '2008-05-20', 4, TRUE, 90, 30000, 10, 4.9, 'active', '2025-07-26', '2008-05-20 10:00:00', '2025-07-26 10:00:00', 'https://music.mit.edu'),
(3,'Rotaract Club MIT Manipal', 'rotaract', 'Service above self. We are committed to community service, leadership development, and making a positive impact in society through various social initiatives and community outreach programs.', 'Service', 'rotaract@manipal.edu', 'Dr. Amit Sharma', 'amit.sharma@manipal.edu', 280, 4.7, 15, 'Service,Community,Leadership,Social Impact', '{"instagram": "@rotaract_mit", "linkedin": "rotaract-mit-manipal"}', 'soon', '/logos/rotaract.png', '/banners/rotaract.jpg', '2012-08-10', 5, TRUE, 120, 25000, 12, 4.7, 'active', '2025-07-26', '2012-08-10 10:00:00', '2025-07-26 10:00:00', 'https://rotaract.mit.edu'),
(4,'Choreo - Dance Club', 'choreo', 'Express yourself through movement. From classical to contemporary, hip-hop to folk, we celebrate all forms of dance. Join us to learn, perform, and spread the joy of dance across campus.', 'Cultural', 'choreo@manipal.edu', 'Ms. Kavya Nair', 'kavya.nair@manipal.edu', 200, 4.6, 6, 'Cultural,Dance,Performance,Arts', '{"instagram": "@choreo_mit", "youtube": "ChoreoMIT"}', 'open', '/logos/choreo.png', '/banners/choreo.jpg', '2011-07-15', 4, TRUE, 80, 15000, 8, 4.6, 'active', '2025-07-26', '2011-07-15 10:00:00', '2025-07-26 10:00:00', 'https://choreo.mit.edu'),
(5,'E-Cell MIT Manipal', 'ecell', 'Fostering entrepreneurship and innovation among students. We organize startup competitions, mentorship programs, networking events, and provide a platform for budding entrepreneurs to turn their ideas into reality.', 'Entrepreneurship', 'ecell@manipal.edu', 'Dr. Vikram Singh', 'vikram.singh@manipal.edu', 180, 4.5, 10, 'Entrepreneurship,Innovation,Business,Startups', '{"instagram": "@ecell_mit", "linkedin": "ecell-mit-manipal", "twitter": "@ecell_mit"}', 'open', '/logos/ecell.png', '/banners/ecell.jpg', '2013-03-05', 5, TRUE, 70, 20000, 10, 4.5, 'active', '2025-07-26', '2013-03-05 10:00:00', '2025-07-26 10:00:00', 'https://ecell.mit.edu'),
(6,'Design Club MIT', 'design-club', 'Where creativity meets functionality. We explore graphic design, UI/UX, product design, and visual storytelling. Join us to enhance your design skills and work on exciting creative projects.', 'Creative', 'design@manipal.edu', 'Prof. Anita Desai', 'anita.desai@manipal.edu', 150, 4.4, 7, 'Creative,Design,UI/UX,Graphics', '{"instagram": "@designclub_mit", "behance": "designclub-mit"}', 'closed', '/logos/design.png', '/banners/design.jpg', '2014-09-12', 2, TRUE, 60, 12000, 8, 4.4, 'active', '2025-07-26', '2014-09-12 10:00:00', '2025-07-26 10:00:00', 'https://design.mit.edu'),
(7,'Robotics Club MIT', 'robotics', 'Building the future with autonomous systems, AI, and cutting-edge robotics technology. We work on exciting projects involving drones, autonomous vehicles, and intelligent systems.', 'Technical', 'robotics@manipal.edu', 'Dr. Suresh Babu', 'suresh.babu@manipal.edu', 220, 4.7, 9, 'Technical,Robotics,AI,Hardware,Innovation', '{"instagram": "@robotics_mit", "youtube": "RoboticsMIT"}', 'soon', '/logos/robotics.png', '/banners/robotics.jpg', '2012-11-20', 3, TRUE, 90, 35000, 15, 4.7, 'active', '2025-07-26', '2012-11-20 10:00:00', '2025-07-26 10:00:00', 'https://robotics.mit.edu'),
(8,'Literary Club MIT', 'lit-club', 'Words have power. We celebrate literature, poetry, creative writing, and the art of storytelling. Join us for book discussions, poetry sessions, and creative writing workshops.', 'Literary', 'literature@manipal.edu', 'Prof. Meera Joshi', 'meera.joshi@manipal.edu', 130, 4.3, 5, 'Literary,Writing,Poetry,Arts', '{"instagram": "@litclub_mit", "medium": "@litclub-mit"}', 'open', '/logos/literary.png', '/banners/literary.jpg', '2015-02-18', 7, TRUE, 50, 8000, 5, 4.3, 'active', '2025-07-26', '2015-02-18 10:00:00', '2025-07-26 10:00:00', 'https://literary.mit.edu'),
(9,'Photography Club', 'photo-club', 'Capturing moments, creating memories. We explore all aspects of photography from portraits to landscapes, street photography to event coverage. Learn techniques and showcase your work.', 'Creative', 'photo@manipal.edu', 'Mr. Ravi Prakash', 'ravi.prakash@manipal.edu', 160, 4.5, 8, 'Creative,Photography,Arts,Visual', '{"instagram": "@photoclub_mit", "flickr": "photoclub-mit"}', 'open', '/logos/photo.png', '/banners/photo.jpg', '2013-08-25', 2, TRUE, 70, 15000, 10, 4.5, 'active', '2025-07-26', '2013-08-25 10:00:00', '2025-07-26 10:00:00', 'https://photo.mit.edu'),
(10,'Debate Society', 'debate', 'Sharpening minds through the art of argumentation. We participate in debates, discussions, and public speaking events. Develop your oratory skills and critical thinking abilities.', 'Literary', 'debate@manipal.edu', 'Dr. Priya Menon', 'priya.menon@manipal.edu', 90, 4.2, 6, 'Literary,Debate,Public Speaking,Critical Thinking', '{"instagram": "@debate_mit"}', 'closed', '/logos/debate.png', '/banners/debate.jpg', '2014-04-30', 7, TRUE, 40, 10000, 6, 4.2, 'active', '2025-07-26', '2014-04-30 10:00:00', '2025-07-26 10:00:00', 'https://debate.mit.edu');

-- 4. Insert locations (with explicit IDs)
INSERT INTO locations (id, name, type, description, facilities, coordinates, is_open) VALUES
(1,'Academic Block 1', 'academic', 'Main academic building for core engineering departments.', 'Projector, Whiteboard, AC, Audio System', '{"lat":13.3525,"lng":74.7929}', TRUE),
(2,'NLH Complex', 'auditorium', 'Large auditorium for events and fests.', 'Projector, Sound System, AC, Stage, Lighting', '{"lat":13.3520,"lng":74.7925}', TRUE),
(3,'Student Plaza', 'outdoor', 'Central open-air plaza for large gatherings.', 'Open Air, Stage Setup Available, Power Supply', '{"lat":13.3523,"lng":74.7928}', TRUE),
(4,'Malpe Beach', 'outdoor', 'Popular beach near campus for outdoor events.', 'Open Space, Beach Access', '{"lat":13.3500,"lng":74.7900}', TRUE),
(5,'Quadrangle', 'outdoor', 'Main open area in the center of campus.', 'Open Space, Central Location', '{"lat":13.3522,"lng":74.7927}', TRUE);

-- 5. Insert club_members (references users and clubs)
INSERT INTO club_members (user_id, club_id, role_in_club, position_title, joined_at, email, permissions, join_date, avatar) VALUES
(1, 1, 'core_member', 'Web Development Lead', '2025-07-26 10:00:00', 'john.doe@learner.manipal.edu', 'post_content,manage_events,recruit_members', '2025-07-26', '/avatars/john.png'),
(2, 6, 'president', 'President', '2025-07-26 10:00:00', 'prayatshu.mitmpl2024@learner.manipal.edu', 'all_permissions', '2025-07-26', '/avatars/prayatshu.png'),
(3, 7, 'core_member', 'Hardware Lead', '2025-07-26 10:00:00', 'rohanmathur428@gmail.com', 'post_content,manage_events', '2025-07-26', '/avatars/rohan.png'),
(4, 2, 'vice_president', 'Vice President', '2025-07-26 10:00:00', 'mehrandhakray@gmail.com', 'post_content,manage_events,recruit_members,manage_budget', '2025-07-26', '/avatars/mehran.png'),
(4, 4, 'core_member', 'Choreographer', '2025-07-26 10:00:00', 'mehrandhakray@gmail.com', 'post_content,manage_events', '2025-07-26', '/avatars/mehran.png'),
(5, 5, 'president', 'President', '2025-07-26 10:00:00', 'rahul.kumar@learner.manipal.edu', 'all_permissions', '2025-07-26', '/avatars/rahul.png'),
(5, 3, 'core_member', 'Event Coordinator', '2025-07-26 10:00:00', 'rahul.kumar@learner.manipal.edu', 'post_content,manage_events', '2025-07-26', '/avatars/rahul.png'),
(6, 3, 'member', 'Volunteer', '2025-07-26 10:00:00', 'ananya.patel@learner.manipal.edu', 'view_content', '2025-07-26', '/avatars/ananya.png'),
(7, 8, 'secretary', 'Secretary', '2025-07-26 10:00:00', 'arjun.nair@learner.manipal.edu', 'post_content,manage_events,manage_meetings', '2025-07-26', '/avatars/arjun.png');

-- 6. Insert events (references clubs, locations, users)
INSERT INTO events (id, club_id, title, description, event_type, venue, venue_id, start_date, end_date, registration_start, registration_deadline, max_participants, current_participants, poster_url, budget_requested, budget_approved, status, approval_notes, expected_participants, submitted_date, duration, requirements, club_logo, location_id, registration_status, tags, created_by, created_at, updated_at) VALUES
(1,1, 'TechTatva 2024', 'Annual technical festival featuring hackathons, coding competitions, tech talks, and innovation showcases. Join us for 3 days of non-stop learning and innovation.', 'technical', 'Innovation Centre Auditorium', 7, '2025-07-26 09:00:00', '2025-07-26 18:00:00', '2025-07-26 00:00:00', '2025-07-26 23:59:59', 500, 450, '/posters/techtatva2024.jpg', 50000.00, 50000.00, 'approved', 'All requirements met', 500, '2025-07-26', '3 days', 'Laptop, enthusiasm', '/logos/iste.png', 2, 'open', 'hackathon,coding,tech,innovation', 1, '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(2,2, 'Melodic Nights', 'An evening of soulful music featuring performances by our talented club members and guest artists. Experience the magic of live music in an intimate setting.', 'cultural', 'NLH Auditorium', 6, '2025-07-26 19:00:00', '2025-07-26 22:00:00', '2025-07-26 00:00:00', '2025-07-26 23:59:59', 300, 280, '/posters/melodic-nights.jpg', 15000.00, 15000.00, 'approved', 'Approved with conditions', 300, '2025-07-26', '3 hours', 'None', '/logos/music.png', 2, 'open', 'music,performance,cultural', 4, '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(3,5, 'Startup Pitch Competition', 'Budding entrepreneurs pitch their innovative ideas to industry experts and investors. Win funding and mentorship for your startup idea.', 'competition', 'Academic Block 5 Seminar Hall', 5, '2025-07-26 14:00:00', '2025-07-26 18:00:00', '2025-07-26 00:00:00', '2025-07-26 23:59:59', 150, 120, '/posters/startup-pitch.jpg', 25000.00, 20000.00, 'pending_approval', 'Budget needs review', 150, '2025-07-26', '4 hours', 'Business plan, pitch deck', '/logos/ecell.png', 1, 'open', 'entrepreneurship,startup,competition', 5, '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(4,4, 'Dance Fusion Workshop', 'Learn contemporary dance fusion techniques from professional choreographers. Open to all skill levels, come and express yourself through movement.', 'workshop', 'Student Plaza', 8, '2025-07-26 16:00:00', '2025-07-26 19:00:00', '2025-07-26 00:00:00', '2025-07-26 23:59:59', 100, 80, '/posters/dance-fusion.jpg', 8000.00, 8000.00, 'approved', 'Approved', 100, '2025-07-26', '3 hours', 'Comfortable clothing', '/logos/choreo.png', 3, 'open', 'dance,workshop,cultural', 4, '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(5,3, 'Beach Cleanup Drive', 'Community service initiative to clean Malpe Beach and raise environmental awareness. Join us in making a difference for our coastal environment.', 'service', 'Malpe Beach', NULL, '2025-07-26 07:00:00', '2025-07-26 12:00:00', '2025-07-26 00:00:00', '2025-07-26 23:59:59', 200, 150, '/posters/beach-cleanup.jpg', 5000.00, 5000.00, 'approved', 'Approved', 200, '2025-07-26', '5 hours', 'Gloves, bags provided', '/logos/rotaract.png', 4, 'open', 'service,environment,community', 5, '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(6,7, 'RoboWars Championship', 'Battle of the bots! Design, build, and compete with your custom fighting robots. Show off your engineering skills in this exciting competition.', 'competition', 'Quadrangle', 9, '2025-07-26 10:00:00', '2025-07-26 17:00:00', '2025-07-26 00:00:00', '2025-07-26 23:59:59', 80, 60, '/posters/robowars.jpg', 30000.00, 25000.00, 'approved', 'Partial budget approved', 80, '2025-07-26', '7 hours', 'Bring your robot', '/logos/robotics.png', 5, 'open', 'robotics,competition,technical', 3, '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(7,6, 'UI/UX Design Bootcamp', 'Intensive 2-day bootcamp covering modern UI/UX design principles, tools, and techniques. Learn from industry professionals and work on real projects.', 'workshop', 'Academic Block 5 Seminar Hall', 5, '2025-07-26 09:00:00', '2025-07-26 17:00:00', '2025-07-26 00:00:00', '2025-07-26 23:59:59', 60, 50, '/posters/uiux-bootcamp.jpg', 12000.00, 12000.00, 'approved', 'Approved', 60, '2025-07-26', '2 days', 'Laptop with design software', '/logos/design.png', 1, 'open', 'design,workshop,ui/ux', 2, '2025-07-26 10:00:00', '2025-07-26 10:00:00'),
(8,8, 'Poetry Slam Night', 'Express your thoughts and emotions through the power of spoken word. Open mic night for poets, storytellers, and word enthusiasts.', 'cultural', 'Central Library Seminar Room', 10, '2025-07-26 19:00:00', '2025-07-26 22:00:00', '2025-07-26 00:00:00', '2025-07-26 23:59:59', 80, 60, '/posters/poetry-slam.jpg', 3000.00, 3000.00, 'approved', 'Approved', 80, '2025-07-26', '3 hours', 'Original content', '/logos/literary.png', 3, 'open', 'poetry,literature,performance', 7, '2025-07-26 10:00:00', '2025-07-26 10:00:00');

-- 7. Insert posts (references clubs, users)
INSERT INTO posts (id, club_id, author_id, content, image_urls, video_url, post_type, likes_count, comments_count, shares_count, is_pinned, is_bookmarked, created_at, updated_at, views, status, images) VALUES
(1,1, 1, '🚀 Just wrapped up our AI/ML workshop! Amazing turnout with 200+ students learning about neural networks and deep learning. The energy in the room was incredible! Next up: Flutter development bootcamp this weekend. Who''s excited? #ISTE #AI #MachineLearning #TechEducation', '/posts/ISTE-workshop1.jpg,/posts/ISTE-workshop2.jpg', NULL, 'event', 156, 23, 12, FALSE, FALSE, '2025-07-26 15:30:00', '2025-07-26 15:30:00', 468, 'published', '/posts/ISTE-workshop1.jpg'),
(2,2, 4, '🎵 Rehearsals for our annual concert "Melodic Nights" are in full swing! Our talented musicians have been working tirelessly to create an unforgettable evening. From classical ragas to contemporary fusion, we have something for everyone. See you at NLH Auditorium on Oct 20th! #MelodicNights #MusicClub #LiveMusic', '/posts/music-rehearsal1.jpg,/posts/music-rehearsal2.jpg', NULL, 'event', 89, 15, 8, FALSE, FALSE, '2025-07-26 18:45:00', '2025-07-26 18:45:00', 267, 'published', '/posts/music-rehearsal1.jpg'),
(3,3, 5, '🌱 What an incredible day at Malpe Beach! Our beach cleanup drive was a huge success with 50+ volunteers collecting over 100kg of waste. It''s amazing what we can achieve when we come together for a cause. Thank you to everyone who participated! Next cleanup drive: November 2nd. #BeachCleanup #ServiceAboveSelf #Environment #Community', '/posts/beach-cleanup1.jpg,/posts/beach-cleanup2.jpg,/posts/beach-cleanup3.jpg', NULL, 'achievement', 234, 31, 45, FALSE, FALSE, '2025-07-26 12:20:00', '2025-07-26 12:20:00', 702, 'published', '/posts/beach-cleanup1.jpg'),
(4,4, 4, '💃 Dance is the language of the soul! Our contemporary fusion workshop last weekend was absolutely magical. Watching everyone express themselves through movement was truly inspiring. Special thanks to our guest choreographer @DanceMaster for the amazing session! #Choreo #Dance #Expression #Workshop', '/posts/dance-workshop1.jpg', NULL, 'event', 67, 12, 5, FALSE, FALSE, '2025-07-26 20:15:00', '2025-07-26 20:15:00', 201, 'published', '/posts/dance-workshop1.jpg'),
(5,5, 5, '🚀 Calling all innovators and entrepreneurs! Our Startup Pitch Competition is just around the corner. This is your chance to present your groundbreaking ideas to industry experts and potential investors. Registration closes on Oct 22nd. Don''t miss this opportunity to turn your dreams into reality! #Entrepreneurship #Innovation #StartupLife #PitchCompetition', '/posts/startup-pitch-promo.jpg', NULL, 'recruitment', 98, 18, 22, FALSE, FALSE, '2025-07-26 09:30:00', '2025-07-26 09:30:00', 294, 'published', '/posts/startup-pitch-promo.jpg'),
(6,6, 2, '🎨 Design thinking session was a blast! We explored user-centered design principles and worked on real-world problems. Amazing to see creative solutions emerge from collaborative thinking. #DesignThinking #UX #Innovation #Creativity', '/posts/design-thinking.jpg', NULL, 'general', 45, 8, 3, FALSE, FALSE, '2025-07-26 14:20:00', '2025-07-26 14:20:00', 135, 'published', '/posts/design-thinking.jpg'),
(7,7, 3, '🤖 Our autonomous drone project is taking flight! After months of hard work, we successfully demonstrated obstacle avoidance and path planning. Proud of our team''s dedication and innovation. #Robotics #Drone #Innovation #Technology', '/posts/drone-project.jpg', NULL, 'achievement', 78, 14, 9, FALSE, FALSE, '2025-07-26 16:45:00', '2025-07-26 16:45:00', 234, 'published', '/posts/drone-project.jpg'),
(8,8, 7, '📚 Book club discussion on "The Alchemist" was thought-provoking! Great insights shared by everyone. Next month we''re reading "Sapiens" - join us for engaging literary discussions! #BookClub #Literature #Reading #Discussion', '/posts/book-club.jpg', NULL, 'general', 32, 6, 2, FALSE, FALSE, '2025-07-26 19:30:00', '2025-07-26 19:30:00', 96, 'published', '/posts/book-club.jpg');

-- 8. Insert post_likes (references posts, users)
INSERT INTO post_likes (post_id, user_id) VALUES
(1, 2), (1, 3), (1, 4), (1, 5), (1, 6), (1, 7),
(2, 1), (2, 3), (2, 5), (2, 6),
(3, 1), (3, 2), (3, 3), (3, 4), (3, 6), (3, 7),
(4, 1), (4, 2), (4, 3), (4, 5),
(5, 1), (5, 2), (5, 3), (5, 4), (5, 6),
(6, 1), (6, 3), (6, 4), (6, 5),
(7, 1), (7, 2), (7, 4), (7, 5), (7, 6),
(8, 1), (8, 2), (8, 3), (8, 4);

-- 9. Insert registrations (references events, users)
INSERT INTO registrations (event_id, user_id, student_name, registration_number, email, phone, department, year_of_study, registration_date, status, avatar, dietary_restrictions, special_requirements) VALUES
(1, 1, 'John Doe', '220701001', 'john.doe@learner.manipal.edu', '9876543210', 'Computer Science Engineering', 3, '2025-07-26 10:00:00', 'registered', '/avatars/john.png', NULL, NULL),
(1, 2, 'Prayatshu Misra', '240962386', 'prayatshu.mitmpl2024@learner.manipal.edu', '7985638485', 'Computer Science and Engineering', 3, '2025-07-26 10:00:00', 'registered', '/avatars/prayatshu.png', NULL, NULL),
(1, 3, 'Rohan Mathur', '240911196', 'rohanmathur428@gmail.com', '9818049557', 'Information-Technology', 2, '2025-07-26 10:00:00', 'registered', '/avatars/rohan.png', NULL, NULL),
(2, 4, 'Mehran Pratap Singh Dhakray', '240962344', 'mehrandhakray@gmail.com', '7428667645', 'Computer Science Engineering', 4, '2025-07-26 10:00:00', 'registered', '/avatars/mehran.png', 'Vegetarian', NULL),
(2, 1, 'John Doe', '220701001', 'john.doe@learner.manipal.edu', '9876543210', 'Computer Science Engineering', 3, '2025-07-26 10:00:00', 'registered', '/avatars/john.png', NULL, NULL),
(4, 4, 'Mehran Pratap Singh Dhakray', '240962344', 'mehrandhakray@gmail.com', '7428667645', 'Computer Science Engineering', 4, '2025-07-26 10:00:00', 'registered', '/avatars/mehran.png', NULL, NULL),
(5, 3, 'Rohan Mathur', '240911196', 'rohanmathur428@gmail.com', '9818049557', 'Information-Technology', 2, '2025-07-26 10:00:00', 'registered', '/avatars/rohan.png', NULL, NULL),
(5, 5, 'Rahul Kumar', '220701005', 'rahul.kumar@learner.manipal.edu', '9876543214', 'Mechanical Engineering', 3, '2025-07-26 10:00:00', 'registered', '/avatars/rahul.png', NULL, NULL),
(6, 3, 'Rohan Mathur', '240911196', 'rohanmathur428@gmail.com', '9818049557', 'Information-Technology', 2, '2025-07-26 10:00:00', 'registered', '/avatars/rohan.png', NULL, NULL),
(7, 2, 'Prayatshu Misra', '240962386', 'prayatshu.mitmpl2024@learner.manipal.edu', '9876543211', 'Computer Science and Engineering', 3, '2025-07-26 10:00:00', 'registered', '/avatars/prayatshu.png', NULL, NULL),
(8, 7, 'Arjun Nair', '220701007', 'arjun.nair@learner.manipal.edu', '9876543216', 'Civil Engineering', 4, '2025-07-26 10:00:00', 'registered', '/avatars/arjun.png', NULL, NULL);

-- 10. Insert club_applications (references clubs, users)
INSERT INTO club_applications (id, club_id, user_id, position, application_text, status, applied_date, quiz_responses, quiz_score) VALUES
(1, 1, 3, 'Web Development Lead', 'I have 2+ years of experience in React, Node.js, and full-stack development. I have built several projects including a campus event management system and would love to contribute to ISTE.', 'pending', '2025-07-26 14:30:00', '{"q1": "React", "q2": "Node.js", "q3": "MongoDB"}', 85),
(2, 6, 1, 'UI/UX Designer', 'Passionate about creating user-centered designs. Proficient in Figma, Adobe Creative Suite, and have worked on multiple design projects including mobile apps and websites.', 'shortlisted', '2025-07-26 10:15:00', '{"q1": "Figma", "q2": "User Research", "q3": "Prototyping"}', 92),
(3, 3, 2, 'Event Coordinator', 'I have experience organizing college events and am passionate about community service. I believe I can contribute significantly to Rotaract through my organizational skills.', 'rejected', '2025-07-26 16:45:00', '{"q1": "Event Planning", "q2": "Team Management", "q3": "Community Service"}', 78),
(4, 5, 4, 'Marketing Head', 'Strong background in digital marketing and social media management. I want to help promote entrepreneurship on campus and connect with like-minded individuals.', 'accepted', '2025-07-26 11:20:00', '{"q1": "Digital Marketing", "q2": "Social Media", "q3": "Brand Strategy"}', 88),
(5, 7, 6, 'Research Assistant', 'Biotechnology student with interest in robotics applications in healthcare. Would love to contribute to research projects and learn about robotics.', 'interview_scheduled', '2025-07-26 09:00:00', '{"q1": "Research", "q2": "Healthcare", "q3": "Innovation"}', 90);

-- 11. Insert notifications (references users)
INSERT INTO notifications (user_id, title, message, type, related_id, is_read, created_at) VALUES
(1, 'Application Update', 'Your application for UI/UX Designer position at Design Club has been shortlisted! Interview scheduled for tomorrow.', 'application', 2, FALSE, '2025-07-26 10:00:00'),
(3, 'New Event Registration', 'You have successfully registered for TechTatva 2024. Get ready for an amazing experience!', 'event', 1, FALSE, '2025-07-26 10:00:00'),
(4, 'Club Meeting Reminder', 'Music Club meeting tomorrow at 4 PM in NLH-205. Don''t forget to bring your instruments!', 'meeting', 2, FALSE, '2025-07-26 10:00:00'),
(2, 'Event Approval', 'Your event proposal "Design Thinking Workshop" has been approved by the administration.', 'event', 7, FALSE, '2025-07-26 10:00:00'),
(5, 'New Member Welcome', 'Welcome to E-Cell MIT Manipal! We''re excited to have you as our new Marketing Head.', 'club', 5, FALSE, '2025-07-26 10:00:00'),
(6, 'Interview Scheduled', 'Your interview for Research Assistant position at Robotics Club is scheduled for Oct 12, 2025 at 3 PM.', 'application', 5, FALSE, '2025-07-26 10:00:00'),
(7, 'Event Reminder', 'Poetry Slam Night is tomorrow! Don''t forget to prepare your pieces.', 'event', 8, FALSE, '2025-07-26 10:00:00');

-- 12. Insert recruitment_campaigns (references clubs)
INSERT INTO recruitment_campaigns (id, club_id, title, description, start_date, end_date, positions, status, created_at) VALUES
(1, 1, 'ISTE Core Team Recruitment 2024', 'Join the ISTE Club core team and help build the tech community at MIT Manipal.', '2025-07-26 00:00:00', '2025-07-26 23:59:59', '[{"title": "Web Development Lead", "requirements": ["React", "Node.js", "MongoDB"], "openings": 2}, {"title": "Mobile App Lead", "requirements": ["Flutter", "React Native"], "openings": 1}]', 'open', '2025-07-26 10:00:00'),
(2, 4, 'Choreo Dance Team Auditions', 'Auditions for various dance forms - Contemporary, Hip-hop, Classical, and Fusion.', '2025-07-26 00:00:00', '2025-07-26 23:59:59', '[{"title": "Contemporary Dancer", "requirements": ["Dance Experience", "Flexibility"], "openings": 5}, {"title": "Hip-hop Dancer", "requirements": ["Street Dance", "Rhythm"], "openings": 3}]', 'open', '2025-07-26 10:00:00');

-- 13. Insert budgets (references clubs)
INSERT INTO budgets (club_id, total_allocated, total_spent, total_pending, remaining, events, last_activity) VALUES
(1, 100000, 50000, 10000, 40000, 12, '2025-07-26'),
(2, 80000, 60000, 5000, 15000, 8, '2025-07-26'),
(3, 60000, 30000, 2000, 28000, 15, '2025-07-26');

-- 14. Insert budget_requests (references clubs, events)
INSERT INTO budget_requests (club_id, event_id, event_title, requested_amount, approved_amount, category, status, submitted_date, purpose, breakdown) VALUES
(1, 1, 'TechTatva 2024', 50000, 50000, 'Technical Fest', 'approved', '2025-07-26', 'Annual technical festival', 'Venue: 20000, Prizes: 15000, Logistics: 15000'),
(2, 2, 'Melodic Nights', 15000, 15000, 'Cultural Event', 'approved', '2025-07-26', 'Annual music concert', 'Venue: 5000, Equipment: 7000, Misc: 3000');

-- 15. Insert conflicts
INSERT INTO conflicts (type, severity, title, description, affected_events, status, created_at) VALUES
('venue', 'high', 'Venue Double Booking', 'NLH booked for two events on same date.', '1,2', 'unresolved', '2025-07-26 10:00:00'),
('time', 'medium', 'Event Overlap', 'Two club events overlap for core members.', '3,4', 'resolved', '2025-07-26 12:00:00');

-- 16. Insert settings
INSERT INTO settings (key, value) VALUES
('theme', 'dark'),
('max_event_participants', '500'),
('maintenance_mode', 'off');

-- 17. Insert messages
INSERT INTO messages (title, content, type, priority, audience, status, sent_at, scheduled_for, read_count, total_recipients, channels) VALUES
('Welcome to NexusSync', 'Platform onboarding for all users.', 'info', 'high', 'all', 'sent', '2025-07-26 09:00:00', NULL, 1000, 1200, 'email,push'),
('Event Reminder', 'TechTatva 2024 starts tomorrow!', 'reminder', 'normal', 'students', 'sent', '2025-07-26 18:00:00', NULL, 500, 600, 'push');

-- 18. Insert message_templates
INSERT INTO message_templates (name, subject, content, category, usage_count) VALUES
('Event Reminder', 'Upcoming Event', 'Don''t forget about {{event_name}} on {{event_date}}!', 'event', 10),
('Welcome', 'Welcome to NexusSync', 'Hello {{user_name}}, welcome to the platform!', 'onboarding', 50);

-- 19. Insert quizzes (references recruitment_campaigns, clubs)
INSERT INTO quizzes (id, campaign_id, title, domain, duration, status, club_id, description, total_questions, difficulty, category, is_active, attempts, max_attempts, created_at) VALUES
(1, 1, 'ISTE Web Dev Quiz', 'Web Development', 30, 'active', 1, 'Quiz for web dev applicants', 10, 'medium', 'Technical', TRUE, 0, 1, '2025-07-26 10:00:00'),
(2, 2, 'Choreo Dance Quiz', 'Dance', 20, 'active', 4, 'Quiz for dance applicants', 8, 'easy', 'Cultural', TRUE, 0, 1, '2025-07-26 10:00:00');

-- 20. Insert quiz_questions (references quizzes)
INSERT INTO quiz_questions (quiz_id, question, options, correct_answer) VALUES
(1, 'What is React?', '["A library", "A framework", "A language", "A database"]', 'A library'),
(2, 'Which dance form is classical?', '["Hip-hop", "Bharatanatyam", "Jazz", "Salsa"]', 'Bharatanatyam');

-- 21. Insert quiz_results (references quizzes, users)
INSERT INTO quiz_results (quiz_id, user_id, score, submitted_at) VALUES
(1, 1, 8.5, '2025-07-26 11:00:00'),
(2, 4, 7.0, '2025-07-26 15:00:00');

-- 22. Insert applications (for interviews foreign key)
INSERT INTO applications (id, club_id, user_id, position, application_text, resume_url, portfolio_url, status, applied_date, reviewed_date, reviewer_notes, campaign_id, quiz_score, interview_id) VALUES
(1, 1, 3, 'Web Development Lead', 
 'As an IT student passionate about robotics and IoT, I want to bridge my technical skills with web development to create innovative solutions for ISTE projects.',
 '/resumes/rohan_webdev.pdf', 'https://github.com/rohanm/iot-projects', 
 'pending', '2025-07-26 14:30:00', NULL, NULL, 1, 85, 1),
(2, 6, 2, 'UI/UX Designer', 
 'As a design enthusiast with experience in Figma and Adobe XD, I want to help improve the club''s visual identity and create engaging user experiences for our events.',
 '/resumes/prayatshu_design.pdf', 'https://behance.net/prayatshu', 
 'shortlisted', '2025-07-26 10:15:00', '2025-07-26 11:00:00', 'Strong portfolio showing UX thinking', NULL, 92, NULL),
(3, 3, 5, 'Event Coordinator', 
 'With my experience organizing college fests, I can help Rotaract plan and execute impactful community service events efficiently.',
 '/resumes/rahul_events.pdf', NULL, 
 'accepted', '2025-07-26 16:45:00', '2025-07-26 17:30:00', 'Excellent organizational skills', NULL, 78, NULL),
(4, 5, 4, 'Marketing Head', 
 'I have managed social media for student groups before and can help E-Cell increase engagement and reach for our entrepreneurship events.',
 '/resumes/mehran_marketing.pdf', NULL, 
 'rejected', '2025-07-26 11:20:00', '2025-07-26 12:00:00', 'Position already filled', 2, 88, NULL),
(5, 7, 6, 'Research Assistant', 
 'My biotechnology background combined with interest in robotics applications in healthcare makes me a good fit for interdisciplinary research projects.',
 '/resumes/ananya_research.pdf', NULL, 
 'interview_scheduled', '2025-07-26 09:00:00', '2025-07-26 09:30:00', 'Strong academic background', NULL, 90, 2);

-- 23. Insert interviews (references applications, users)
INSERT INTO interviews (application_id, candidate_id, position, date, time, type, status, notes) VALUES
(1, 3, 'Web Development Lead', '2025-07-26', '15:00:00', 'technical', 'scheduled', 'Bring portfolio.'),
(2, 1, 'UI/UX Designer', '2025-07-26', '14:00:00', 'hr', 'completed', 'Good design skills.');

-- 24. Insert certificates (references users, events)
INSERT INTO certificates (user_id, event_id, recipient_name, event_name, event_date, achievement, signature, template, generated_at) VALUES
(1, 1, 'John Doe', 'TechTatva 2024', '2025-07-26', 'Participation', 'Dr. Rajesh Kumar', 'default', '2025-07-26 10:00:00'),
(4, 2, 'Mehran Pratap Singh Dhakray', 'Melodic Nights', '2025-07-26', 'Best Performer', 'Prof. Sunita Rao', 'music', '2025-07-26 12:00:00');

-- 25. Insert posters (references events)
INSERT INTO posters (event_id, title, subtitle, date, time, venue, theme, color, description, image_url, generated_at) VALUES
(1, 'TechTatva 2024', 'Annual Technical Fest', '2025-07-26', '09:00:00', 'Innovation Centre Auditorium', 'Tech', 'Blue', 'MIT''s biggest tech fest', '/posters/techtatva2024.jpg', '2025-07-26 10:00:00'),
(2, 'Melodic Nights', 'Music Club Concert', '2025-07-26', '19:00:00', 'NLH Auditorium', 'Music', 'Purple', 'Annual music night', '/posters/melodic-nights.jpg', '2025-07-26 12:00:00');

-- 26. Insert achievements (references users)
INSERT INTO achievements (user_id, title, description, points, icon, achieved_at) VALUES
(1, 'Hackathon Winner', 'Won first place at TechTatva Hackathon', 100, '🏆', '2025-07-26 18:00:00'),
(4, 'Best Performer', 'Best performance at Melodic Nights', 80, '🎤', '2025-07-26 22:00:00');

-- 27. Insert saved_posts (references users, posts)
INSERT INTO saved_posts (user_id, post_id, saved_at) VALUES
(1, 1, '2025-07-26 16:00:00'),
(4, 2, '2025-07-26 19:00:00');

-- 28. Insert admins (references users)
INSERT INTO admins (user_id, admin_id, department, permissions) VALUES
(8, 'ADM001', 'Student Affairs', 'all_permissions'),
(9, 'ADM002', 'Administration', 'manage_users,manage_events'),
(10, 'ADM003', 'Academic Affairs', 'manage_clubs,manage_budget');

-- 29. Insert students (references users)
INSERT INTO students (user_id, registration_number, department, year_of_study, interests) VALUES
(1, '220701001', 'Computer Science Engineering', 3, 'Programming,AI/ML,Web Development,Robotics'),
(2, '240962386', 'Computer Science and Engineering', 3, 'Design,UI/UX,Photography,Digital Art'),
(3, '240911196', 'Information-Technology', 2, 'Robotics,IoT,Innovation,Hardware'),
(4, '240962344', 'Computer Science Engineering', 4, 'Music,Dance,Cultural Activities,Event Management'),
(5, '220701005', 'Mechanical Engineering', 3, 'Entrepreneurship,Leadership,Innovation,Business'),
(6, '220701006', 'Biotechnology', 2, 'Research,Science,Environment,Community Service'),
(7, '220701007', 'Civil Engineering', 4, 'Architecture,Design,Sustainability,Innovation');

-- 30. Insert comments (references posts, users)
INSERT INTO comments (post_id, user_id, user_name, user_avatar_url, content, created_at, likes, is_liked) VALUES
(1, 2, 'Prayatshu Misra', '/avatars/prayatshu.png', 'Great workshop!', '2025-07-26 16:00:00', 5, TRUE),
(2, 1, 'John Doe', '/avatars/john.png', 'Looking forward to the event!', '2025-07-26 19:00:00', 3, FALSE);