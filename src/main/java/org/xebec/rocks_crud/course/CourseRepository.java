package org.xebec.rocks_crud.course;

import org.springframework.data.jpa.repository.JpaRepository;
import org.xebec.rocks_crud.project.Project;

import java.util.UUID;

public interface CourseRepository extends JpaRepository<Project, UUID> {
}
