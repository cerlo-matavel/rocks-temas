package org.xebec.rocks_crud.project.DTO;

import lombok.NonNull;
import org.xebec.rocks_crud.student.DTO.StudentDTO;

public record ProjectResponseDTO(@NonNull StudentDTO student,
                                 @NonNull ProjectDTO project) {
}
