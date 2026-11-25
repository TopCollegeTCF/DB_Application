CREATE TABLE attendance (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT NOT NULL,
    lesson_id INT NOT NULL,
    status ENUM('present', 'absent', 'late', 'excused') NOT NULL,
    marked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY (student_id, lesson_id),
    CONSTRAINT fk_attendance_student FOREIGN KEY (student_id) REFERENCES students(id) ON UPDATE CASCADE,
    CONSTRAINT fk_attendance_lesson FOREIGN KEY (lesson_id) REFERENCES lessons(id) ON UPDATE CASCADE
);
