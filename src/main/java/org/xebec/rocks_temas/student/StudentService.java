package org.xebec.rocks_temas.student;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.xebec.rocks_temas.exceptions.StudentNotFoundException;
import org.xebec.rocks_temas.student.DTO.StudentDTO;

import java.util.Optional;
import java.util.UUID;

@Service
public class StudentService {

    private StudentRepository studentRepository;

    @Autowired
    public StudentService(StudentRepository studentRepository) {
        this.studentRepository = studentRepository;
    }

    public StudentDTO getStudentByStudentNumber(int id) throws StudentNotFoundException {

        Optional<Student> returnedStudent = studentRepository.findByStudentNumber(id);

        if (returnedStudent.isPresent()) {
            Student student = returnedStudent.get();
            StudentDTO returned = new StudentDTO(
                    student.getStudentNumber(),
                    student.getName(),
                    student.getEmail(),
                    student.getCourse());
            return returned;

        }
        //tratamento de erro

        throw new StudentNotFoundException("Student not found");

    }

    public Student getStudentById(UUID id) throws StudentNotFoundException {

        Optional<Student> returnedStudent = studentRepository.findById(id);

        if (returnedStudent.isPresent()) {
            Student student = returnedStudent.get();
//            return new StudentDTO(student.getId(),
//                    student.getStudentNumber(),
//                    student.getName(),
//                    student.getEmail(),
//                    student.getCourse().getName());
            return student;
        }
        throw new StudentNotFoundException("Student not found");
    }
}
