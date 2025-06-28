-- USERS
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    registration_number VARCHAR(20),
    department VARCHAR(50),
    year_of_study INT,
    interests TEXT,
    bio TEXT,
    role VARCHAR(20) NOT NULL CHECK (role IN ('student','club_member','admin','club_admin')),
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    password_hash VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    profile_image_url VARCHAR(255),
    status VARCHAR(20) DEFAULT 'active',
    join_date DATE,
    last_active TIMESTAMP,
    avatar VARCHAR(255),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- LOCATIONS
CREATE TABLE IF NOT EXISTS locations (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    type VARCHAR(30),
    description TEXT,
    facilities TEXT,
    coordinates JSONB,
    is_open BOOLEAN DEFAULT TRUE
);

-- VENUES
CREATE TABLE IF NOT EXISTS venues (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    code VARCHAR(20),
    location VARCHAR(255) NOT NULL,
    capacity INT,
    facilities TEXT,
    booking_contact VARCHAR(100),
    coordinates TEXT,
    is_available BOOLEAN DEFAULT TRUE
);

-- SETTINGS
CREATE TABLE IF NOT EXISTS settings (
    key VARCHAR(100) PRIMARY KEY,
    value TEXT
);

-- MESSAGE TEMPLATES
CREATE TABLE IF NOT EXISTS message_templates (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    subject VARCHAR(255),
    content TEXT,
    category VARCHAR(50),
    usage_count INT DEFAULT 0
);

-- STUDENTS
CREATE TABLE IF NOT EXISTS students (
    user_id INT PRIMARY KEY REFERENCES users(id),
    registration_number VARCHAR(20) NOT NULL UNIQUE,
    department VARCHAR(50),
    year_of_study INT,
    interests TEXT
);

-- ADMINS
CREATE TABLE IF NOT EXISTS admins (
    user_id INT PRIMARY KEY REFERENCES users(id),
    admin_id VARCHAR(50) NOT NULL UNIQUE,
    department VARCHAR(50),
    permissions TEXT
);

-- CLUBS
CREATE TABLE IF NOT EXISTS clubs (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL UNIQUE,
    slug VARCHAR(100) NOT NULL UNIQUE,
    category VARCHAR(50) NOT NULL,
    description TEXT,
    logo_url VARCHAR(255),
    banner_url VARCHAR(255),
    email VARCHAR(100) NOT NULL UNIQUE,
    founded_date DATE,
    faculty_advisor VARCHAR(100),
    faculty_advisor_email VARCHAR(100),
    contact_person_id INT REFERENCES users(id),
    is_active BOOLEAN DEFAULT TRUE,
    member_count INT DEFAULT 0,
    rating FLOAT DEFAULT 0,
    total_events INT DEFAULT 0,
    tags TEXT,
    engagement INT DEFAULT 0,
    spent INT DEFAULT 0,
    growth INT DEFAULT 0,
    satisfaction FLOAT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'active',
    last_activity DATE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    website VARCHAR(255),
    social_links TEXT,
    recruitment_status VARCHAR(30)
);

-- MESSAGES
CREATE TABLE IF NOT EXISTS messages (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    content TEXT,
    type VARCHAR(30),
    priority VARCHAR(10),
    audience VARCHAR(100),
    status VARCHAR(20),
    sent_at TIMESTAMP,
    scheduled_for TIMESTAMP,
    read_count INT DEFAULT 0,
    total_recipients INT DEFAULT 0,
    channels TEXT
);

