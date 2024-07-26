package org.xebec.rocks_crud.project;

import org.springframework.data.jpa.repository.JpaRepository;

import java.awt.print.Pageable;
import java.util.List;
import java.util.UUID;

public interface ProjectRepository extends JpaRepository<Project, UUID> {

//    List<Project> findAll(Pageable pageable);
}
