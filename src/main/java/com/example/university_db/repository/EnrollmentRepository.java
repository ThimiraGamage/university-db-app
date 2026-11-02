
package com.example.universitydb.repository;

import com.example.universitydb.model.Enrollment;
import com.example.universitydb.dto.CourseEnrollmentCount;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface EnrollmentRepository extends JpaRepository<Enrollment, Long> {

    List<Enrollment> findByStudent_StudentCode(String studentCode);

    List<Enrollment> findByCourse_Code(String courseCode);

    Optional<Enrollment> findByStudent_StudentCodeAndCourse_Code(
            String studentCode, String courseCode);

    boolean existsByStudent_StudentCodeAndCourse_Code(
            String studentCode, String courseCode);

    long countByCourse_Code(String courseCode);

    @Query("""
           SELECT new com.example.universitydb.dto.CourseEnrollmentCount(
               e.course.code, COUNT(e)
           )
           FROM Enrollment e
           GROUP BY e.course.code
           """)
    List<CourseEnrollmentCount> countEnrollmentsByCourse();
}
