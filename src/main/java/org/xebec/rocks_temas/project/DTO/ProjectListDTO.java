package org.xebec.rocks_temas.project.DTO;

import java.util.List;

public record ProjectListDTO(int pageNumber,
                             int pageSize,
                             int totalPages,
                             long totalItems,
                             List<ProjectDTO> projects) {
}
