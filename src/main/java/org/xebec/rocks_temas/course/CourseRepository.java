package org.xebec.rocks_temas.course;

import org.springframework.data.jpa.repository.JpaRepository;
import org.xebec.rocks_temas.project.Project;

import java.util.UUID;

public interface CourseRepository extends JpaRepository<Project, UUID> {
}
