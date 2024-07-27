package org.xebec.rocks_temas.student;

import jakarta.persistence.*;
import lombok.*;
import org.xebec.rocks_temas.course.Course;

import java.util.UUID;

@Entity
@Table(name = "student")
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    private UUID id;

    @Column(nullable = false)
    private String name;

    @Column(nullable = false)
    private String email;

    @Column(nullable = false)
    private int studentNumber;

    @ManyToOne
    @JoinColumn(name = "course_id", nullable = false)
    private Course course;
}
