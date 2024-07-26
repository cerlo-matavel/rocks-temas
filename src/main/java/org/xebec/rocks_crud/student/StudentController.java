package org.xebec.rocks_crud.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.xebec.rocks_crud.exceptions.StudentNotFoundException;
import org.xebec.rocks_crud.student.DTO.StudentIdDTO;

import java.util.List;

@Controller
@RequestMapping("/students")
public class StudentController {

    private StudentRepository studentRepository;
    private StudentService studentService;

    @Autowired
    public StudentController(StudentRepository studentRepository, StudentService studentService) {
        this.studentRepository = studentRepository;
        this.studentService = studentService;
    }

    @GetMapping("/")
    public ResponseEntity<List<Student>> getStudents(){
        return ResponseEntity.ok(studentRepository.findAll());
    }

    @PostMapping("/")
    public ResponseEntity<Student> getStudent(@RequestBody StudentIdDTO student) throws StudentNotFoundException {
        return ResponseEntity.ok(studentService.getStudentById(student.studentId()));
    }
}