-- ACHIEVEMENTS
CREATE TABLE IF NOT EXISTS achievements (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    title VARCHAR(100),
    description TEXT,
    points INT,
    icon VARCHAR(100),
    achieved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- POSTS
CREATE TABLE IF NOT EXISTS posts (
    id SERIAL PRIMARY KEY,
    club_id INT NOT NULL REFERENCES clubs(id),
    author_id INT NOT NULL REFERENCES users(id),
    content TEXT NOT NULL,
    image_urls TEXT,
    video_url VARCHAR(255),
    post_type VARCHAR(30) NOT NULL,
    likes_count INT DEFAULT 0,
    comments_count INT DEFAULT 0,
    shares_count INT DEFAULT 0,
    is_pinned BOOLEAN DEFAULT FALSE,
    is_bookmarked BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    views INT DEFAULT 0,
    status VARCHAR(20) DEFAULT 'published',
    images TEXT
);

-- SAVED POSTS
CREATE TABLE IF NOT EXISTS saved_posts (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    post_id INT NOT NULL REFERENCES posts(id),
    saved_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE(user_id, post_id)
);

-- NOTIFICATIONS
CREATE TABLE IF NOT EXISTS notifications (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    title VARCHAR(255) NOT NULL,
    message TEXT NOT NULL,
    type VARCHAR(20) NOT NULL,
    related_id INT,
    is_read BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- COMMENTS
CREATE TABLE IF NOT EXISTS comments (
    id SERIAL PRIMARY KEY,
    post_id INT NOT NULL REFERENCES posts(id),
    user_id INT NOT NULL REFERENCES users(id),
    user_name VARCHAR(100) NOT NULL,
    user_avatar_url VARCHAR(255),
    content TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    likes INT DEFAULT 0,
    is_liked BOOLEAN DEFAULT FALSE
);

-- CLUB MEMBERS
CREATE TABLE IF NOT EXISTS club_members (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL REFERENCES users(id),
    club_id INT NOT NULL REFERENCES clubs(id),
    role_in_club VARCHAR(50),
    position_title VARCHAR(100),
    joined_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    email VARCHAR(100),
    permissions TEXT,
    join_date DATE,
    avatar VARCHAR(255)
);

-- RECRUITMENT CAMPAIGNS
CREATE TABLE IF NOT EXISTS recruitment_campaigns (
    id SERIAL PRIMARY KEY,
    club_id INT NOT NULL REFERENCES clubs(id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    start_date DATE,
    end_date DATE,
    positions TEXT,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- BUDGETS
CREATE TABLE IF NOT EXISTS budgets (
    id SERIAL PRIMARY KEY,
    club_id INT NOT NULL REFERENCES clubs(id),
    total_allocated INT DEFAULT 0,
    total_spent INT DEFAULT 0,
    total_pending INT DEFAULT 0,
    remaining INT DEFAULT 0,
    events INT DEFAULT 0,
    last_activity DATE
);

-- CERTIFICATES
CREATE TABLE IF NOT EXISTS certificates (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    event_id INT REFERENCES events(id),
    recipient_name VARCHAR(100),
    event_name VARCHAR(255),
    event_date DATE,
    achievement VARCHAR(100),
    signature VARCHAR(100),
    template VARCHAR(50),
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- EVENTS
CREATE TABLE IF NOT EXISTS events (
    id SERIAL PRIMARY KEY,
    club_id INT NOT NULL REFERENCES clubs(id),
    title VARCHAR(255) NOT NULL,
    description TEXT,
    event_type VARCHAR(50) NOT NULL,
    venue VARCHAR(100) NOT NULL,
    venue_id INT,
    start_date TIMESTAMP NOT NULL,
    end_date TIMESTAMP,
    registration_start TIMESTAMP,
    registration_deadline TIMESTAMP,
    max_participants INT,
    current_participants INT DEFAULT 0,
    poster_url VARCHAR(255),
    budget_requested FLOAT,
    budget_approved FLOAT,
    status VARCHAR(30) NOT NULL,
    approval_notes TEXT,
    expected_participants INT,
    submitted_date DATE,
    duration VARCHAR(50),
    requirements TEXT,
    club_logo VARCHAR(255),
    location_id INT REFERENCES locations(id),
    registration_status VARCHAR(20),
    tags TEXT,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- POSTERS
CREATE TABLE IF NOT EXISTS posters (
    id SERIAL PRIMARY KEY,
    event_id INT REFERENCES events(id),
    title VARCHAR(255),
    subtitle VARCHAR(255),
    date DATE,
    time TIME,
    venue VARCHAR(255),
    theme VARCHAR(50),
    color VARCHAR(50),
    description TEXT,
    image_url VARCHAR(255),
    generated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- APPLICATIONS
CREATE TABLE IF NOT EXISTS applications (
    id SERIAL PRIMARY KEY,
    club_id INT NOT NULL REFERENCES clubs(id),
    user_id INT NOT NULL REFERENCES users(id),
    position VARCHAR(100) NOT NULL,
    application_text TEXT,
    resume_url VARCHAR(255),
    portfolio_url VARCHAR(255),
    status VARCHAR(30) NOT NULL,
    applied_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    reviewed_date TIMESTAMP,
    reviewer_notes TEXT,
    campaign_id INT REFERENCES recruitment_campaigns(id),
    quiz_score FLOAT,
    interview_id INT
);

-- REGISTRATIONS
CREATE TABLE IF NOT EXISTS registrations (
    id SERIAL PRIMARY KEY,
    event_id INT NOT NULL REFERENCES events(id),
    user_id INT REFERENCES users(id),
    student_name VARCHAR(100),
    registration_number VARCHAR(20),
    email VARCHAR(100),
    phone VARCHAR(20),
    department VARCHAR(50),
    year_of_study INT,
    registration_date TIMESTAMP,
    status VARCHAR(20),
    avatar VARCHAR(255),
    dietary_restrictions TEXT,
    special_requirements TEXT
);

-- BUDGET REQUESTS
CREATE TABLE IF NOT EXISTS budget_requests (
    id SERIAL PRIMARY KEY,
    club_id INT NOT NULL REFERENCES clubs(id),
    event_id INT REFERENCES events(id),
    event_title VARCHAR(255),
    requested_amount INT,
    approved_amount INT,
    category VARCHAR(100),
    status VARCHAR(20),
    submitted_date DATE,
    purpose TEXT,
    breakdown TEXT
);

-- CONFLICTS
CREATE TABLE IF NOT EXISTS conflicts (
    id SERIAL PRIMARY KEY,
    type VARCHAR(20),
    severity VARCHAR(10),
    title VARCHAR(255),
    description TEXT,
    affected_events TEXT,
    status VARCHAR(20),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- QUIZZES
CREATE TABLE IF NOT EXISTS quizzes (
    id SERIAL PRIMARY KEY,
    campaign_id INT REFERENCES recruitment_campaigns(id),
    title VARCHAR(255),
    domain VARCHAR(100),
    duration INT,
    status VARCHAR(20),
    club_id INT REFERENCES clubs(id),
    description TEXT,
    total_questions INT,
    difficulty VARCHAR(20),
    category VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE,
    attempts INT DEFAULT 0,
    max_attempts INT DEFAULT 1,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- QUIZ QUESTIONS
CREATE TABLE IF NOT EXISTS quiz_questions (
    id SERIAL PRIMARY KEY,
    quiz_id INT NOT NULL REFERENCES quizzes(id),
    question TEXT,
    options TEXT,
    correct_answer TEXT
);

-- QUIZ RESULTS
CREATE TABLE IF NOT EXISTS quiz_results (
    id SERIAL PRIMARY KEY,
    quiz_id INT NOT NULL REFERENCES quizzes(id),
    user_id INT NOT NULL REFERENCES users(id),
    score FLOAT,
    submitted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- INTERVIEWS
CREATE TABLE IF NOT EXISTS interviews (
    id SERIAL PRIMARY KEY,
    application_id INT REFERENCES applications(id),
    candidate_id INT REFERENCES users(id),
    position VARCHAR(100),
    date DATE,
    time TIME,
    type VARCHAR(20),
    status VARCHAR(20),
    notes TEXT
);

-- POST LIKES
CREATE TABLE IF NOT EXISTS post_likes (
    id SERIAL PRIMARY KEY,
    post_id INT NOT NULL REFERENCES posts(id),
    user_id INT NOT NULL REFERENCES users(id)
);

-- CLUB APPLICATIONS
CREATE TABLE IF NOT EXISTS club_applications (
    id SERIAL PRIMARY KEY,
    club_id INT NOT NULL REFERENCES clubs(id),
    user_id INT NOT NULL REFERENCES users(id),
    position VARCHAR(100),
    application_text TEXT,
    status VARCHAR(30),
    applied_date TIMESTAMP,
    quiz_responses TEXT,
    quiz_score INT
); 