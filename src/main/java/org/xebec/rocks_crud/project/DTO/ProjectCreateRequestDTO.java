package org.xebec.rocks_crud.project.DTO;

import lombok.NonNull;

public record ProjectCreateRequestDTO(@NonNull String student_id,
                                      @NonNull String theme,
                                      @NonNull String general_objective,
                                      @NonNull String specific_objectives,
                                      @NonNull String problem
) {

}
