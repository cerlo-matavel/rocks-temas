package org.xebec.rocks_temas;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;
import org.xebec.rocks_temas.project.ProjectState;

@SpringBootTest
class RocksCrudApplicationTests {

    @Test
    void contextLoads() {

        ProjectState state  = ProjectState.APPROVED;
        System.out.println(state);
    }

}
