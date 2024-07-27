package org.xebec.rocks_temas.project;

import jakarta.persistence.*;
import lombok.*;
import org.xebec.rocks_temas.project.DTO.ProjectCreateRequestDTO;
import org.xebec.rocks_temas.student.Student;
import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "project")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Project{

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Column(nullable = false)
    private String theme;

    @Column(nullable = false)
    private String general_objective;

    @Column(nullable = false)
    private String specific_objectives;

    @Column(nullable = false)
    private String problem;

    @Column(nullable = false)
    private LocalDateTime time_submitted;

    @Column
    private LocalDateTime time_graded;

    @Column
    private String comment;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private ProjectState state;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    public Project(ProjectCreateRequestDTO payload, Student student) {
        this.theme = payload.theme();
        this.general_objective = payload.general_objective();
        this.specific_objectives = payload.specific_objectives();
        this.problem = payload.problem();
        this.time_submitted= LocalDateTime.now();
        this.state = ProjectState.SUBMITTED;
        this.student = student;
    }

}
