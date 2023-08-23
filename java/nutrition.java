import java.util.Scanner;

public class nutrition {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        System.out.println("Enter name: ");
        String name = sc.nextLine();
        System.out.println("Number of carbs: ");
        double carbsGrams = sc.nextDouble();
        System.out.println("Amount of fat: ");
        double fatGrams = sc.nextDouble();
        System.out.println("Amount of protein: ");
        double proteinGrams = sc.nextDouble();
        System.out.println("Stated Calories: ");
        double statedCals = sc.nextDouble();

        double carbsCals1 = Math.round(carbsGrams * 4 * 10);
        double carbsCals = carbsCals1 / 10;

        double fatCals1 = Math.round(fatGrams * 9 * 10);
        double fatCals = fatCals1 / 10;

        double proteinCals1 = Math.round(proteinGrams * 4 * 10);
        double proteinCals = proteinCals1 / 10;
        
        double unavailableCals1 = Math.round(((carbsCals + fatCals + proteinCals) - statedCals) * 10);
        double unavailableCals = unavailableCals1 / 10;

        double fiberGrams1 = Math.round((unavailableCals / 4) * 10);
        double fiberGrams = fiberGrams1 / 10;

        double percentCarbs1 = Math.round((carbsCals / statedCals) * 1000);
        double percentCarbs = percentCarbs1 / 10;

        double percentFat1 = Math.round((fatCals / statedCals) * 1000);
        double percentFat = percentFat1 / 10;

        double percentProtein1 = Math.round((proteinCals / statedCals) * 1000);
        double percentProtein = percentProtein1 / 10;

        boolean isLowCarb = percentCarbs < 25;
        boolean isLowFat = percentFat < 15;
        boolean coinFlip = Math.random() < 0.5;

        System.out.println(name + " has ");
        System.out.println(carbsGrams + " grams from carbohydrates = " + carbsCals  + " Calories");
        System.out.println(fatGrams + " grams from fat = " + fatCals  + " Calories");
        System.out.println(proteinGrams + " grams from protein = " + proteinCals  + " Calories");
        System.out.println("\n");

        System.out.println("This is said to have " + statedCals + " (available) Calories.");
        System.out.println("With " + unavailableCals  + " Calories unavailable, this food has " + fiberGrams  + " grams of fiber.");
        System.out.println("\n");

        System.out.println("Approximately:");
        System.out.println("\t" + percentCarbs  + "% of your food is carbohydrates");
        System.out.println("\t" + percentFat  + "% of your food is fat");
        System.out.println("\t" + percentProtein  + "% of your food is protein");
        System.out.println("\n");

        System.out.println("This food is acceptable for a low-carb diet? \t" + isLowCarb);
        System.out.println("This food is acceptable for a low-fat diet? \t" + isLowFat);
        System.out.println("By coin flip, you should eat this food? \t" + coinFlip);

    }
}