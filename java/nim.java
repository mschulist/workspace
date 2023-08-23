import java.util.Scanner;
import java.util.Random;
import java.util.List;
import java.util.ArrayList;


public class nim {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        Random rand = new Random();

        int nSticks = 7;
        int round = 0;

        System.out.println("Computer starts");

        List<Integer> moves = new ArrayList<Integer>();

        while (nSticks > 0) {
            if (nSticks == 1) {
                moves.add(1);
            } else {
                moves.add(rand.nextInt(2) + 1);
            }

            System.out.println("Round " + round + ", " + nSticks + " sticks at start, computer took " + moves.get(round) + ", so " + (nSticks - moves.get(round)) + " sticks remain");

            nSticks -= moves.get(round);

            if (nSticks == 0) {
                System.out.println("Computer wins!");
                break;
            }

            round++;

            System.out.println("Round " + round + ", " + nSticks + " sticks at start, your turn. How many sticks do you take?");
            while (true) {
                int nTake = sc.nextInt();
                if (nTake < 1 || nTake > 2) {
                    System.out.println("You can only take 1 or 2 sticks. Try again.");
                } else {
                    moves.add(nTake);
                    nSticks -= nTake;
                    break;
                }
            }
            round++;
            if (nSticks == 0) {
                System.out.println("You win!");
                break;
            }

        }
    }
}