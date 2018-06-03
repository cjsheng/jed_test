import cases.Aggre;

import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

/**
 * Created by xuhaihua on 17-3-18.
 */
public class Test {

    public static void main(String[] args) {
        ExecutorService executor = Executors.newFixedThreadPool(5);

        for (int i = 0; i < 1; i++) {
            Runnable worker = new Aggre();
            executor.execute(worker);
        }
    }
}
