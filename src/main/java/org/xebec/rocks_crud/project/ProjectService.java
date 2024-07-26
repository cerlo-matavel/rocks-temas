package org.xebec.rocks_crud.project;

import jakarta.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.xebec.rocks_crud.exceptions.ProjectNotFoundException;
import org.xebec.rocks_crud.exceptions.StudentNotFoundException;
import org.xebec.rocks_crud.project.DTO.ProjectCreateRequestDTO;
import org.xebec.rocks_crud.project.DTO.ProjectCreateResponseDTO;
import org.xebec.rocks_crud.project.DTO.ProjectDTO;
import org.xebec.rocks_crud.project.DTO.ProjectResponseDTO;
import org.xebec.rocks_crud.student.Student;
import org.xebec.rocks_crud.student.DTO.StudentDTO;
import org.xebec.rocks_crud.student.StudentService;

import java.util.List;
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
    public ProjectCreateResponseDTO saveProject(ProjectCreateRequestDTO payload) throws StudentNotFoundException {

        Student recoveredStudent = studentService.getStudentById(UUID.fromString(payload.student_id()));

        Project newProject = new Project(payload, recoveredStudent);

        projectRepository.save(newProject);

        return new ProjectCreateResponseDTO(newProject.getId());
    }

    @Transactional
    public List<ProjectResponseDTO> getAllProjects(int pageNumber, int pageSize) {
        Pageable page = PageRequest.of(pageNumber, pageSize);

        Page<Project> getList = projectRepository.findAll(page);

        getList.forEach(System.out::println);

        List<ProjectResponseDTO> projectCreateRequestDTOList = getList.getContent().stream().map(
                project ->
                        new ProjectResponseDTO(new StudentDTO(
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
                        )
        ).toList();

        return projectCreateRequestDTOList;
    }

    public boolean existsById(UUID id) {
        return projectRepository.existsById(id);
    }

    @Transactional
    public boolean deleteProjectById(UUID id) {
        if (this.existsById(id)) {
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
