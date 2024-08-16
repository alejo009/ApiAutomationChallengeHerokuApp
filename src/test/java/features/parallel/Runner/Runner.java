package features.parallel.Runner;

import com.intuit.karate.Results;
import org.junit.jupiter.api.Test;

import static org.junit.jupiter.api.Assertions.assertEquals;

public class Runner {
    @Test
    void testParallel() {
        Results results = com.intuit.karate.Runner.path("classpath:features").parallel(5);
        assertEquals(0, results.getFailCount(), results.getErrorMessages());
    }
}
