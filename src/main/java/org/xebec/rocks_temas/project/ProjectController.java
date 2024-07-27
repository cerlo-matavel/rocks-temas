package org.xebec.rocks_temas.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.xebec.rocks_temas.exceptions.StudentNotFoundException;
import org.xebec.rocks_temas.project.DTO.*;
import org.xebec.rocks_temas.student.DTO.StudentDTO;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/projects")
public class ProjectController {

    private final ProjectService projectService;

    @Autowired
    public ProjectController(ProjectService projectService) {
        this.projectService = projectService;
    }

    @PostMapping("/")
    public ResponseEntity<ProjectCreateResponseDTO> createProject(@RequestBody ProjectCreateRequestDTO payload)
            throws StudentNotFoundException {

        ProjectCreateResponseDTO response = projectService.registerProject(payload);

        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Project> getProject(@PathVariable UUID id) {
        Project project = projectService.findProjectById(id);
        return ResponseEntity.ok(project);
    }

    @GetMapping
    public ResponseEntity<ProjectListDTO> getProjectsPaged(
            @RequestParam(defaultValue = "1") int page,
            @RequestParam(defaultValue = "10") int size,
            @RequestParam(required = false) String theme ,
            @RequestParam(defaultValue = "asc") String order ,
            @RequestParam(required = false) String studentName ,
            @RequestParam( defaultValue = "-1") int studentNumber,
            @RequestParam( defaultValue = "-1") int evaluation) {

        Page<Project> list = projectService.getAllProjects(page - 1, size);

        List<ProjectDTO> projectDTOList = list.getContent().stream().map(
                project -> new ProjectDTO(project.getId(),
                        project.getTheme(),
                        project.getGeneral_objective(),
                        project.getSpecific_objectives(),
                        project.getProblem(),
                        project.getTime_submitted(),
                        project.getTime_graded(),
                        project.getComment(),
                        project.getState().getProjectState(),
                        new StudentDTO(
                                project.getStudent().getStudentNumber(),
                                project.getStudent().getName(),
                                project.getStudent().getEmail(),
                                project.getStudent().getCourse()
                        )
                )
        ).toList();

        ProjectListDTO projects = new ProjectListDTO(page,
                size,
                                                    list.getTotalPages(),
                                                    list.getTotalElements(),
                                                    projectDTOList);

        return ResponseEntity.ok(projects);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProject(@PathVariable UUID id) {

        if (projectService.deleteProjectById(id)) {
            return ResponseEntity.noContent().build();
        }

        return ResponseEntity.notFound().build();
    }
}
