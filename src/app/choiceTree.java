package app;

import java.sql.SQLException;
import java.util.Scanner;

public class choiceTree {
    static void printMenu() {
        System.out.println("Salon samochodowy:\n    1)Katalog samochodow\n    2)Dostepne na miejscu samochody\n    3)Klienci\n" +
                "    4)Zamowienia\n    5)Wyjscie\n\nWprowadz numer opcji i zatwierdz klawiszem Enter: ");
    }

    static void menuLoop() throws SQLException {
        printMenu();
        Scanner scanner = new Scanner(System.in);
        int choice = scanner.nextInt();
        switch(choice) {
            case 1:
                carsCatalog();
                break;
            case 2:
                availableCars();
                break;
            case 3:
                clientsMenu();
                break;
            case 4:
                ordersMenu();
                break;
            case 5:
                System.out.println("Do zobaczenia!");
                break;
    }
}

    private static void ordersMenu() throws SQLException {
        System.out.println("Co chcesz zrobic?\n    1)Wyswietl wszystkie zamowienia\n    2)Wyswietl zamowienia danego " +
                "klienta\n    3)Dodaj nowe zamowienie\n    4)Usun zamowienie\n    5)Edytuj zamowienie" +
                "\n    6)Wroc do menu\n\nWprowadz numer opcji i zatwierdz klawiszem Enter: ");
        Scanner scanner = new Scanner(System.in);
        int choice = scanner.nextInt();
        int clientId;
        int orderId;
        int carId;
        String orderDate;
        String paymentMethod;

        switch (choice) {
            case 1:
                Queries.viewOrders();
                System.out.println();
                menuLoop();
                break;
            case 2:
                System.out.println("Wprowadz id klienta: ");
                clientId = scanner.nextInt();
                Queries.viewOrdersByClientId(clientId);
                System.out.println();
                menuLoop();
                break;
            case 3:
                System.out.println("Wprowadz id klienta: ");
                clientId = scanner.nextInt();
                System.out.println("Wprowadz id samochodu: ");
                carId = scanner.nextInt();
                System.out.println("Wprowadz date w formacie 'YYYY-MM-DD': ");
                orderDate = scanner.next();
                System.out.println("Wybierz metode platnosci: ");
                paymentMethod = paymentMethod();
                Queries.addOrder(clientId, carId, orderDate, paymentMethod);
                System.out.println();
                menuLoop();
                break;
            case 4:
                System.out.println("Wprowadz id zamowienia ktore chcesz usunac: ");
                orderId = scanner.nextInt();
                Queries.deleteOrder(orderId);
                System.out.println();
                menuLoop();
                break;

            case 5:
                System.out.println("Wprowadz id zamowienia ktore chcesz edytowac: ");
                orderId = scanner.nextInt();
                System.out.println("Wprowadz id klienta: ");
                clientId = scanner.nextInt();
                System.out.println("Wprowadz id samochodu: ");
                carId = scanner.nextInt();
                System.out.println("Wprowadz date w formacie 'YYYY-MM-DD': ");
                orderDate = scanner.next();
                System.out.println("Wybierz metode platnosci: ");
                paymentMethod = paymentMethod();
                Queries.updateOrder(orderId, clientId, carId, orderDate, paymentMethod);
                System.out.println();
                menuLoop();
                break;
            case 6:
                menuLoop();
                break;
            }
        }

    private static String paymentMethod() {
        System.out.println("    1)Gotowka\n    2)Karta\n    3)Blik\n\nWprowadz numer opcji i zatwierdz klawiszem Enter: ");
        Scanner scanner = new Scanner(System.in);
        int choice = scanner.nextInt();
        switch (choice) {
            case 1:
                return "Gotowka";
            case 2:
                return "Karta";
            case 3:
                return "Blik";
        }
        return null;
    }

    private static void clientsMenu() throws SQLException {
        System.out.println("Co chcesz zrobic?\n    1)Wyswietl wszystkich klientow\n    2)Znajdz klienta po nazwisku \n" +
                "    3)Wyswietl klientow pomiedzy dwoma wartosciami id\n    4)Zarzadzaj klientami\n    5)Wroc do menu" +
                "\n\n" +
                "Wprowadz numer opcji i zatwierdz klawiszem Enter: ");
        Scanner scanner = new Scanner(System.in);
        int choice = scanner.nextInt();
        switch (choice) {
            case 1:
                Queries.listClients();
                break;
            case 2:
                clientByLastName();
                break;
            case 3:
                clientsById();
                break;
            case 4:
                clientsManagement();
                break;
            case 5:
                menuLoop();
                break;
        }
        menuLoop();
    }

