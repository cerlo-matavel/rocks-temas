package org.xebec.rocks_crud.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.xebec.rocks_crud.exceptions.StudentNotFoundException;
import org.xebec.rocks_crud.project.DTO.*;
import org.xebec.rocks_crud.student.StudentRepository;

import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/projects")
public class ProjectController {

    private ProjectService projectService;

    @Autowired
    public ProjectController(ProjectService projectService) {
        this.projectService = projectService;
    }

    @PostMapping("/")
    public ResponseEntity<ProjectCreateResponseDTO> createProject(@RequestBody ProjectCreateRequestDTO payload)
            throws StudentNotFoundException {

        ProjectCreateResponseDTO response = projectService.saveProject(payload);

        return ResponseEntity.status(HttpStatus.CREATED).body(response);
    }

    /*@GetMapping("/{id}")
    public ResponseEntity<ProjectResponseDTO> retrieveProject(@PathVariable UUID id) throws StudentNotFoundException {
        ProjectResponseDTO project = projectService.findProjectById(id);

        return ResponseEntity.ok(project);
    }*/

    @GetMapping("/{id}")
    public ResponseEntity<Project> retrieveProject(@PathVariable UUID id){
        Project project = projectService.findProjectById(id);

        return ResponseEntity.ok(project);
    }

    @GetMapping(params = { "page", "size" })
    public ResponseEntity<ProjectResponseListDTO> findPaginated(@RequestParam("page") int page,
                                                                @RequestParam("size") int size){
        List<ProjectResponseDTO> list = projectService.getAllProjects(page,size);
        ProjectResponseListDTO projects = new ProjectResponseListDTO(list);

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
