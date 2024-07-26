package org.xebec.rocks_crud.project.DTO;

import lombok.NonNull;
import org.xebec.rocks_crud.student.DTO.StudentDTO;

import java.util.UUID;

public record ProjectDTO(
        @NonNull UUID id,
        @NonNull String theme,
        @NonNull String general_objective,
        @NonNull String specific_objectives,
        @NonNull String problem
//        @NonNull StudentDTO student
        ){
}