    private static void clientsManagement() throws SQLException {
        System.out.println("    1)Dodaj nowego klienta\n    2)Usun klienta\n    3)Aktualizuj dane klienta\n    " +
                "4)Wroc do menu\n\nWprowadz numer opcji i potwierdz klawiszem Enter: ");
        Scanner scanner = new Scanner(System.in);
        int choice = scanner.nextInt();
        int id;
        String firstName;
        String lastName;
        switch (choice) {
            case 1:
                System.out.println("Wprowadz imie klienta: ");
                firstName = scanner.next();
                System.out.println("Wprowadz nazwisko klienta: ");
                lastName = scanner.next();
                Queries.addClient(firstName, lastName);
                System.out.println();
                menuLoop();
                break;
            case 2:
                System.out.println("Wprowadz id klienta ktorego chcesz usunac: ");
                id = scanner.nextInt();
                Queries.delClient(id);
                System.out.println();
                menuLoop();
                break;
            case 3:
                System.out.println("Wprowadz id klienta ktorego dane chcesz zaktualizowac: ");
                id = scanner.nextInt();
                System.out.println("Wprowadz imie klienta: ");
                firstName = scanner.next();
                System.out.println("Wprowadz nazwisko klienta: ");
                lastName = scanner.next();
                Queries.updateClientData(id, firstName, lastName);
                System.out.println();
                menuLoop();
                break;
            case 4:
                menuLoop();
                break;
        }
    }

    private static void clientsById() throws SQLException {
        System.out.println("Wprowadz dolna granice");
        Scanner scanner = new Scanner(System.in);
        int min = scanner.nextInt();
        System.out.println("Wprowadz gorna granice");
        int max = scanner.nextInt();
        Queries.viewClientsByIdRange(min, max);
        System.out.println();
        menuLoop();
    }

    private static void clientByLastName() throws SQLException {
        System.out.println("Wprowadz nazwisko klienta: ");
        Scanner scanner = new Scanner(System.in);
        String lastName = scanner.next();
        Queries.viewClientsByLastName(lastName);
        System.out.println();
        menuLoop();
    }

    private static void availableCars() throws SQLException {
        System.out.println("Jak posortowac wyniki?");
        int orderBy = orderChoice();
        Queries.listAvailableCars(orderBy);
        System.out.println();
        menuLoop();
    }

    static void carsCatalog() throws SQLException {
        System.out.println("Co chcesz zrobic?\n    1)Wyswietl samochody\n    " +
                "2)Zamow samochod do salonu\n    3)Wroc do menu\n\nWprowadz numer opcji i zatwierdz klawiszem Enter: ");
        Scanner scanner = new Scanner(System.in);
        int choice = scanner.nextInt();
        switch(choice) {
            case 1:
                choiceTree.viewCars();
                break;
            case 2:
                carOrder();
                break;
            case 3:
                menuLoop();
                break;
        }
    }

    private static void carOrder() throws SQLException {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Wprowadz id samochodu ktory chcesz zamowic: ");
        int carId = scanner.nextInt();
        System.out.println("Ile sztuk chcesz zamowic? ");
        int quantity = scanner.nextInt();
        Queries.addQuantity(carId, quantity);
        System.out.println();
        menuLoop();
    }

    private static int orderChoice () {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Jak posortowac wyniki wyszukiwania?\n     1)po nazwie marki\n     2)po nazwie modelu\n" +
                "     3)po typie nadwozia\n     4)po rodzaju paliwa\n     5)po pojemnosci silnika\n     " +
                "6)po ukladzie silnika\n     7)po wartosci mocy\n     8)po wartosci momentu obrotowego\n     " +
                "9)po kolorze\n\nWprowadz numer opcji i zatwierdz klawiszem Enter: ");
        int choice = scanner.nextInt();
        return choice;
    }

    private static void viewCars() throws SQLException {
        System.out.println("    1)Wyswietl wszystkie\n    2)Wyswietl wybrane\n\nWprowadz numer opcji i " +
                "zatwierdz klawiszem Enter: ");
        Scanner scanner = new Scanner(System.in);
        int choice = scanner.nextInt();
        switch (choice) {
            case 1:
                int orderChoice = orderChoice();
                Queries.listAllCars(orderChoice);
                System.out.println();
                menuLoop();
                break;
            case 2:
                System.out.println("    1)Marka\n    2)Rodzaj paliwa\n    " +
                        "3)Kolor\n\nWprowadz numer opcji i zatwierdz klawiszem Enter: ");
                choice = scanner.nextInt();
                System.out.println("Wprowadz oczekiwana wartosc, np. Mazda w przypadku marki: ");
                String filterBy = scanner.next();
                Queries.viewChosen(choice, filterBy);
                System.out.println();
                menuLoop();
                break;
        }
    }
}
