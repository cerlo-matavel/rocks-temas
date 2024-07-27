package org.xebec.rocks_temas.project.DTO;

import lombok.NonNull;
import org.xebec.rocks_temas.student.DTO.StudentDTO;

import java.time.LocalDateTime;
import java.util.UUID;

public record ProjectDTO(
        @NonNull UUID id,
        @NonNull String theme,
        @NonNull String general_objective,
        @NonNull String specific_objectives,
        @NonNull String problem,
        LocalDateTime time_submitted,
        LocalDateTime time_graded,
        String comment,
        String state,
        @NonNull StudentDTO student
        ){
}
