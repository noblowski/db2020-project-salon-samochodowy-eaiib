package app;
import javax.xml.crypto.Data;
import java.sql.*;
import java.util.Scanner;

public class Queries {
    private static Connection DatabaseConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            connection = DriverManager.getConnection("jdbc:mysql://localhost/salon?serverTimezone=UTC", "root", "root");
            System.out.println("connected");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }

    private static ResultSet executeQuery(String query) throws SQLException {
        Connection connection = DatabaseConnection();
        Statement statement = connection.createStatement();
        ResultSet resultSet = null;
        try {
            resultSet = statement.executeQuery(query);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return resultSet;
    }

    static void listClients() throws SQLException {
        ResultSet rs = executeQuery("select * from klienci");
        while (rs.next())
            System.out.println(rs.getInt(1) + " | " + rs.getString(2) + " | "
                    + rs.getString(3));
    }

    static void addBrand(String brandName) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "insert into salon.marki (nazwa) values (?)";
        try {
            PreparedStatement statement = connection.prepareStatement(temp);
            statement.setString(1, brandName);
            int rowsInserted = statement.executeUpdate();
            if(rowsInserted > 0 ) System.out.println("Marka dodana!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static void addClient(String firstName, String lastName) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "insert into salon.klienci (imie, nazwisko) values (?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(temp);
            statement.setString(1, firstName);
            statement.setString(2, lastName);
            int rowsInserted = statement.executeUpdate();
            if(rowsInserted > 0 ) System.out.println("Klient dodany!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static void delClient(int id) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "delete from salon.klienci where idKlienta = ?";
        try {
            PreparedStatement statement = connection.prepareStatement(temp);
            statement.setString(1, String.valueOf(id));
            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) System.out.println("Klient usunięty!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
    static void viewClientsByLastName(String lastName) throws SQLException {
        String temp = "select * from salon.klienci where Nazwisko = '" + lastName + "'";
        ResultSet rs = executeQuery(temp);
        while (rs.next())
            System.out.println(rs.getInt(1) + " | " + rs.getString(2) + " | "
                    + rs.getString(3));
    }

    static void viewClientsByIdRange(int min, int max) throws SQLException {
        String temp = "select * from salon.klienci where idKlienta between " + min + " and " + max;
        ResultSet rs = executeQuery(temp);
        while (rs.next())
            System.out.println(rs.getInt(1) + " | " + rs.getString(2) + " | "
                    + rs.getString(3));
    }

    static void updateClientData (int clientId, String firstName, String lastName) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "update salon.klienci set Imie = ?, Nazwisko = ? where idKlienta = ?";
        PreparedStatement statement = connection.prepareStatement(temp);
        statement.setString(1, firstName);
        statement.setString(2, lastName);
        statement.setString(3, String.valueOf(clientId));

        int rowsUpdated = statement.executeUpdate();
        if (rowsUpdated > 0) {
            System.out.println("Dane klienta zaktualizowane!");
        }
    }

    static void viewOrders() throws SQLException{
        ResultSet resultSet = executeQuery("select * from salon.zamowienia");
        while (resultSet.next())
            System.out.println(resultSet.getInt(1) + " | " + resultSet.getInt(2) + " | "
            + resultSet.getInt(3) + " | " + resultSet.getDate(4) + " | "
                    + resultSet.getString(5));
    }

    static void viewOrdersByClientId(int clientId) throws SQLException{
        ResultSet resultSet = executeQuery("select * from salon.zamowienia where idKlienta = " + clientId);
        while (resultSet.next())
            System.out.println(resultSet.getInt(1) + " | " + resultSet.getInt(2) + " | "
                    + resultSet.getInt(3) + " | " + resultSet.getDate(4) + " | "
                    + resultSet.getString(5));
    }

    static void updateOrder(int orderId, int clientId, int carId, String orderDate, String paymentMethod) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "update salon.zamowienia set idKlienta = ?, idSamochodu = ?, data_zamowienia = ?, " +
                "metoda_platnosci = ? where idZamowienia = " + orderId;
        try {
            orderEdit(clientId, carId, orderDate, paymentMethod, connection, temp);
            int rowsUpdated = 0;
            if(rowsUpdated > 0 ) System.out.println("Zamowienie zaktualizowane!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    private static void orderEdit(int clientId, int carId, String orderDate, String paymentMethod, Connection connection, String temp) throws SQLException {
        PreparedStatement statement = connection.prepareStatement(temp);
        statement.setString(1, String.valueOf(clientId));
        statement.setString(2, String.valueOf(carId));
        statement.setString(3, orderDate);
        statement.setString(4, paymentMethod);
        int rowsUpdated = statement.executeUpdate();
    }

    static void deleteOrder(int orderId) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "delete from salon.zamowienia where idZamowienia = " + orderId;
        try {
            PreparedStatement statement = connection.prepareStatement(temp);
            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) System.out.println("Zamowienie usuniete!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static boolean checkQuantity(int carId) throws SQLException {
        ResultSet resultSet = executeQuery("select sztuk from salon.stan_magazynowy where idSamochodu = " + carId);
        return resultSet.next();

    }

    static void addOrder(int clientId, int carId, String orderDate, String paymentMethod) throws SQLException {
        if (checkQuantity(carId)) {
            Connection connection = DatabaseConnection();
            String temp = "insert into salon.zamowienia(idKlienta, idSamochodu, data_zamowienia, metoda_platnosci) " +
                    "values (?, ?, ?, ?)";
            try {
                orderEdit(clientId, carId, orderDate, paymentMethod, connection, temp);
                int rowsInserted = 0;
                if (rowsInserted > 0) System.out.println("Zamowienie dodane!");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
            decrementQuantity(carId);
        }

        else System.out.println("Brak tego samochodu na stanie!");
    }

    static void addCar(int brandId, int modelId, int configId) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "insert into salon.samochody(idMarki, idModelu, idKonfiguracji) values (?, ?, ?)";
        try {
            PreparedStatement statement = connection.prepareStatement(temp);
            statement.setString(1, String.valueOf(brandId));
            statement.setString(2, String.valueOf(modelId));
            statement.setString(3, String.valueOf(configId));
            int rowsInserted = statement.executeUpdate();
            if(rowsInserted > 0 ) System.out.println("Samochód dodany!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static void addQuantity(int carId, int quantity) throws SQLException {
        Connection connection = DatabaseConnection();
        if(!checkQuantity(carId)) {
            String temp = "insert into salon.stan_magazynowy(idSamochodu, sztuk) values (?, ?)";
            try {
                PreparedStatement statement = connection.prepareStatement(temp);
                statement.setString(1, String.valueOf(carId));
                statement.setString(2, String.valueOf(quantity));
                int rowsInserted = statement.executeUpdate();
                if (rowsInserted > 0) System.out.println("Nowy towar dodany do magazynu!");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
        else {
            String temp = "update salon.stan_magazynowy set sztuk = sztuk + " + quantity + " " +
                    "where idSamochodu = " + carId;
            try {
                PreparedStatement statement = connection.prepareStatement(temp);
                int rowsUpdated = statement.executeUpdate();
                if (rowsUpdated > 0 ) System.out.println("Stan magazynowy zwiekszony!");
            } catch (SQLException throwables) {
                throwables.printStackTrace();
            }
        }
    }

    static void decrementQuantity(int carId) throws SQLException {
        Connection connection = DatabaseConnection();
        String temp = "update salon.stan_magazynowy set sztuk = sztuk - 1 where idSamochodu = " + carId;
        try {
            PreparedStatement statement = connection.prepareStatement(temp);
            int rowsUpdated = statement.executeUpdate();
            if (rowsUpdated > 0) System.out.println("Stan magazynowy zaktualizowany!");
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    static void listAllCars(int orderBy) throws SQLException {
        ResultSet resultSet = executeQuery("select mar.nazwa as Marka, mo.nazwa as Model, nad.nazwa as Nadwozie, " +
                "sil.rodzaj_paliwa as Paliwo, sil.pojemnosc as Pojemnosc, sil.uklad as Uklad, sil.moc as Moc, " +
                "sil.moment_obrotowy as Moment_obrotowy, kon.kolor as Kolor from samochody s inner join marki mar on " +
                "s.idMarki = mar.idMarki inner join modele mo on s.idModelu = mo.idModelu inner join konfiguracje kon " +
                "on s.idKonfiguracji = kon.idKonfiguracji inner join nadwozia nad on kon.idNadwozia = nad.idNadwozia " +
                "inner join silniki sil on kon.idSilnika = sil.idSilnika order by " + orderBy);

        while (resultSet.next()) System.out.println(resultSet.getString(1) + " | " +
                resultSet.getString(2) + " | " + resultSet.getString(3) + " | " +
                resultSet.getString(4) + " | " + resultSet.getDouble(5) + " | " +
                resultSet.getString(6) + " | " + resultSet.getInt(7) + " | " +
                resultSet.getInt(8) + " | " + resultSet.getString(9));

    }

    static void listAvailableCars(int orderBy) throws SQLException {
        ResultSet resultSet = executeQuery("select mar.nazwa as Marka, mo.nazwa as Model, nad.nazwa as Nadwozie, " +
                "sil.rodzaj_paliwa as Paliwo, sil.pojemnosc as Pojemnosc, sil.uklad as Uklad, sil.moc as Moc, " +
                "sil.moment_obrotowy as Moment_obrotowy, kon.kolor as Kolor, sm.sztuk as Dostepnych_Szt from samochody s inner join marki mar on " +
                "s.idMarki = mar.idMarki inner join modele mo on s.idModelu = mo.idModelu inner join konfiguracje kon " +
                "on s.idKonfiguracji = kon.idKonfiguracji inner join nadwozia nad on kon.idNadwozia = nad.idNadwozia " +
                "inner join silniki sil on kon.idSilnika = sil.idSilnika inner join stan_magazynowy sm " +
                "on s.idSamochodu = sm.idSamochodu where sm.sztuk > 0 order by " + orderBy);

        while (resultSet.next()) System.out.println(resultSet.getString(1) + " | " +
                resultSet.getString(2) + " | " + resultSet.getString(3) + " | " +
                resultSet.getString(4) + " | " + resultSet.getDouble(5) + " | " +
                resultSet.getString(6) + " | " + resultSet.getInt(7) + " | " +
                resultSet.getInt(8) + " | " + resultSet.getString(9) + " | " +
                resultSet.getInt(10));

    }
    static void viewChosen (int choice, String filterBy) throws SQLException {
        String filterByQuery = "";
        switch(choice) {
            case 1:
                filterByQuery = "mar.nazwa = '" + filterBy + "'";
                break;
            case 2:
                filterByQuery = "sil.rodzaj_paliwa = '" + filterBy + "'";
                break;
            case 3:
                filterByQuery = "kon.kolor = '" + "'";
                break;
        }
        ResultSet resultSet = executeQuery("select mar.nazwa as Marka, mo.nazwa as Model, nad.nazwa as Nadwozie, " +
                "sil.rodzaj_paliwa as Paliwo, sil.pojemnosc as Pojemnosc, sil.uklad as Uklad, sil.moc as Moc, " +
                "sil.moment_obrotowy as Moment_obrotowy, kon.kolor as Kolor from samochody s inner join marki mar on " +
                "s.idMarki = mar.idMarki inner join modele mo on s.idModelu = mo.idModelu inner join konfiguracje kon " +
                "on s.idKonfiguracji = kon.idKonfiguracji inner join nadwozia nad on kon.idNadwozia = nad.idNadwozia " +
                "inner join silniki sil on kon.idSilnika = sil.idSilnika where " + filterByQuery);

        while (resultSet.next()) System.out.println(resultSet.getString(1) + " | " +
                resultSet.getString(2) + " | " + resultSet.getString(3) + " | " +
                resultSet.getString(4) + " | " + resultSet.getDouble(5) + " | " +
                resultSet.getString(6) + " | " + resultSet.getInt(7) + " | " +
                resultSet.getInt(8) + " | " + resultSet.getString(9));
    }

}
