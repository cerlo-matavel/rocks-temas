package org.xebec.rocks_temas.student.DTO;

import org.xebec.rocks_temas.course.Course;

public record StudentDTO(int student_number, String name, String email, Course course) {
}
