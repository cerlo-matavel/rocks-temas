package org.xebec.rocks_temas.project;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.xebec.rocks_temas.exceptions.ProjectNotFoundException;
import org.xebec.rocks_temas.exceptions.StudentNotFoundException;
import org.xebec.rocks_temas.project.DTO.ProjectCreateRequestDTO;
import org.xebec.rocks_temas.project.DTO.ProjectCreateResponseDTO;
import org.xebec.rocks_temas.student.Student;
import org.xebec.rocks_temas.student.StudentService;

import java.util.Optional;
import java.util.UUID;

@Service
public class ProjectService {

    private final ProjectRepository projectRepository;
    private final StudentService studentService;

    @Autowired
    public ProjectService(ProjectRepository projectRepository,
                          StudentService studentService) {
        this.projectRepository = projectRepository;
        this.studentService = studentService;
    }

    @Transactional
    public ProjectCreateResponseDTO registerProject(ProjectCreateRequestDTO payload) throws StudentNotFoundException {

        Student recoveredStudent = studentService.getStudentById(UUID.fromString(payload.student_id()));

        Project newProject = new Project(payload, recoveredStudent);

        projectRepository.save(newProject);

        return new ProjectCreateResponseDTO(newProject.getId());
    }

    @Transactional
    public Page<Project> getAllProjects(int pageNumber, int pageSize) {
        Pageable pageable = PageRequest.of(pageNumber, pageSize);

        Page<Project> page = projectRepository.findAll(pageable);
//       Page<Project> page = projectRepository.findByThemeContainingIgnoreCase(theme,pageable);

        return page;
    }

    @Transactional
    public boolean deleteProjectById(UUID id) {
        if (projectRepository.existsById(id)) {
            projectRepository.deleteById(id);
            return true;
        }
        return false;
    }

    /*public ProjectResponseDTO findProjectById(UUID id) throws StudentNotFoundException {

        Optional<Project> optionalProject = projectRepository.findById(id);

        if (optionalProject.isPresent()){
            Project project = optionalProject.get();

            return new ProjectResponseDTO(new StudentDTO(
                    project.getStudent().getId(),
                    project.getStudent().getStudentNumber(),
                    project.getStudent().getName(),
                    project.getStudent().getEmail(),
                    project.getStudent().getCourse().getName()
            ),
                    new ProjectDTO(project.getId(),
                            project.getTheme(),
                            project.getGeneral_objective(),
                            project.getSpecific_objectives(),
                            project.getProblem()
                    )
            );
        }
        throw new StudentNotFoundException("Student not found");

    }*/

    public Project findProjectById(UUID id) {
        Optional<Project> optionalProject = projectRepository.findById(id);

        if (optionalProject.isPresent()) {
            Project project = optionalProject.get();
            System.out.println(project);
            return project;
        }

        throw new ProjectNotFoundException("This project doesn't exist");
    }
}
