package org.xebec.rocks_crud.student.DTO;

import java.util.UUID;

public record StudentDTO(UUID id, int student_number, String name, String email, String course) {
}
