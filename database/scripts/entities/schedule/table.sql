CREATE TABLE schedule (
    schedule_id  INT          NOT NULL AUTO_INCREMENT,
    lesson_id    INT          NOT NULL,
    classroom_id INT          NOT NULL,
    weekday      TINYINT      NOT NULL,
    start_time   TIME         NOT NULL,
    end_time     TIME         NOT NULL,

    PRIMARY KEY (schedule_id),

    CONSTRAINT fk_schedule_lesson_id
        FOREIGN KEY (lesson_id) REFERENCES lessons (lesson_id)
        ON UPDATE CASCADE,

    CONSTRAINT fk_schedule_classroom_id
        FOREIGN KEY (classroom_id) REFERENCES classrooms (classroom_id)
        ON UPDATE CASCADE,

    CONSTRAINT chk_schedule_time CHECK (end_time > start_time),
    CONSTRAINT chk_schedule_weekday CHECK (weekday BETWEEN 1 AND 7),

    CONSTRAINT uq_schedule_classroom_weekday_start
        UNIQUE (classroom_id, weekday, start_time)
) ENGINE=InnoDB;
